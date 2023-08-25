# H-BRS Thesisvorlage

Diese Dokumentvorlage ist ein Ansatz eine modernere, zuverlässiger konfigurierte und einfacher zu verwendende LaTeX-Vorlage zum Schreiben von Abschlussarbeiten und Projektberichten zur Verfügung zu stellen.

## Roadmap

[x] Klassendatei bereitstellen, die ohne großen Aufwand verwendet werden kann.
[ ] Setup Guide für VS Code, Overleaf und vielleicht noch andere Editoren bereitstellen.
[ ] Beispieldokument erstellen, in denen die wichtigsten Eigenschaften der LaTeX-Klasse gezeigt und erklärt werden.
[ ] Docker Container erstellen, der das Bauen übernimmt ohne, dass die Dateien auf dem Rechner installiert sein müssen.
[ ] Kleines Programm erstellen was erlaubt die notwendigen Dateien als Template herunterzuladen und direkt mit dem Schreiben anzufangen.

## Verwendung

Vor der Verwendung des Templates sollte sichergestellt werden, dass [Inkscape](https://inkscape.org/de/), [Python](https://www.python.org) und das Pythonpaket [Pygments](https://pygments.org/) auf dem System installiert sind.

Danach kann die Ordnerstruktur `template` einfach als Vorlage für das Dokument verwendet werden. `Document.tex` ist die Hauptdatei, in der alles geschrieben oder mit `\input` importiert wird. Ich empfehle die Aufteilung der Kapitel/Abschnitte in einzelne Dateien in den Ordner `chapter`. Als Klassenoption muss mindestens die Sprachangabe `german` oder `english` gegeben werden.

Angaben über den Titel des Dokuments, den Author usw. finden sich unter `template/assets/utility/meta.tex`. Das muss einmal gesetzt werden und bleibt dann in der Regel fix. Für den Buildprozess sollte `latexmk` verwendet werden. Ein Setup Guide 

Weitere Informationen für die Verwendung der Klasse folgen im Beispieldokument.