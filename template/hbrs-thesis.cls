\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hbrs-thesis}[2024/03/06 LaTeX template with batteries included]


%%%% Defintion of class options %%%%
\newcommand{\thisdocumentclass}{scrartcl} % Default documentclass is scrartcl.
\newif\ifmodernstyle % Toggle to switch between modern and classic style.
\modernstyletrue % Default style to modern.
\newif\ifmmap % Toggle package mmap because of much warnings.
\mmapfalse % Default usage of package mmap to false
\newif\ifnoprint
\noprintfalse


\DeclareOption{article}{ % Sets the document in the article style.
  \renewcommand{\thisdocumentclass}{scrartcl}
}
\DeclareOption{report}{ % Sets the document in the report style.
  \renewcommand{\thisdocumentclass}{scrreprt}
}
\DeclareOption{book}{
  \noprinttrue % Sets the noprint option for normal book layout
  \renewcommand{\thisdocumentclass}{scrbook}
} % Until now there is no support to set this document as book style.

\DeclareOption{noprint}{ % Aligns the text area at an equal distance from both sides. Not recommended for printing the document
  \noprinttrue
}

\DeclareOption{modernstyle}{ % Sets the style to modern.
  \modernstyletrue
}

\DeclareOption{classicstyle}{ % Sets the style to classic.
  \modernstylefalse
}

\DeclareOption{mmap}{ % Disallows the usage of mmap. Worse copy out of pdf but also no warnings.
  \mmaptrue
}



%%%% Definition of package options %%%%
\newcommand{\thislanguage}{ngerman}
\newcommand{\thiscdeindex}{Codeverzeichnis}
\newif\ifglossaries
\glossariestrue

\DeclareOption{german}{ % Sets the main language in the document to german.
  \PassOptionsToPackage{ngerman}{babel}
  \renewcommand{\thislanguage}{ngerman}
  \renewcommand{\thiscdeindex}{Codeverzeichnis}
}

\DeclareOption{english}{ % Sets the main language in the document to english.
  \PassOptionsToPackage{english}{babel}
  \renewcommand{\thislanguage}{english}
  \renewcommand{\thiscdeindex}{Code index}
}

\DeclareOption{noglossaries}{
  \glossariesfalse
}

\ProcessOptions\relax % Executes the code for each option.


%%%% Load class %%%%
% Use KOMA-Script classes because it follows the rules of European typography.
% More information about KOMA-Script classes found here:
% https://www.ctan.org/pkg/koma-script
\LoadClass[
  % a4paper,             % Set standard paper format to DIN A4 for printing compatibility in Germany. There is no other Option right now.
  % pagesize,            % Corrects the output to PDF if other paper sizes are selected. It is recommended always to specify this option (see documentation).
  % footheight=15pt,     % Set footheight here and not in KOMAoptions because it does not work there.
]{\thisdocumentclass}


%%%% Required packages %%%%
\ifmmap
  \RequirePackage[noTeX]{mmap} % Allows better copying out of pdf. Should stay above inputenc and fontenc.
\else
\fi
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{scrhack} % Improves the compatibility of the KOMA classes with third-party packages.
\RequirePackage{babel} % Allow correct hyphenation in words.
\RequirePackage{scrlayer-scrpage} % Header and footer for KOMA-Script classes.
\RequirePackage[
  outputdir=out,
  newfloat
]{minted} % Codehighlighting that requires python and pygmentize to work.
\RequirePackage{tcolorbox} % Allows complex boxes arround nearly everything. Primarily used for code in this class.
\RequirePackage{float} % This style option also incorporates the functionality of David Carlisle’s style option here, giving floating environments a [H] option which means ‘PUT IT HERE’.
\RequirePackage{csquotes} % This package provides advanced facilities for inline and display quotations.
\ifmodernstyle
  \RequirePackage{cmbright}
\fi
\RequirePackage[
  backend=biber,
  style=ieee, % ieee style with biblatex is not 100% the correct ieee style but one can only fix this with natbib.
  isbn=false,
  url=true,
  doi=true,
  sortcites=true,
  bibencoding=utf8,
]{biblatex}
% Required for modern colors e.g. in plots:
\RequirePackage{xcolor} % Allows for complete new color shades and tones.
\RequirePackage{graphicx} % Allows the definition of complex colors in one color name.
\RequirePackage{pgfplots} % Plots written in Python.
\RequirePackage{tikz} % Super complex graphics purely written in LaTeX.
\RequirePackage{caption} % Offers customization of captions in floating environments such as figure and table.
\RequirePackage[list=on,labelformat=simple,labelsep=colon]{subcaption} % Allows sub-captions for divided figures
\RequirePackage[
  inkscapelatex=false, % Prevents the text from being rendered in the font used. This preserves the in the image used font.
  inkscapepath=out/svg-inkscape % Sets the output-folder for compilation files.
]{svg} % Allows the use of SVG in LaTeX but requires the software Inkscape to be installed on the system.
\RequirePackage{wrapfig2} % Allows text to float around images in text.
\RequirePackage{mathtools} % Extension package to amsmath to correct bugs and provide useful tools.
\RequirePackage{amsfonts} % Contains fonts of symbols and several alphabets corresponding to symbols and alphabets used in AMS publications.
\RequirePackage{amssymb} % Deﬁnes all the symbols found in the AMS symbol fonts msam and msbm.
\RequirePackage{MnSymbol} % Much more math symbols.
\RequirePackage{microtype} % Improves the typeface for the default font and makes the document easier to read.
\RequirePackage{tabularray} % The only tabular package you'll ever need. Has all the benefits of tabularx, longtabular and array combined.
\RequirePackage{xurl} % Package for wrapping URLs. With the [nobiblatex] option, the URLs in the bibliography are not wrapped.
\RequirePackage{rotating} % Allows images or tables to be rotated without rotating the entire page.
\RequirePackage{todonotes} % For orange todo boxes in the PDF document
\RequirePackage{enumitem} % Allows customization of enumeration descriptions e.g. for research questions (Q1 > (Q1.1, Q1.2), Q2 > (Q2.1))
\RequirePackage{ifthen} % Implements an \ifthenelse command for LaTeX2e.
\RequirePackage{icomma} % Allows german number format with "," as decimal separator without space after ",".
\RequirePackage{hyperref} % Allows linking to all possible labels within the document and beyond. Should be included last as it overwrites many LaTeX commands.
\ifnoprint
  \RequirePackage[top=7.5em,bottom=9em]{geometry} % Sets the margins. Used here to move the page number down a bit.
\else
  \RequirePackage[top=7.5em,bottom=9em,bindingoffset=1.5cm,outer=1.85cm]{geometry} % Sets the margins. Used here to move the page number down a bit.
  \reversemarginpar
\fi
\ifglossaries
  \RequirePackage[
    toc, % Adds an entry to the table of contents.
    % nonumberlist, % Removes also the crossreference between acronyms and glossary entries with "see={...}".
    nopostdot, % This option suppresses the default terminating full stop in glossary styles.
    acronym, % This creates a new glossary with the label acronym
    translate=babel % Automatically translates the heading in other languages
  ]{glossaries}
\fi

%% Set hyphen character %%
\hyphenchar\font=\string"7F % This setting allows the hyphenation of words with a dash (-) in it

%%%% Utility files %%%%
\input{assets/utility/acronyms}
\input{assets/utility/glossary}
\input{assets/utility/hyphenation}
\input{assets/utility/meta}


%%%% Configuration %%%%
%% KOMA-Script configuration %%
\ifthenelse{
  \equal{\thisdocumentclass}{scrartcl}
}{ % true
  \KOMAoptions{
    sectionentrydots=true,  % Puts dots between heading and page number in TOC for sections
  }
  \newcommand{\useCounterWithin}{section}

  \automark{section}
  \automark*{subsection}
  \automark*{subsubsection}
}{ % false
  \ifthenelse{
    \equal{\thisdocumentclass}{scrreprt}
  }{ % true
    \KOMAoptions{
      chapterentrydots=true,  % Puts dots between heading and page number in TOC for chapters
    }
    \newcommand{\useCounterWithin}{chapter}

    \automark{chapter}
    \automark*{section}
    \automark*{subsection}
  }{% false
    \ifthenelse{
      \equal{\thisdocumentclass}{scrbook}
    }{ % true
      \KOMAoptions{
        chapterentrydots=true,  % Puts dots between heading and page number in TOC for chapters
      }
      \newcommand{\useCounterWithin}{chapter}

      \automark{chapter}
      \automark*{section}
      \automark*{subsection}
    }
  }
}

\ifmodernstyle
\KOMAoptions{
  fontsize=11pt, % Specifies the general font size for the document
  parskip=half+, % defines how the paragraph break should look like (full = a whole line)
}
\else
\KOMAoptions{
  fontsize=12pt, % Specifies the general font size for the document
}
\fi

\KOMAoptions{ % Options of the KOMA-Script classes
  titlepage=true, % Inserts a custom title page if true
  headsepline=0.4pt, % Thin line under the header
  autoenlargeheadfoot=true, % Automatically adjusts the size of the header/footer
  toc=listof, % Displays all directories in the table of contents
}

% Sets the indentation of each section in the table of contents lower than standard configuration
\RedeclareSectionCommands[
  tocindent=1em,
]{section}

\RedeclareSectionCommands[
  tocindent=2em,
]{subsection}

\RedeclareSectionCommands[
  tocindent=3em,
]{subsubsection}

\RedeclareSectionCommands[
  tocindent=4em,
]{paragraph}

\DeclareTOCStyleEntry[indent=3em]{tocline}{subfigure}

\renewcommand{\dictumwidth}{0.5\textwidth} % Allows a direct citate (dictum) with Author

%% Header, footer, page layout %%
\clearpairofpagestyles
\lohead{\headmark}
\rohead{}%Bachelor-Thesis}%\@subtitle}
\rofoot*{
	\begin{tikzpicture}[overlay,baseline={(0,0)}] % small line in front of page number
		\draw[black,thick] (0,-0.33) -- (0,0.55);
	\end{tikzpicture}
	\hspace{2ex}\pagemark % page number
}
\pagestyle{scrheadings}
\deftriplepagestyle{mychapterpagestyle}{}{}{}{}{}{
	\begin{tikzpicture}[overlay,baseline={(0,0)}] % small line in front of page number
		\draw[black,thick] (0,-0.33) -- (0,0.55);
	\end{tikzpicture}
	\hspace{2ex}\pagemark % page number
}
\lefoot*{
  \pagemark\hspace{2ex} % page number
	\begin{tikzpicture}[overlay,baseline={(0,0)}] % small line in front of page number
		\draw[black,thick] (0,-0.33) -- (0,0.55);
	\end{tikzpicture}
}

% If report class then reset mychapterpagestyle
\ifthenelse{
  \equal{\thisdocumentclass}{scrreprt}
}{ % true
  \renewcommand{\chapterpagestyle}{mychapterpagestyle}
}{% false
}

% Reset footnote counter every page
\counterwithin*{footnote}{page}

%% New table of... for codeexamples and formulas %%
\DeclareNewTOC[%
	type=cde, % type for floating environment
	types=code, % name for "\listofcode"
	% float, % Floating environments are to be defined
	nonfloat, % Not only is a new directory type defined, but also a non-floating environment
	floattype=4, % Floating environments that only have different bits set in this floating type can overtake each other.
	tocentrynumwidth:=table, % Adjusted spacing to match table index style (tocentrynumwidth=4.35ex)
	tocentryindent:=table, % Adjusted spacing to match table index style (tocentryindent=2.85ex)
	counterwithin=\useCounterWithin, % allows the numbering to be chapter by chapter and not have its own counter
	name=Code, % Name for the caption
	listname={\thiscdeindex} % Directory title
]{loc} % File extension
\setuptoc{loc}{sectionatlist} % Setting up the directory

\DeclareNewTOC[%
	type=formula,
	types=formulas,
	float,
	floattype=5,
	tocentrynumwidth:=table,
	tocentryindent:=table,
	counterwithin=\useCounterWithin,
	name=Formel,
	listname={Formelverzeichnis}
]{loformulas}
\setuptoc{loformulas}{sectionatlist}

%% Chapter-/sectionwise numbering of figures and tables %%
\counterwithin{figure}{\useCounterWithin}
\counterwithin{table}{\useCounterWithin}

%% Fontsettings for modern and classic style
\ifmodernstyle
  \ifthenelse{
    \equal{\thisdocumentclass}{scrartcl}
  }{ % true
    \setkomafont{sectionentry}{\normalfont}
  }{ % false
    \ifthenelse{
      \equal{\thisdocumentclass}{scrreprt}
    }{ % true
      \setkomafont{chapterentry}{\normalfont\selectfont}
      \setkomafont{chapter}{\Huge\normalfont\selectfont}
    }{ % false 
      \ifthenelse{
        \equal{\thisdocumentclass}{scrbook}
      }{ % true
        \setkomafont{chapterentry}{\normalfont\selectfont}
        \setkomafont{chapter}{\Huge\normalfont\selectfont}
      }{ % false

      } % scrbook
    } % scrreprt
  } % scrartcl
  \setkomafont{section}{\LARGE\normalfont}
	\setkomafont{subsection}{\Large\normalfont}
	\setkomafont{subsubsection}{\large\normalfont}
	\setkomafont{paragraph}{\bfseries}
	\setkomafont{subparagraph}{\itshape\bfseries}
	\setkomafont{pageheadfoot}{\normalfont}
	\setkomafont{dictum}{\itshape}
	\setkomafont{dictumauthor}{\color{Grey}}
\else
  \addtokomafont{disposition}{\rmfamily}
  \setkomafont{dictum}{\rmfamily}
  \setkomafont{dictumauthor}{\color{Grey}}
\fi

\MakeOuterQuote{"} % Configuration of the quotation marks

%% Definition of own colors %%
\definecolor{lightGrey}{HTML}{b0b0b0}
\definecolor{darkGrey}{HTML}{444444}
\definecolor{Grey}{HTML}{666666}
\definecolor{Red}{HTML}{c62828}
\definecolor{lightBlue}{HTML}{42A5F5}
\definecolor{plot1}{HTML}{1d88e5}
\definecolor{plot2}{HTML}{88e51d}
\definecolor{plot3}{HTML}{e51d7b}
\definecolor{plot4}{HTML}{531de5}
\definecolor{plot5}{HTML}{e5921d}
\definecolor{plot6}{HTML}{5D4037}

%% Codeexample configuration %%
\setminted{
	style=friendly, % Color scheme for code highlighting
	linenos=true, % line numbers
	% frame=lines, % frame around the code
	framerule=1pt, % top and bottom border lines thickness
	autogobble=true, % removes the spaces at the beginning of the code (due to indentation by the text editor)
	mathescape=true, % allows running the math environment in comments
	showspaces=true, % shows the spaces
	space=\textcolor{lightGrey}{·}, % Displays spaces with a light gray dot
	obeytabs=true, % Use tabs as tabs and don't convert them to spaces
	showtabs=true, % Shows tabs
	tabsize=4, % number of spaces for a tabstop
	tab=\textcolor{lightGrey}{\hfill\ensuremath{\rightarrow}\hfill}, % Formatting of the tab stop symbol
	breaklines=true, % Breaks the code if the code is too long
	breakafter=\};+.\space\,(], % Specifies the characters after which a break can be made
	breakbefore=\{)[, % Specifies which characters can be broken before
	breakaftersymbolpre=\textcolor{Red}{\ensuremath{_\lcurvearrowsw}}, % Formatting of the break symbol
	breakbeforesymbolpre=\textcolor{Red}{\ensuremath{_\lcurvearrowsw}}, % Formatting of the break symbol
	breaksymbol=\raisebox{0.4ex}{\textcolor{Red}{\ensuremath{\rcurvearrowse}}}, % Formatting of the break symbol
	% rulecolor=\color{darkGrey}, % Color of the frame for a slight differentiation from the text
}

\renewcommand{\theFancyVerbLine}{\normalfont{\scriptsize{\arabic{FancyVerbLine}}}} % Line number formatting for code

\newenvironment{cde}{\captionsetup{type=listing}}{}
\ifthenelse{
  \equal{\thislanguage}{ngerman}
  }{ % true
  \SetupFloatingEnvironment{listing}{name=Code} % changes the code caption from "Listing" to "Code"
}{ % false
  \ifthenelse{
    \equal{\thislanguage}{english}
  }{ % true
    \SetupFloatingEnvironment{listing}{name=Code} % changes the code caption from "Listing" to "Code"
  }{ % false
  }
}

%% pgfplot configuration %%
\pgfplotsset{
	compat=1.18, % compatibility to this version
	every axis/.append style={grid, width=0.75\textwidth, height=5cm}, % How big the charts should be
	grid style={densely dotted, thick}, % How the grid should look in the background
	every axis plot/.append style={no markers, very thick}, % How the lines should look like
	label style={font=\small}, % slightly smaller font for axis labels
	tick label style={font=\small}, % slightly smaller font of the individual elements of the axes
	legend pos={outer north east}, % position of legend if present
	cycle list={color=plot1,color=plot2,color=plot3,color=plot4,color=plot5,color=plot6} % Color cycle of each line
}

%% Glossary configuration %%
\ifglossaries
  \renewcommand{\glsnamefont}[1]{\textbf{#1}}
  \setlength\LTleft{-6pt}
  \setlength\LTright{0pt}
  \setlength\glsdescwidth{0.8\hsize}
  \makeglossaries % make glossaries
\fi

%% Tabularry configuration %%
\UseTblrLibrary{booktabs} % Cleaner looking tables with the booktabs package used for tabularray
% Automatically translate information for longtblr tables
\ifthenelse{
  \equal{\thislanguage}{ngerman}
  }{ % true
    \DefTblrTemplate{contfoot-text}{default}{Fortsetzung auf der nächsten Seite}
    \DefTblrTemplate{conthead-text}{default}{(Fortgesetzt)}
  }{% false
}

%% Bibliography configuration %%
\addbibresource{bibliography.bib} % Document with all bibliography data

\AtEveryBibitem{% Ignore the note field in bibtex and biblatex entries
  \clearfield{note}%
}

\renewcommand*{\bibfont}{\small} % Make the font of the bibliography smaller for better compatibility with ieee standard

%% Tcolorbox configuration %%
\tcbuselibrary{
  minted, % code highlighting with python pygments
  breakable, % let the tcolorboxes break (e.g. over page breaks or manually)
  skins % better designs for tcolorboxes
}

\NewTCBListing[auto counter, number within=\useCounterWithin]{codeblock}{ m m !O{} }{
  enhanced, % enhanced styling capabilities
  frame hidden, % hides the ugly frame even if its 0mm wide
  borderline north = {1pt}{0pt}{black}, % sets a line top of the code
  borderline south = {1pt}{0pt}{black}, % sets a line bottom of the code
  borderline north = {0.5pt}{20pt}{black}, % sets a line under the headin (only for one row heading)
  opacityback=0, % no background colors
  left=1mm, % left distance from frame to code
  right=1mm, % right distance from frame to code
  toptitle=0mm, % top distance from line to title
  bottomtitle=2mm, % bottom distance from line to title
  top=-5mm, % distance between title box and code
  coltitle=black, % color of the title
  listing engine=minted, % engine used to colorize code
  minted language=#1, % minted language for correct colorization
  breakable, % allows code to break over pages
  listing only, % shows only the code and not formatted in LaTeX
  title={\captionof{cde}{#2}}, % title of the code example with a hacky way to let it into the list of code
  #3
}

\NewTCBListing{code}{ m !O{} }{
  enhanced, % enhanced styling capabilities
  frame hidden, % hides the ugly frame even if its 0mm wide
  opacityback=0, % no background colors
  left=-4.8pt, % left distance from frame to code
  right=-4.8pt, % right distance from frame to code
  coltitle=black, % color of the title
  listing engine=minted, % engine used to colorize code
  minted language=#1, % minted language for correct colorization
  minted options={linenos=false},
  breakable, % allows code to break over pages
  listing only, % shows only the code and not formatted in LaTeX
  #2
}

\NewTCBInputListing[auto counter, number within=\useCounterWithin]{\inputcode}{ O{} m m m }{
  enhanced, % enhanced styling capabilities
  frame hidden, % hides the ugly frame even if its 0mm wide
  borderline north = {1pt}{0pt}{black}, % sets a line top of the code
  borderline south = {1pt}{0pt}{black}, % sets a line bottom of the code
  borderline north = {0.5pt}{20pt}{black}, % sets a line under the headin (only for one row heading)
  opacityfill=0, % no background colors
  left=1mm, % left distance from frame to code
  right=1mm, % right distance from frame to code
  toptitle=0mm, % top distance from line to title
  bottomtitle=2mm, % bottom distance from line to title
  top=-5mm, % distance between title box and code
  coltitle=black, % color of the title
  listing engine=minted, % engine used to colorize code
  minted language={#2}, % minted language for correct colorization
  breakable, % allows code to break over pages
  listing only, % shows only the code and not formatted in LaTeX
  listing file={#3},
  title={\captionof{cde}{#4}}, % title of the code example with a hacky way to let it into the list of code
  #1
}

\captionsetup{hypcap=false} % needs to stay here to omit a warning when \inputcode is used.

\newcommand\tcb@cnt@codeblockautorefname{Code} % set name for codeblock autoref to "Code"
\newcommand\tcb@cnt@inputcodeautorefname{Code} % set name for inputcode autref to "Code"

%% Hyperref configuration %%
\hypersetup{
	colorlinks,
	hidelinks,
	pdftitle={\ThesisTitle},
	pdfauthor={\ThesisAuthor},
	pdfsubject={\ThesisSubject},
}

%% Todonotes configuration %%
\setuptodonotes{
  size=\footnotesize,
  backgroundcolor=white,
  linecolor=cyan,
  bordercolor=cyan,
  tickmarkheight=0.5em,
}

%% Subcaption configuration %%
\renewcommand\thesubfigure{\thefigure.\alph{subfigure}}

%% Titlepage configuration %%
\title{\ThesisTitle}
\subtitle{\ThesisSubtitle}
\author{\ThesisAuthor}
\date{\normalsize\ThesisPublicationDate}
\ifthenelse{
  \equal{\ThesisDedication}{}
}{ % true
  \dedication{}
}{ % false
  \dedication{\ThesisDedication}
}
\publishers{%
	\begin{tabular}{ll}%
		\normalsize\textbf{
      \ifthenelse{\equal{\thislanguage}{ngerman}}{
        Erstprüfer:
      }{
        \ifthenelse{\equal{\thislanguage}{english}}{
          First supervisor:
        }{}
      }
    } & \normalsize \ThesisSupervisorFirst \\
		\normalsize\textbf{
      \ifthenelse{\equal{\thislanguage}{ngerman}}{
        Zweitprüfer:
      }{
        \ifthenelse{\equal{\thislanguage}{english}}{
          Second supervisor:
        }{}
      }
    } & \normalsize \ThesisSupervisorSecond
	\end{tabular}
}
\subject{\ThesisSubject}
\titlehead{
	\includegraphics[width=0.5\textwidth]{assets/images/titlepage/hbrs_logo.jpg}\\
	\tikz[remember picture, overlay] \node[inner sep=0pt] at (current page.center){\includegraphics[width=\paperwidth]{assets/images/titlepage/hbrs_backdrop.jpg}};
}

%% Custom titlepage that is centered %%
% This option allows cleaner prints when thesis is finished
\newcommand{\makecentertitle}{%
  \newgeometry{top=7.5em,bottom=9em}
  \maketitle
  \restoregeometry
}

%% Double signature %%
\newcommand{\doublesignature}[2]{%
  \vspace{4em}
  \begin{table}[H]
    \begin{tblr}{
      colspec = {X[2,l] X[1,c] X[2,r]}
    }
      \SetHline{1,3}{0.8pt}
      #1 & & #2\\
    \end{tblr}
  \end{table}
}

%% Default configuration for images %%
\setkeys{Gin}{width=0.8\textwidth}

%% Automatically center floating environments %%
\makeatletter
\g@addto@macro\@floatboxreset\centering
\makeatother