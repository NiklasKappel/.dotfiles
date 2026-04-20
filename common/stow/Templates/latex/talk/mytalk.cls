\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mytalk}

\LoadClass[
  10pt,
  aspectratio=169,
]{beamer}

% Packages
\RequirePackage{mycommons} % Import common packages
\RequirePackage[backend=biber,sorting=none,style=authoryear-comp]{biblatex}  % Make bibliography
\RequirePackage{appendixnumberbeamer}  % Reset total frame number for appendix
\RequirePackage{bbding}  % Provide \Checkmark and \XSolidBrush symbols

% Beamer settings
\usecolortheme{orchid}
\setbeamerfont{alerted text}{series=\bfseries}  % Make alert text bold in addition to red
\setbeamertemplate{footline}[frame number]  % Add frame number to footer
\setbeamertemplate{frametitle continuation}[from second]  % Adjust titles of frames only if frame break occurs
\setbeamertemplate{navigation symbols}{}  % Remove navigation symbols

% Set bullet point spacing
% see https://tex.stackexchange.com/questions/632524/how-to-globally-set-itemize-item-spacing-in-beamer-without-breaking-overlay-spec
\RequirePackage{xpatch}
\newlength{\my@beamer@itemsepi}\setlength{\my@beamer@itemsepi}{3ex}
\newlength{\my@beamer@itemsepii}\setlength{\my@beamer@itemsepii}{1.5ex}
\newlength{\my@beamer@itemsepiii}\setlength{\my@beamer@itemsepiii}{1.5ex}
\newcommand{\my@beamer@setsep}{%
\ifnum\@itemdepth=1\relax
     \setlength\itemsep{\my@beamer@itemsepi}% separation for first level
   \else
     \ifnum\@itemdepth=2\relax
       \setlength\itemsep{\my@beamer@itemsepii}% separation for second level
     \else
       \ifnum\@itemdepth=3\relax
         \setlength\itemsep{\my@beamer@itemsepiii}% separation for third level
   \fi\fi\fi}
\xpatchcmd{\itemize}
  {\def\makelabel}{\my@beamer@setsep\def\makelabel}{}{}
\xpatchcmd{\beamer@enum@}
  {\def\makelabel}{\my@beamer@setsep\def\makelabel}{}{}

% Define command to adjust bullet point spacing globally or locally inside a frame
% see https://tex.stackexchange.com/questions/632524/how-to-globally-set-itemize-item-spacing-in-beamer-without-breaking-overlay-spec
\newcommand\setlistsep[3]{%
    \setlength{\my@beamer@itemsepi}{#1}%
    \setlength{\my@beamer@itemsepii}{#2}%
    \setlength{\my@beamer@itemsepiii}{#3}%
}

% Sanitize PDF metadata to fix hyperref warning
% see https://tex.stackexchange.com/questions/10555/hyperref-warning-token-not-allowed-in-a-pdf-string
\pdfstringdefDisableCommands{
  \def\\{}
  \def\quad{}
  \def\qquad{}
}

% Fix biblatex warning
% see https://tex.stackexchange.com/questions/203111/small-caps-font-warning-in-beamer-using-biblatex
\renewcommand\mkbibacro[1]{{\footnotesize\MakeUppercase{#1}}}

% Define environment to vertically stabilize columns
% see https://tex.stackexchange.com/questions/1858/stable-vertical-alignment-of-columns-in-beamer
\newenvironment{stable}{\begin{minipage}[c][\beamer@frametextheight][c]{\linewidth}\raggedright}{\end{minipage}}

% Define command to add image credits
\newcommand{\credit}[1]{\par\hfill {\tiny #1}}

