%
% documentclass
%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{danielsclass}[2022/04/22 My own class]

\newif\ifdraft\draftfalse
\DeclareOption{draft}{\drafttrue}

\DeclareOption*{ % Fallback for unknown options
    \ClassWarning{danielsclass}{Unknown option '\CurrentOption'}
}
\ProcessOptions\relax % execute options

\LoadClass[a4paper,onecolumn]{scrartcl}
%\LoadClass[a4paper,onecolumn]{scrreprt}
\KOMAoptions{fontsize=11pt}
%\KOMAoptions{twoside}
%\KOMAoptions{DIV=15}
%\KOMAoptions{BCOR=2mm}
\KOMAoptions{parskip=half}
\KOMAoptions{abstract=true}
%\KOMAoptions{openright}
%\KOMAoptions{chapterprefix}
%\KOMAoptions{bibliography=totocnumbered}
%\KOMAoptions{egregdoesnotlikesansseriftitles}
\ifdraft\KOMAoptions{draft=true}\fi

%
% general packages
%

\RequirePackage[left=20mm,right=20mm,top=20mm,bottom=40mm]{geometry}
\RequirePackage[english,main=ngerman]{babel}
%\RequirePackage[ngerman,main=english]{babel}

\RequirePackage[all,defaultlines=2]{nowidow}
%\RequirePackage[onehalfspacing]{setspace}
\RequirePackage{microtype}
\RequirePackage{hyperref}

\RequirePackage{hyphenat}
%\hyphenation{Mathe-matik wieder-gewinnen}

%\RequirePackage[draft=false,headsepline]{scrlayer-scrpage}
\RequirePackage[draft=false]{scrlayer-scrpage}
\addtokomafont{pagehead}{\small}
\addtokomafont{pagefoot}{\small}
\ihead{left}
\chead{mid}
\ohead{right}
%\automark[section]{chapter}
%\ihead{\headmark}
%\ohead{\pagemark}
%\ofoot[\pagemark]{}

%
% font packages
%

% xelatex fonts
\RequirePackage{fontspec}
\defaultfontfeatures{Scale=MatchLowercase}
\defaultfontfeatures[\rmfamily]{Scale=1}
\setmonofont{JetBrains Mono}
%\setmainfont{Palatino Linotype}
%\setmainfont{Calibri}

% legacy fonts
%\RequirePackage[utf8]{inputenc}
%\RequirePackage[T1]{fontenc}
%\RequirePackage[sc,osf]{mathpazo}

%
% misc packages
%

% BibLateX
%\RequirePackage{csquotes}
%\RequirePackage[
%    backend=biber,
%    style=ieee,
%    url=false,
%    eprint=false,
%    isbn=false,
%    hyperref=true,
%    bibencoding=inputenc
%]{biblatex}
%\addbibresource{quellen.bib}

%\RequirePackage[modulo]{lineno}
%\def\linenumberfont{\normalfont\tiny}
%\RequirePackage{multicol}
%\setlength{\columnsep}{12mm}

\RequirePackage[table,dvipsnames]{xcolor}
\RequirePackage{listings}
\definecolor{codegray}{rgb}{0.5,0.5,0.5}
\definecolor{codeback}{rgb}{0.93,0.93,0.90}
\lstset{
  basicstyle=\footnotesize\ttfamily,
  breaklines=true,
  keepspaces=true,
  numbers=left,
  numbersep=8pt,
  tabsize=4,
  frame=single,
  numberstyle=\scriptsize\color{gray},
  backgroundcolor=\color{codeback},
  stringstyle=\color{Purple},
  commentstyle=\color{ForestGreen},
  keywordstyle=\color{BrickRed},
}
\RequirePackage[linesnumbered,ruled,vlined]{algorithm2e}

\RequirePackage{tikz}
%\RequirePackage{subfig}
%\RequirePackage{caption}
%\RequirePackage{overpic}
\RequirePackage{graphicx}
\RequirePackage[section]{placeins}

%\RequirePackage{tabularx}
%\RequirePackage{array}
%\RequirePackage{booktabs}
%\RequirePackage{diagbox}

\RequirePackage[obeyDraft,colorinlistoftodos]{todonotes}
\newcommand{\missing}[1]{\todo[inline]{#1}}
\newcommand{\rtodo}[1]{\todo[backgroundcolor=red]{#1}}
\newcommand{\ytodo}[1]{\todo[backgroundcolor=yellow]{#1}}
\newcommand{\gtodo}[1]{\todo[backgroundcolor=green]{#1}}

%
% math stuff
%

\RequirePackage{amsmath,amssymb,amsthm,mathtools}
\numberwithin{equation}{subsection}

\newcommand{\NN}{\mathbb{N}}
\newcommand{\ZZ}{\mathbb{Z}}
\newcommand{\QQ}{\mathbb{R}}
\newcommand{\RR}{\mathbb{R}}
\newcommand{\CC}{\mathbb{C}}
\newcommand{\KK}{\mathbb{K}}
\renewcommand{\d}[1][x]{\,\mathrm{d}#1}
\newcommand{\set}[1]{\left\lbrace#1\right\rbrace}
\newcommand{\Set}[2]{\left\lbrace#1\mid#2\right\rbrace}
\newcommand{\norm}[1]{\left\lVert#1\right\rVert}
\newcommand{\sprod}[2]{\left\langle#1,#2\right\rangle}
\newcommand{\pab}[2]{\frac{\partial #1}{\partial #2}}
\newcommand{\grad}[2]{\text{grad}_{#1} #2}
\renewcommand{\vec}[1]{\boldsymbol{#1}}
\DeclareMathOperator{\var}{var}
\DeclareMathOperator*{\argmin}{argmin}

% See https://www.overleaf.com/learn/latex/theorems_and_proofs
\theoremstyle{plain}
\newtheorem{definition}{Definition}[subsection]
\newtheorem{theorem}{Satz}[subsection]
\newtheorem{corollary}{Korollar}[theorem]

\theoremstyle{remark}
\newtheorem*{remark}{Hinweis}
\newtheorem*{example}{Beispiel}

%
% misc commands
%

% dots for a signatue in a formular
\newcommand{\signaturespace}[1]{%
  \begin{tikzpicture}
    \draw[dotted] (0,0)--(5,0) (2,0) node[below]{#1};
  \end{tikzpicture}
}

\newcommand{\emptyline}{\vspace{\baselineskip}}

%
% document settings
%

\graphicspath{{img/}}
\setcounter{topnumber}{1}
\setcounter{tocdepth}{2}

\newcommand{\mytitle}{Dokument}
\newcommand{\mysubtitle}{Mit XeLaTeX erzeugt}
\newcommand{\myname}{Daniel}
\newcommand{\mydate}{\today}

\ifdraft
  \RequirePackage{scrtime}
  \RequirePackage{eso-pic}
  \AddToShipoutPicture{
      \put(20,50){\textcolor[gray]{0.5}{DRAFT: \mytitle{} -- \myname{} (Compile date: \today/\thistime)}}
  }
\fi

\endinput
