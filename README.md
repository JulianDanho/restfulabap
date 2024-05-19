# Kapitel 4: Entity Manipulation Language (EML)

Willkommen im Branch für Kapitel 4 des Projekts **RESTful ABAP**. In diesem Kapitel werden Sie in die Entity Manipulation Language (EML) eingeführt, eine neue Ergänzung zu ABAP, die speziell für das ABAP RESTful Application Programming Model (RAP) entwickelt wurde.

## Überblick über Kapitel 4

Im vorherigen Kapitel haben wir das RAP-Modell "Travel" aufgebaut, von der Definition der Datenstrukturen bis zur Bereitstellung eines RESTful-Services. Dieses Modell dient uns nun als Grundlage, um die tiefgehenden Möglichkeiten der EML zu erkunden.

### Was ist die Entity Manipulation Language (EML)?

EML erweitert ABAP um neue Sprachbefehle, die speziell für die Arbeit mit dem RAP-Modell entwickelt wurden. Anstatt ein webbasiertes Frontend zu verwenden, können Sie mit EML die Behavior Definition direkt aus ABAP-Programmen aufrufen. Dies bedeutet, dass Sie das Coding für Business Objekte nur einmal schreiben müssen und es sowohl für Applikationen als auch für CRUD-Operationen in ABAP-Programmen nutzen können.

### Anwendungsfälle von EML

- **Zugriff auf den transaktionalen Puffer**: EML ermöglicht den Zugriff auf Daten, die noch nicht in der Datenbank gespeichert sind, sondern im transaktionalen Puffer gehalten werden.
- **CRUD-Operationen aus ABAP-Programmen**: Nutzen Sie die CRUD-Operationen (Create, Read, Update, Delete) direkt in Ihren ABAP-Programmen.
- **Integration von BOs**: Wiederverwenden Sie bestehende Validations, CRUD-Operationen und Aktionen über verschiedene Business Objekte hinweg.
- **Unit Tests**: Schreiben Sie Unit Tests mithilfe von EML, um die Code-Qualität sicherzustellen.

### EML-Befehle und Implementierungen

#### Lesen von Daten (READ)
Erfahren Sie, wie Sie mit dem Befehl `READ ENTITIES OF` Daten aus Ihrem RAP-Modell lesen können, und sehen Sie ein konkretes Beispiel, wie die Daten in der Konsole ausgegeben werden.

#### Aktualisieren von Daten (UPDATE)
Lernen Sie die Syntax für das Aktualisieren von Daten mit dem Befehl `MODIFY ENTITIES OF` kennen und implementieren Sie eine Methode, die die Daten aktualisiert und die Änderungen anzeigt.

#### Anlegen von Daten (CREATE)
Verstehen Sie, wie Sie neue Daten mit `MODIFY ENTITIES OF` anlegen, und implementieren Sie eine Methode, die neue Datensätze erstellt und diese in der Konsole ausgibt.

#### Löschen von Daten (DELETE)
Erfahren Sie, wie Sie mit `MODIFY ENTITIES OF` Daten löschen können, und implementieren Sie eine Methode, die einen Datensatz löscht und die erfolgreiche Löschung bestätigt.

## Ziel des Kapitels

Das Ziel dieses Kapitels ist es, Ihnen die neuen Möglichkeiten der Entity Manipulation Language (EML) näherzubringen und Ihnen zu zeigen, wie Sie diese effektiv in Ihren ABAP-Programmen nutzen können. Mit diesem Wissen können Sie die Vorteile von RAP voll ausschöpfen und leistungsfähige, flexible Anwendungen entwickeln.

---

Erkunden Sie die Möglichkeiten der Entity Manipulation Language und erweitern Sie Ihre Fähigkeiten im Umgang mit dem ABAP RESTful Application Programming Model. Viel Erfolg und Spaß beim Programmieren!
