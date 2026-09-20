---
sidebar_position: 1
title: Verfahrensdokumentation
description: Vorlage für die Verfahrensdokumentation (GoBD, KassenSichV) für den Einsatz von OpenEOS.
---

> **Entwurf — vor Verwendung anwaltlich prüfen lassen.**
>
> Diese Vorlage ist keine Rechtsberatung. Sie wird vom Betreiber an die eigene Organisation und die konkrete Einsatzweise angepasst und vor dem ersten produktiven Einsatz von einer Rechtsanwältin bzw. einem Rechtsanwalt oder einer sonst geeigneten Sachverständigen geprüft. OpenEOS übernimmt keine Gewähr für die rechtliche Richtigkeit des ausgefüllten Dokuments. Die mit **[ ]** gekennzeichneten Angaben sind vom Betreiber auszufüllen bzw. zu prüfen.

# Verfahrensdokumentation OpenEOS

**Organisation (Betreiber):** **[Name, Rechtsform, Sitz]**

**Anschrift / Betriebsstätte(n):** **[Anschrift, ggf. weitere Betriebsstätten]**

**Kassenführer (verantwortliche Person):** **[Name, Funktion]**

**Stand:** **[Datum]** · **Bereich:** **[z. B. Gesamtbetrieb / Betriebsstätte / einzelne Veranstaltungen]**

---

## 1. Zweck & Geltungsbereich

Diese Verfahrensdokumentation beschreibt das Kassen- und Aufzeichnungssystem des Betreibers und die damit verbundenen organisatorischen Abläufe. Sie dokumentiert gegenüber der Finanzverwaltung, dass die Grundsätze zur ordnungsgemäßen Führung und Aufbewahrung von Büchern, Aufzeichnungen und Unterlagen (GoBD) sowie die Anforderungen des § 146a AO und der KassenSichV eingehalten werden.

Geltungsbereich ist das Kassensystem **OpenEOS** einschließlich aller Komponenten, eingesetzten Kassen, zugehörigen Auswertungen, Exportschnittstellen und Aufbewahrungspflichten des Betreibers [Namen, Standorte]. Soweit weitere Systeme (z. B. eigenständige Vereinssysteme oder Excel-Lösungen) betroffen sind, werden diese gesondert dokumentiert.

## 2. Systemübersicht

OpenEOS ist eine browserbasierte Kassen- und Vereinsverwaltungsplattform. Die wesentlichen Komponenten sind:

| Komponente | Funktion |
| --- | --- |
| **OpenEOS-API** (zentrale Plattform) | Datenhaltung, Kassenvorgänge, Signierung über die TSE, Rechnungen, Auswertungen |
| **Web-App / Kasse (POS)** | Bedienoberfläche zum Kassieren (Bestellungen, Zahlungen, Storno) |
| **Shop** | Online-Bestellungen, bezogen auf die jeweilige Veranstaltung |
| **Drucker-Agent** | Anbindung von Bon- und Küchendruckern an das System |

Das System wird als Dienst vom Betreiber genutzt; die Anwendungsdaten liegen bei einem deutschen Hosting-Dienstleister (**Hetzner**, Rechenzentren in Deutschland). Die öffentliche Website des Anbieters wird bei **IONOS** gehostet. Die für den Kassenbetrieb erforderliche zentrale Infrastruktur und die Zugangswege werden in den [TOMs](./toms.md) beschrieben.

## 3. TSE / KassenSichV

Die fiskalisch relevanten Vorgänge werden über eine **zugelassene technische Sicherungseinrichtung (TSE)** signiert. Eingesetzt wird die **fiskaly Cloud-TSE (SIGN DE)**, die nach KassenSichV vom BSI zertifiziert ist.

- Je Organisation wird genau **eine fiskaly TSS** (Trusted Service Suite) eingerichtet; alle Kassen der Organisation nutzen diese TSS.
- Jede Kasse (jedes Kassengerät) ist als **eigener TSE-Client** registriert und damit in den Signaturdaten eindeutig identifizierbar.
- Jede Zahlung wird **vor Belegdruck signiert**; Signaturdaten und der **QR-Code** des Signaturdatensatzes werden auf jedem Beleg ausgegeben.
- Die Signaturdaten (Seriennummer, Signaturwert, Signaturzähler, Zeitstempel) werden maschinenlesbar gespeichert und sind über den Beleg sowie die Systemauswertungen nachvollziehbar.

## 4. TSE-Ausfall („Ausfall-Regelung")

Für den Fall einer nicht verfügbaren TSE (z. B. Verbindungsausfall zur fiskaly-Cloud-TSE) gilt im System:

- Der Verkauf wird **nicht blockiert**; die Zahlung wird mit dem Vermerk **`tseData.failed: true`** inklusive des Fehlergrundes gespeichert.
- Eine **nachträgliche Signierung** dieser Vorgänge mit einem früheren Zeitstempel erfolgt nicht (eine Signatur mit rückdatiertem Zeitpunkt würde den Sinn der Signatur verfälschen). Der Ausfall bleibt dauerhaft als solcher dokumentiert.
- Die betroffenen Vorgänge sind über die **Berichts- und Exportfunktionen** nachvollziehbar. Der Betreiber prüft nach einem Ausfall den betroffenen Zeitraum und **dokumentiert das Vorgehen** (Ursache, Zeitraum, betroffene Vorgänge) in einem Ausfallvermerk:

> **Ausfallvermerk Nr.:** **[ ]** · **Zeitraum:** **[ ]** · **betroffene Kasse(n)/Vorgänge:** **[ ]** · **Ursache:** **[ ]** · **Veranlasste Überprüfung:** **[ ]** · **Bearbeiter/in:** **[ ]**

## 5. Storno (Gegenbuchung)

Stornierungen erfolgen **ausschließlich durch eine signierte Gegenbuchung (Reversal)**, die auf den ursprünglichen Beleg verweist.

- Der Originalbeleg bleibt unverändert und signiert erhalten.
- Es gibt keine nachträgliche Änderung oder Löschung bereits signierter Belege.
- Stornierte Beträge sind über die Kassenabschlüsse und Auswertungen nachvollziehbar.

## 6. Umsatzsteuer-Aufteilung

Die steuerlichen Beträge werden je Vorgang auf die Umsatzsteuersätze aufgeteilt:

- Bei **Teilzahlungen** (positionsbasiert) erfolgt die Aufteilung **positionsgenau**.
- Bei **pauschalen Zahlungen** (Gesamtbetrag) erfolgt eine **anteilige** Aufteilung auf die enthaltenen Umsatzsteuersätze.
- **Pfand** wird innerhalb dieser Aufteilung **anteilig verteilt**. Hierbei handelt es sich um eine dokumentierte Vereinfachung; die konkrete Aufteilung auch von Pfand wird durch die TSE-Signatur abgedeckt.

## 7. DSFinV-K-Export

Der Betreiber erstellt **Kassenabschlüsse** pro Kasse und Veranstaltung (Tagesabschluss/T-Abschluss). Je Abschluss wird ein

- **DSFinV-K-Export** erzeugt: eine **ZIP-Datei mit den CSV-Dateien des Exports und der `index.xml`** als Nachweis- und Prüfdatei.

Die Kassenabschlüsse sowie die DSFinV-K-Exporte werden vom System archiviert und sind Teil der Aufbewahrung über die gesetzlichen Fristen (siehe Abschnitt 12).

## 8. TSE-Export

Die Signaturdaten der TSE können als **TSE-Export nach TR-03153 (TAR-Archiv)** erzeugt werden; der Export wird in den **Einstellungen → TSE** angestoßen. Der Export umfasst die **gesamte TSS** der Organisation (alle angeschlossenen Kassen). Die Exportdatei ist archivierungssicher aufzubewahren (siehe Abschnitt 12).

## 9. Rechnungsnummern

Rechnungen erhalten **fortlaufende, lückenlose Rechnungsnummern** im Format **`INV-YYYYMM-NNNN`** (Jahr und Monat sowie eine innerhalb des Monats fortlaufende Nummer). Die Vergabe erfolgt **atomar im System**; Rechnungsnummern werden dabei nicht doppelt vergeben. Eine etwaige Neusortierung oder nachträgliche Freigabe von Nummernkreisen ist zu unterlassen; bei manuellen Nummernänderungen ist dies zu dokumentieren: **[ ]**.

## 10. Benutzer- & Rollenkonzept

Der Zugriff auf das System erfolgt persönlich und passwortgeschützt:

- **Rollen:** **Admin** (Administrator) und **Mitglied** (Kassierer/in und weitere berechtigte Personen) mit je eigenen Berechtigungen.
- **Berechtigungen:** Rechtevergabe nach Funktion; nur berechtigte Personen können Kassenvorgänge durchführen oder Einstellungen ändern.
- **Nachvollziehbarkeit:** Administratoren verfügen über ein **Admin-Audit-Log**; kassenrelevante Handlungen werden protokolliert.
- **Sicherheit:** Zugriffssitzungen sind einzeln einsehbar und sperrbar; bei Verlust des Zugangs ist die Sperrung zu veranlassen: **[Ansprechpartner]**.

## 11. Datenschutz

Die Verarbeitung personenbezogener Daten durch OpenEOS erfolgt nach den Vorgaben der DSGVO und der vereinseigenen Datenschutzdokumentation (siehe [AVV-Vorlage](./avv-template.md) und [TOMs](./toms.md)).

- **Löschung durch Anonymisierung:** Personenbezogene Daten (z. B. Namen von Kunden/Mitgliedern) werden bei Löschung **anonymisiert/entfernt**; die **steuerlich relevanten Belegdaten bleiben** für die Aufbewahrungsfristen erhalten.
- Es werden **keine Tracking-Cookies** eingesetzt; **keine Verhaltenswerbung**, keine Reichweitenmessung ohne Einwilligung.

## 12. Aufbewahrungspflichten

- Steuerlich relevante Unterlagen werden über die gesetzlichen Fristen aufbewahrt (§ 147 AO: i. d. R. **10 Jahre**, für sonstige Informationen **8 Jahre**).
- Aufzubewahren sind insbesondere: Belege, Kassenabschlüsse, **DSFinV-K-Exporte** und **TSE-Exporte (TAR)**, Rechnungs- und Zahlungsdaten sowie diese Verfahrensdokumentation.
- **Prüfungszugriff (Z1/Z2/Z3):** Für Betriebsprüfungen sind die Daten als
  - **Z1** (sachlich und zeitlich unbeschränkter, unmittelbarer Zugriff auf gespeicherte Daten),
  - **Z2** (maschinelle Auswertbarkeit über DSFinV-K-/CSV-/Exportformate) und
  - **Z3** (Einsichtnahme in Datenträger)
  verfügbar zu halten. Die Exporte werden hierzu aufbewahrt und den Prüfungsbefugten auf Verlangen bereitgestellt.

## 13. § 146a AO – Kassenmeldepflicht (Checkliste für den Betreiber)

Kassen sind dem zuständigen Finanzamt nach § 146a AO i. V. m. der KassenSichV zu melden. Die Meldung erfolgt durch den Betreiber selbst (nicht durch das System). **Dieser Abschnitt ist mit dem zuständigen Finanzamt und der Rechtsberatung abzustimmen.**

| Prüfpunkt | Erledigt | Hinweis |
| --- | --- | --- |
| Kasse(n) beim zuständigen Finanzamt gemeldet (Anschaffung/Inbetriebnahme, innerhalb der gesetzlichen Frist) | ☐ | zuständiges Finanzamt: **[ ]** |
| **TSE-Seriennummer** der eingesetzten fiskaly-TSE erfasst und gemeldet | ☐ | Seriennummer aus Einstellungen → TSE: **[ ]** |
| **fiskaly TSS-ID** erfasst und gemeldet | ☐ | TSS-ID: **[ ]** |
| Meldung auch bei **Änderungen** (z. B. neue Kasse, Austausch der TSE) | ☐ | Änderungen werden laufend nachgetragen |

## 14. Änderungshistorie dieser Dokumentation

| Datum | Änderung | Bearbeitet von |
| --- | --- | --- |
| **[Datum]** | Erstfassung | **[Name]** |

---

*Ende der Vorlage. Vor dem Einsatz anwaltlich prüfen lassen und auf dem aktuellen Stand halten (vgl. Hinweis am Dokumentanfang).*