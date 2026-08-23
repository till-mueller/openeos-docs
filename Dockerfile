# syntax=docker/dockerfile:1

############################################
# Stage 1 – Build the static Docusaurus site
############################################
FROM node:22-alpine AS build

# pnpm via corepack
RUN corepack enable && corepack prepare pnpm@11.5.0 --activate

WORKDIR /app

# Install dependencies first (better layer caching).
# pnpm-workspace.yaml already lists the two packages that actually need a
# postinstall script (onlyBuiltDependencies: @swc/core, core-js) — that's
# enough for a non-interactive install on its own. The DANGEROUSLY_ALLOW_ALL_
# BUILDS override this used to carry was redundant with that allowlist, and
# meant any *new* dependency with a postinstall script would run it silently
# instead of failing the build with ERR_PNPM_IGNORED_BUILDS until someone
# deliberately added it to the allowlist.
COPY package.json pnpm-lock.yaml pnpm-workspace.yaml ./
RUN pnpm install --frozen-lockfile

# Copy the rest and build both locales (de + en)
COPY . .
# Call the Docusaurus binary directly to avoid pnpm's dependency-status check
RUN node ./node_modules/@docusaurus/core/bin/docusaurus.mjs build

############################################
# Stage 2 – Serve with nginx
############################################
FROM nginx:1.27-alpine AS runtime

# Drop the default site config and add ours
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d/openeos-docs.conf

# Static output (de at /, en at /en/)
COPY --from=build /app/build /usr/share/nginx/html

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget -q -O /dev/null http://127.0.0.1/ || exit 1

CMD ["nginx", "-g", "daemon off;"]
