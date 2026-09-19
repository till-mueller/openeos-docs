---
sidebar_position: 15.5
title: Finanzamt & TSE
description: TSE einrichten und wissen, welchen Export Sie wann brauchen – Auswertung, TSE-Export oder DSFinV-K-Export.
---

# Finanzamt & TSE

Wenn Ihr Verein umsatzsteuerpflichtig ist oder aus anderen Gründen eine **Technische Sicherheitseinrichtung (TSE)** nach der Kassensicherungsverordnung (KassenSichV) benötigt, richten Sie diese unter **Einstellungen → Organisation → TSE** ein. Dieses Kapitel erklärt, was danach passiert – und vor allem: **welchen der drei Exporte Sie wann brauchen.**

:::info[Muss mein Verein das nutzen?]
Nicht jeder Verein braucht eine TSE. Vereine ohne Umsatzsteuerpflicht (§ 19 UStG, Kleinunternehmerregelung) können die TSE-Funktion ignorieren. Im Zweifel fragen Sie Ihren Steuerberater oder Kassenfachhändler.
:::

## Drei Exporte, drei Zwecke

OpenEOS bietet drei verschiedene Exporte, die auf den ersten Blick ähnlich aussehen, aber unterschiedliche Zwecke erfüllen:

| Export | Wo | Wofür | Finanzamt-tauglich? |
| --- | --- | --- | --- |
| **Auswertung (CSV)** | [Auswertung](./auswertung.md) | Vorstandsabrechnung, Umsatzüberblick | Nein |
| **TSE-Export (Rohdaten)** | Einstellungen → TSE | Übergabe der TSE-Hardware an den nächsten Verein | Teilweise (nur Signaturprotokoll) |
| **DSFinV-K-Export** | Einstellungen → DSFinV-K-Export | Betriebsprüfung, Endabrechnung, 10-jährige Aufbewahrung | Ja |

### Auswertung (CSV) – für den Vorstand, nicht fürs Finanzamt

Die [Auswertung](./auswertung.md) exportiert Umsatzzahlen als einfaches CSV für Excel oder Ihre Buchhaltung. Sie enthält **keine** TSE-Signaturen und erfüllt keine Kassensicherungsverordnung – nutzen Sie sie ausschließlich für die interne Abrechnung mit dem Vorstand.

### TSE-Export (Rohdaten) – nur bei geteilter Hardware

Wenn sich mehrere Vereine dieselbe TSE-Hardware teilen (z. B. bei einem Wochenend-Verleihmodell mit gemeinsamer Kassen-Hardware), lädt dieser Export das reine Signaturprotokoll eines Zeitraums herunter. Das sichert Ihre eigene Aufbewahrungspflicht für die Zeit, in der Sie die Hardware genutzt haben – unabhängig davon, wer sie danach nutzt.

### DSFinV-K-Export – der eigentliche Finanzamt-Export

Das ist der Export, den eine Betriebsprüfung tatsächlich sehen will: strukturierte Stammdaten, Vorgänge, Zahlarten und das TSE-Signaturprotokoll gebündelt in einem ZIP, nach dem offiziellen DSFinV-K-Format. Sie finden ihn unter **Einstellungen → DSFinV-K-Export**.

Es gibt zwei Varianten:

- **Export für alle Kassen** – ein Klick, exportiert jede Kasse, die bei diesem Event benutzt wurde, in einem gemeinsamen ZIP. Das ist der Export für die **Endabrechnung nach der Veranstaltung**.
- **Nur eine Kasse exportieren** – exportiert eine einzelne Kasse. Das ist der Export für eine **Kassen-Nachschau während der Veranstaltung**, wenn ein Prüfer unangekündigt eine bestimmte Kasse sehen will.

:::warning[Jeder Export ist endgültig]
Ein DSFinV-K-Export ist kein "Vorschau"-Button – jeder Aufruf schließt den Zeitraum seit dem letzten Export dieser Kasse **endgültig ab** (Kassenabschluss mit fortlaufender Z_NR, gesetzlich vorgeschrieben lückenlos). Rufen Sie ihn deshalb nur auf, wenn Sie den Export tatsächlich brauchen – nicht zum Testen. Ein zweiter Export direkt danach liefert "nichts zu exportieren", solange es keine neuen Bestellungen gab, und das ist beabsichtigt, kein Fehler.
:::

## Wann exportiere ich was?

- **Während der Veranstaltung, Kassen-Nachschau durch einen Prüfer:** DSFinV-K-Export für die betroffene Kasse, sofort, ohne Vorbereitung nötig.
- **Am Ende der Veranstaltung:** DSFinV-K-Export für alle Kassen, einmal. Diese Datei bewahren Sie mindestens 10 Jahre auf (gesetzliche Aufbewahrungspflicht).
- **Die TSE-Hardware wechselt zum nächsten Verein:** zusätzlich den TSE-Export (Rohdaten) für Ihren Nutzungszeitraum sichern.
- **Zwischenstand für den Vorstand, keine steuerliche Relevanz:** die normale [Auswertung](./auswertung.md), nicht die TSE-Exporte.

## TSE einrichten

Unter **Einstellungen → Organisation → TSE** wählen Sie einen Anbieter:

- **fiskaly (Cloud)** – TSE läuft in der Cloud, keine eigene Hardware nötig. Mit **TSS erstellen** richten Sie aus einem API-Key/Secret automatisch eine neue TSE ein.
- **Lokale Hardware** – ein USB-/SD-TSE-Stick, angeschlossen an einen Drucker-Agenten vor Ort. Signiert auch ohne Internetverbindung.

Mit **Verbindung testen** prüfen Sie, ob die TSE erreichbar ist, bevor Sie live gehen.
