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
%\KOMAoptions{parskip=half}
%\KOMAoptions{abstract=true}
%\KOMAoptions{openright}
%\KOMAoptions{chapterprefix}
\KOMAoptions{bibliography=totoc}
%\KOMAoptions{listof=nochaptergap}
\ifdraft\KOMAoptions{draft=true}\fi

%
% general packages
%

%\RequirePackage[left=20mm,right=20mm,top=20mm,bottom=40mm]{geometry}
\RequirePackage[english,main=ngerman]{babel}
%\RequirePackage[ngerman,main=english]{babel}

\RequirePackage[all,defaultlines=2]{nowidow}
%\RequirePackage[onehalfspacing]{setspace}
\RequirePackage{microtype}
\RequirePackage{hyperref}
%\RequirePackage{scrhack}

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
%\RequirePackage{lmodern}
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
%  style=authoryear,
%  % style=ieee,
%  backend=biber,
%  url=false,
%  eprint=false,
%  isbn=false,
%  hyperref=true,
%  bibencoding=inputenc,
%  maxcitenames=2,
%]{biblatex}
%\addbibresource{quellen.bib}

%\RequirePackage[modulo]{lineno}
%\def\linenumberfont{\normalfont\tiny}
%\RequirePackage{multicol}
%\setlength{\columnsep}{12mm}

\RequirePackage[table,dvipsnames]{xcolor}
\RequirePackage{listings}
\definecolor{codeback}{rgb}{0.97,0.97,0.97}
\lstset{
  basicstyle=\footnotesize\ttfamily,
  breaklines=true,
  keepspaces=true,
  numbers=left,
  numbersep=8pt,
  tabsize=4,
  frame=single,
  captionpos=b,
  numberstyle=\scriptsize\color{gray},
  backgroundcolor=\color{codeback},
  stringstyle=\color{Purple},
  commentstyle=\color{ForestGreen},
  keywordstyle=\color{BrickRed}\bfseries,
  mathescape=true,
}
\RequirePackage[linesnumbered,ruled,vlined]{algorithm2e}

%\RequirePackage{pgf}
\RequirePackage{tikz}
%\usetikzlibrary{
%  decorations.pathreplacing,
%  decorations.pathmorphing,
%  calligraphy,
%  calc
%}
%\tikzstyle{arrow} = [very thick,->,>=stealth]
%\newcommand{\mathdefault}[1][]{}

%\RequirePackage{caption}
%\RequirePackage{subcaption}
%\RequirePackage{overpic}
\RequirePackage{graphicx}
\RequirePackage[section]{placeins}
%\RequirePackage{pdfpages}

%\RequirePackage{tabularx}
%\RequirePackage{array}
%\RequirePackage{booktabs}
%\RequirePackage{diagbox}

\setlength{\marginparwidth}{2cm} % fixing an issue
\RequirePackage[obeyDraft,colorinlistoftodos]{todonotes}
\newcommand{\tcheck}[1][check smth.]{\todo[backgroundcolor=yellow]{#1}}
\newcommand{\optional}[1]{\todo[backgroundcolor=green]{#1}}
% \newcommand{\missing}[1]{\todo[inline]{#1}}

%
% math stuff
%

\RequirePackage{amsmath,amssymb,amsthm,mathtools}
%\RequirePackage{nicefrac,textcomp,gensymb}
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
\newcommand{\pas}{\partial_{\pi}}
\newcommand{\pasv}{\partial_{\vec{\pi}}}
\newcommand{\grad}[2]{\text{grad}_{#1} #2}
\renewcommand{\vec}[1]{\boldsymbol{#1}}
\DeclareMathOperator{\var}{var}
\DeclareMathOperator*{\argmin}{arg\,min}

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
    \draw[dotted] (0,0) -- node[below]{#1} (5,0);
  \end{tikzpicture}
}

\newcommand{\emptyline}{\vspace{\baselineskip}}

%
% document settings
%

\graphicspath{{img/}}
%\captionsetup{
%  figurename=Fig.,
%  tablename=Tab.,
%  format=plain,
%  labelsep=space,
%  labelfont=bf
%}
\setcounter{tocdepth}{1}

\setcounter{topnumber}{2}
\setcounter{bottomnumber}{2}
\setcounter{totalnumber}{4}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.85}
\renewcommand{\textfraction}{0.10}
\renewcommand{\floatpagefraction}{0.7}

\newcommand{\mytitle}{Dokument}
\newcommand{\mysubtitle}{Mit XeLaTeX erzeugt}
\newcommand{\myname}{Daniel}
\newcommand{\mydate}{\today}

\ifdraft
  \RequirePackage{scrtime}
  \RequirePackage{eso-pic}
  \AddToShipoutPicture{
      \put(20,50){
          \textcolor[gray]{0.5}{
              Draft: \mysubtitle{} -- \myname{} (Compile date: \thistime\nobreakspace\today)
          }
      }
  }
\fi

\endinput
