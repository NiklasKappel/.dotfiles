\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mypaper}

\LoadClass[
  12pt,
  a4paper,
  captions=tableheading,
  numbers=noendperiod,
  oneside,
]{scrartcl}

% Packages
\RequirePackage{mycommons}  % Import common packages and commands
\RequirePackage[backend=biber, sorting=none]{biblatex}  % Make bibliography
\RequirePackage[labelfont=bf, singlelinecheck=false]{subcaption}  % Make labelled subfloats
\RequirePackage[bookmarksnumbered, hidelinks]{hyperref}  % Make hyperlinks
\RequirePackage[noabbrev]{cleveref}  % Make references

% Package settings
%% Remove entries from bibliography
\DeclareSourcemap{
  \maps[datatype=bibtex]{
    \map{
      \step[fieldset=note, null]
      \step[fieldset=pages, null]
      \step[fieldset=url, null]
      \step[fieldset=urldate, null]
    }
    \map{
      \pertype{article}
      \step[fieldset=issn, null]
    }
    \map{
      \pertype{incollection}
      \step[fieldset=editor, null]
      \step[fieldset=isbn, null]
      \step[fieldset=series, null]
    }
  }
}

% KOMA settings
\KOMAoptions{DIV=calc}  % Adjust type area to font
\setkomafont{caption}{\small}  % Set size of captions
\setkomafont{pagenumber}{\footnotesize}  % Set size of page numbers
\setcapindent{0pt}  % Set indentation of multi line captions

% Commands
\newcommand{\titledCaption}[2]{\caption[#1]{\textbf{#1.} #2}}

