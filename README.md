# H-BRS Thesisvorlage <!-- omit in toc -->

Diese Dokumentvorlage ist ein Ansatz eine modernere, zuverlässiger konfigurierte und einfacher zu verwendende LaTeX-Vorlage zum Schreiben von Abschlussarbeiten und Projektberichten zur Verfügung zu stellen.

## Inhalt <!-- omit in toc -->
- [Roadmap](#roadmap)
- [Setup](#setup)
  - [Overleaf](#overleaf)

## Roadmap

* [x] Klassendatei bereitstellen, die ohne großen Aufwand verwendet werden kann.
* [ ] Setup Guide für:
  * [x] Overleaf
  * [ ] VS Code
* [ ] Beispieldokument erstellen, in denen die wichtigsten Eigenschaften der LaTeX-Klasse gezeigt und erklärt werden (in Arbeit, siehe `Documentation.pdf`).
* [x] Docker Container erstellen, der das Bauen übernimmt ohne, dass die Dateien auf dem Rechner installiert sein müssen.
* [ ] Kleines Programm erstellen was erlaubt die notwendigen Dateien als Template herunterzuladen und direkt mit dem Schreiben anzufangen.

## Setup

Lade dieses Projekt entweder als `.zip`-Datei herunter und entpacke es oder Klone das Projekt über die URL `https://github.com/blackapple113/H-BRS-Thesisvorlage.git`. Navigiere danach in das Projektverzeichnis um den beschriebenen Setup-Möglichkeiten folgen zu können.

<div align="center">

![Download project](assets/images/github_download_project.png)

</div>

### Overleaf
Komprimiere den Ordner `template` in eine `.zip`-Datei. Gehe dann auf [Overleaf](https://overleaf.com) und Logge dich ein. Nach dem Einloggen oben links auf den Button `Neues Projekt` klicken und im Menü die Option `Projekt hochladen` auswählen.

<div align="center">

![Overleaf upload project](assets/images/overleaf_upload_project.png)

</div>

Im erscheinenden Fenster kann die vorher erstellte `.zip`-Datei per *Drag and Drop* hochgeladen werden. Nach dem Hochladen wird das Kompilieren automatisch angestoßen und das Deckblatt sollte nach kurzer Zeit erscheinen.

<div align="center">

![Overleaf compiled new project](asset/../assets/images/overleaf_compiled_new_project.png)

</div>

Zu Beginn sollten die Angaben auf dem Deckblatt angepasst werden. Diese befinden sich unter `assets/utility/meta.tex`. Jetzt kann das Schreiben beginnen. 

**Viel Erfolg!**

Vor der Verwendung des Templates sollte sichergestellt werden, dass [Inkscape](https://inkscape.org/de/), [Python](https://www.python.org) und das Pythonpaket [Pygments](https://pygments.org/) auf dem System installiert sind.

Danach kann die Ordnerstruktur `template` einfach als Vorlage für das Dokument verwendet werden. `Document.tex` ist die Hauptdatei, in der alles geschrieben oder mit `\input` importiert wird. Ich empfehle die Aufteilung der Kapitel/Abschnitte in einzelne Dateien in den Ordner `chapter`. Als Klassenoption muss mindestens die Sprachangabe `german` oder `english` gegeben werden.

Angaben über den Titel des Dokuments, den Autor usw. finden sich unter `template/assets/utility/meta.tex`. Das muss einmal gesetzt werden und bleibt dann in der Regel fix. Für den Buildprozess sollte `latexmk` verwendet werden.

⚠️ Weitere Informationen für die Verwendung der Klasse folgen im Beispieldokument. ⚠️
