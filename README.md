# H-BRS Thesisvorlage <!-- omit in toc -->

Diese Dokumentvorlage ist ein Ansatz eine modernere, zuverlässiger konfigurierte und einfacher zu verwendende LaTeX-Vorlage zum Schreiben von Abschlussarbeiten und Projektberichten zur Verfügung zu stellen.

## Inhalt <!-- omit in toc -->
- [Roadmap](#roadmap)
- [Setup](#setup)
  - [Overleaf](#overleaf)
  - [VS Code](#vs-code)
    - [Manuell](#manuell)
    - [Container](#container)

## Roadmap

* [x] Klassendatei bereitstellen, die ohne großen Aufwand verwendet werden kann.
* [ ] Setup Guide für:
  * [x] Overleaf
  * [ ] VS Code
    * [x] Manuell
    * [ ] Container
    * [ ] Dev Container
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

### VS Code

Für VS Code gibt es unterschiedlichste Möglichkeiten diese Vorlage zu nutzen. Wird eine Open Source Variante von VS Code verwendet ([Code - OSS](https://github.com/microsoft/vscode), [VSCodium](https://vscodium.com/)) können [Dev Container](https://containers.dev/) leider nicht verwendet werden [(danke Microsoft!)](https://github.com/microsoft/vscode-remote-release/issues/1886#issuecomment-561493608). Für die folgende Installationsanleitung sollte also VS Code und entsprechende Erweiterungen installiert werden:

**VS Code:**
- Visual Studio Code
  - Windows: [Visual Studio Code](https://code.visualstudio.com/)
  - macOS: [Visual Studio Code](https://code.visualstudio.com/) (Microsoft Build)
  - Ubuntu: [Visual Studio Code](https://code.visualstudio.com/) (Microsoft Build)
  - Arch: `sudo pacman -S code` (open source), `yay -S visual-studio-code-bin` (official binary version)
  - Fedora: [Visual Studio Code](https://code.visualstudio.com/) (Microsoft Build)

**Erweiterungen:**
- [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop)
- [LTeX](https://marketplace.visualstudio.com/items?itemName=valentjn.vscode-ltex) (empfohlen)

#### Manuell

**Notwendige Software:**
- [TeX Live Full](https://tug.org/texlive/)
  - Windows: [install-tl-windows.exe](https://tug.org/texlive/windows.html) herunterladen und ausführen.
    - Im Fenster `TeX Live Installationsprogramm` unten links `Fortgeschritten` auswählen.
    - In der größeren Auswahl lediglich die Option `Installiere TeXworks als Frontend` abwählen (wir verwenden ja schließlich VS Code).
    - Dauer der Installation je nach Internetverbindung: **ca. 1,5 Stunden**
  - macOS: [MacTeX](https://www.tug.org/mactex/mactex-download.html)
  - Ubuntu: `sudo apt install texlive-full`
  - Arch (AUR): `yay -S texlive-full`
  - Fedora: `sudo dnf install texlive-scheme-full`

<!-- - (eventuell muss noch `biber` über die TeX Live Paketverwaltung heruntergeladen werden mit `tlmgr install biber`) -->

Nach der Installation der Software und der Extensions müssen die Einstellungen in VS Code noch angepasst werden. Über das Menü `Anzeigen` → `Befehlspalette` die Befehlspalette öffnen und dort `Benutzereinstellungen` eingeben und `Einstellungen: Benutzereinstellungen öffnen (JSON)` auswählen. In die Einstellungen wird dann je nach Betriebssystem die Einstellung aus `assets/settings/linux_mac.json` bzw. `assets/settings/windows.json` eingefügt.


#### Container

**Notwendige Software:**
  - Entweder [Docker Desktop](https://docs.docker.com/desktop/)
  - oder [Docker Engine](https://docs.docker.com/engine/)



<!-- 
### Dev Container
**Notwendige Software:**
- Visual Studio Code
  - Windows: [Visual Studio Code](https://code.visualstudio.com/)
  - Ubuntu: [Visual Studio Code](https://code.visualstudio.com/) (Microsoft Build)
  - Arch: `sudo pacman -S code` (open source), `yay -S visual-studio-code-bin` (official binary version)
  - Fedora: [Visual Studio Code](https://code.visualstudio.com/) (Microsoft Build)

**Extensions**
- [Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) **Geht nur mit den Microsoft und offiziellen Versionen**


Vor der Verwendung des Templates sollte sichergestellt werden, dass [Inkscape](https://inkscape.org/de/), [Python](https://www.python.org) und das Pythonpaket [Pygments](https://pygments.org/) auf dem System installiert sind.

Danach kann die Ordnerstruktur `template` einfach als Vorlage für das Dokument verwendet werden. `Document.tex` ist die Hauptdatei, in der alles geschrieben oder mit `\input` importiert wird. Ich empfehle die Aufteilung der Kapitel/Abschnitte in einzelne Dateien in den Ordner `chapter`. Als Klassenoption muss mindestens die Sprachangabe `german` oder `english` gegeben werden.

Angaben über den Titel des Dokuments, den Autor usw. finden sich unter `template/assets/utility/meta.tex`. Das muss einmal gesetzt werden und bleibt dann in der Regel fix. Für den Buildprozess sollte `latexmk` verwendet werden.

⚠️ Weitere Informationen für die Verwendung der Klasse folgen im Beispieldokument. ⚠️ -->
