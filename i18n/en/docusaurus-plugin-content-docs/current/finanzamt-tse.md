---
sidebar_position: 15.5
title: Tax office & TSE
description: Set up TSE and know which export you need when – Reports, TSE export, or DSFinV-K export.
---

# Tax office & TSE

If your organisation is liable for VAT, or otherwise needs a **Technical Security Device (TSE)** under Germany's Kassensicherungsverordnung (KassenSichV), set it up under **Settings → Organisation → TSE**. This chapter explains what happens after that – and most importantly: **which of the three exports you need, and when.**

:::info[Does my organisation need this?]
Not every organisation needs a TSE. Organisations that aren't liable for VAT (small-business exemption, § 19 UStG) can ignore the TSE feature entirely. When in doubt, ask your tax advisor or till vendor.
:::

## Three exports, three purposes

OpenEOS offers three different exports that look similar at first glance but serve different purposes:

| Export | Where | For | Tax-office compliant? |
| --- | --- | --- | --- |
| **Reports (CSV)** | [Reports](./auswertung.md) | Board-level revenue overview | No |
| **TSE export (raw)** | Settings → TSE | Handing over TSE hardware to the next organisation | Partially (signature log only) |
| **DSFinV-K export** | Settings → DSFinV-K export | Tax audits, end-of-event closing, 10-year retention | Yes |

### Reports (CSV) – for the board, not the tax office

[Reports](./auswertung.md) exports revenue figures as a plain CSV for Excel or your bookkeeping. It contains **no** TSE signatures and doesn't satisfy the Kassensicherungsverordnung – use it only for internal reporting to the board.

### TSE export (raw) – only for shared hardware

If several organisations share the same TSE hardware (e.g. a weekend-rental model with shared till hardware), this export downloads the raw signature log for a date range. It covers your own retention obligation for the period you used the hardware, independent of whoever uses it next.

### DSFinV-K export – the actual tax-office export

This is the export an auditor actually wants to see: structured master data, transactions, payment types, and the TSE signature log bundled into one ZIP, in the official DSFinV-K format. You'll find it under **Settings → DSFinV-K export**.

There are two variants:

- **Export for all tills** – one click, exports every till used in this event into one combined ZIP. This is the export for **closing out after the event**.
- **Export a single till** – exports one till only. This is the export for an **on-the-spot audit (Kassen-Nachschau) during the event**, when an auditor wants to see one specific till.

:::warning[Every export is final]
A DSFinV-K export isn't a "preview" button – every call **permanently closes** the period since that till's last export (a closing with a sequential Z_NR, legally required to be gapless). Only trigger it when you actually need the export, not to test. Running it again right after will report "nothing to export" as long as there are no new orders, and that's expected, not a bug.
:::

## When do I export what?

- **During the event, an auditor requests a Kassen-Nachschau:** DSFinV-K export for the till in question, immediately, no preparation needed.
- **At the end of the event:** DSFinV-K export for all tills, once. Keep this file for at least 10 years (statutory retention period).
- **The TSE hardware moves on to the next organisation:** additionally save the TSE export (raw) for your own usage period.
- **A status update for the board, no tax relevance:** the regular [Reports](./auswertung.md) export, not the TSE exports.

## Setting up TSE

Under **Settings → Organisation → TSE**, choose a provider:

- **fiskaly (Cloud)** – TSE runs in the cloud, no dedicated hardware needed. Use **Create TSS** to set up a new TSE automatically from an API key/secret.
- **Local hardware** – a USB/SD TSE stick, connected to a printer agent on site. Signs even without an internet connection.

Use **Test connection** to check the TSE is reachable before going live.
