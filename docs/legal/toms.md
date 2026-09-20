---
sidebar_position: 3
title: TOMs
description: Technische und organisatorische Maßnahmen (Art. 32 DSGVO) für den Betrieb von OpenEOS.
---

> **Entwurf — vor Verwendung anwaltlich prüfen lassen.**
>
> Diese Vorlage ist keine Rechtsberatung. Sie beschreibt die technischen und organisatorischen Maßnahmen des OpenEOS-Systems und wird vom Betreiber an die eigene Organisation angepasst und vor Verwendung von einer Rechtsanwältin bzw. einem Rechtsanwalt oder einer geeigneten Sachverständigen geprüft. OpenEOS übernimmt keine Gewähr für die rechtliche Richtigkeit. Die mit **[ ]** gekennzeichneten Angaben sind vom Betreiber auszufüllen bzw. zu prüfen.

# Technische und organisatorische Maßnahmen (TOMs)

**Organisation (Verantwortlicher):** **[Name, Rechtsform, Sitz]**

**Stand:** **[Datum]** · **Zuordnung/Anlage zu:** [AVV-Vorlage](./avv-template.md)

Die nachfolgenden Maßnahmen dienen der Sicherheit der Verarbeitung nach **Art. 32 DSGVO** sowie der Vertraulichkeit, Integrität, Verfügbarkeit und Belastbarkeit der Systeme.

## 1. Hosting & Infrastruktur

- **App-Plattform:** Die OpenEOS-Anwendung wird auf Servern bei **Hetzner** gehostet; die **Rechenzentren liegen in Deutschland** (Hetzner, DE).
- **Öffentliche Website:** Die öffentliche Website des Anbieters wird bei **IONOS SE** gehostet (DE).
- **Zutritt/Standort:** Der physische Zugang zu den Rechenzentren unterliegt den Maßnahmen des jeweiligen Rechenzentrumsbetreibers; der Betreiber hat sich über die jeweiligen Zertifizierungen und Sicherheitsmaßnahmen zu informieren: **[Nachweis/Zertifizierung]** .
- **Eigenbetrieb (Datenverarbeitungsanlagen am Standort des Betreibers, falls vorhanden):** **[z. B. kein betrieblicher Server; oder: lokaler Server, Zutrittskontrolle, Aufbewahrung, USV]** .

## 2. Verschlüsselung (Übertragung, Speicherung, Authentifizierung)

- **Übertragung:** Die Kommunikation zwischen Client (Browser/App) und Server erfolgt ausschließlich über **TLS-verschlüsselte Verbindungen** (HTTPS).
- **Passwörter:** Passwörter werden **nicht im Klartext** gespeichert, sondern **gehasht** (Passwort-Hashing, u. a. bcrypt).
- **Zwei-Faktor-Authentifizierung:** Für Nutzerkonten ist eine **2FA per TOTP** verfügbar; der Einsatz wird für privilegierte Zugänge (z. B. Admin) empfohlen bzw. vom Betreiber geregelt: **[Pflicht ab Rolle]** .
- **Geräte-/Kassenzertifikate:** **[falls betrieben, z. B. gerätebezogene Zertifikate/Anmeldung der Kassengeräte]** .

## 3. Zugangskontrolle

- **Authentifizierung:** Anmeldung über **JWT (Access-Token)** und **httpOnly Refresh-Cookies**; die Token sind an die Sitzung gebunden.
- **Sitzungsverwaltung:** Sitzungen sind für den Nutzer **einzeln einsehbar** und können **gesperrt** werden (z. B. bei gerätebezogenem Login).
- **Rollen & Berechtigungen:** Rollenkonzept (Admin/Mitglied) mit rollen- und berechtigungsbasierter Zugriffssteuerung; Administratoren verwalten die Freigaben.
- **Zugangskontrolle/Access-Control:** Privilegierte Aktionen sind an die jeweilige Berechtigung gekoppelt; ein **Account-Locking** bei unberechtigten Zugriffsversuchen **[Details/Konfiguration]** .
- **Intern:** Berechtigungen auf Datenebene erfolgen organisationsbezogen; Zugriffe außerhalb der eigenen Organisation sind technisch unterbunden.

## 4. Nachvollziehbarkeit (Protokollierung)

- **Admin-Audit-Log:** Privilegierte Handlungen werden protokolliert, einschließlich **IP-Adresse** und **User-Agent**.
- **Kassenvorgänge:** Zahlungen werden mit **TSE-Signaturen** signiert (Signaturwert, -zähler, Zeitstempel, Seriennummer) sowie über **DSFinV-K- und TSE-Exporte** für Prüfungen vorgehalten.
- **Datenänderungen:** Änderungen bzw. Löschungen kritischer Daten erfolgen, wo erforderlich, als **Soft-Delete** (Kennzeichnung statt physischer Löschung), damit historische Sachverhalte rekonstruierbar bleiben.
- **Aufbewahrung der Protokolle:** **[eigene Richtlinie des Betreibers, z. B. Aufbewahrung der Audit-Protokolle über X Jahre]** .

## 5. Verfügbarkeit

- **Backups:** Die Daten werden regelmäßig **gesichert**; die Wiederherstellbarkeit im Ernstfall wird **periodisch getestet**: **[Backup-Rhythmus, Aufbewahrungsdauer, letzte Wiederherstellungsübung]** .
- **Monitoring:** Das System wird technisch **überwacht** (Verfügbarkeit, Fehler); Betriebsstörungen werden erkannt und behoben: **[Kontakt/Informationsweg]** .
- **Ausfallsicherheit:** **[z. B. Redundanz, Notfallkonzept des Betreibers — auszufüllen]** .

## 6. Datensparsamkeit

- **Datenminimierung:** Es werden nur die für den Betrieb erforderlichen Daten verarbeitet.
- **Löschung durch Anonymisierung:** Soweit personenbezogene Daten gelöscht werden, erfolgt dies durch **Anonymisierung/Entfernung** der Personenbezüge; steuerlich relevante Daten bleiben für die gesetzlichen Aufbewahrungsfristen erhalten.
- **Keine Tracking-Cookies:** Das System setzt **keine Tracking-Cookies** und betreibt keine verhaltensbasierte Werbung oder unbefugte Reichweitenmessung.
- **Verzeichnis der Verarbeitungstätigkeiten:** **[Verweis auf das Verzeichnis nach Art. 30 DSGVO des Betreibers]** .

## 7. Weisungsgebundenheit & Vertraulichkeit

- Das bei der Verarbeitung eingesetzte Personal wird über die **Vertraulichkeit** und die Anforderungen der DSGVO informiert bzw. verpflichtet.
- Die Verarbeitung erfolgt **weisungsgebunden** gemäß dem zugrunde liegenden Auftragsverarbeitungsvertrag ([AVV-Vorlage](./avv-template.md)); **Unterauftragsverhältnisse** sind in der Anlage **[Sub-Processor](./sub-processors.md)** geregelt.
- Die Parteien halten die Maßnahmen **auf aktuellem Stand**; wesentliche Änderungen werden dem Verantwortlichen mitgeteilt.

---

*Ende der Vorlage. Beim Einsatz die **[ ]**-Angaben vervollständigen und die TOMs zusammen mit der AVV-Vorlage anwaltlich prüfen lassen.*