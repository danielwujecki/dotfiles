\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{danielsclass}[2020/12/06 My own class]

%%% OPTIONS %%%

\newif\ifengl\englfalse
\newif\ifdraft\draftfalse
\newif\ifthesis\thesisfalse
\newif\ifheadsep\headsepfalse
\newif\ifcalibri\calibrifalse
\newif\ifnosecnum\nosecnumfalse
\newif\ifpalatino\palatinofalse
\newif\ifmathpazo\mathpazofalse
\newif\ifhalfspace\halfspacefalse

\DeclareOption{draft}{\drafttrue}
\DeclareOption{english}{\engltrue}
\DeclareOption{thesis}{\thesistrue}
\DeclareOption{englisch}{\engltrue}
\DeclareOption{calibri}{\calibritrue}
\DeclareOption{palatino}{\palatinotrue}
\DeclareOption{mathpazo}{\mathpazotrue}
\DeclareOption{headsepline}{\headseptrue}
\DeclareOption{nosectionnums}{\nosecnumtrue}
\DeclareOption{onehalfspacing}{\halfspacetrue}

% Options to pass to koma script
\DeclareOption{10pt}{\PassOptionsToClass{\CurrentOption}{scrartcl}}
\DeclareOption{11pt}{\PassOptionsToClass{\CurrentOption}{scrartcl}}
\DeclareOption{12pt}{\PassOptionsToClass{\CurrentOption}{scrartcl}}

\DeclareOption{10pt}{\PassOptionsToClass{\CurrentOption}{scrreprt}}
\DeclareOption{11pt}{\PassOptionsToClass{\CurrentOption}{scrreprt}}
\DeclareOption{12pt}{\PassOptionsToClass{\CurrentOption}{scrreprt}}
\DeclareOption{openright}{\PassOptionsToClass{\CurrentOption}{scrreprt}}
\DeclareOption{chapterprefix}{\PassOptionsToClass{\CurrentOption}{scrreprt}}
\DeclareOption{bibliography=totocnumbered}{\PassOptionsToClass{\CurrentOption}{scrreprt}}

\DeclareOption*{ % Fallback for unknown options
  \ClassWarning{danielsclass}{Unknown option '\CurrentOption'}
}
\ProcessOptions\relax % execute options

%%% BASE CLASS %%%

\ifthesis
    \LoadClass[
        a4paper,
        onecolumn,
        parskip=half,
        abstract=true,
        twoside,
        egregdoesnotlikesansseriftitles
    ]{scrreprt}
\else
    \LoadClass[
        a4paper,
        onecolumn,
        notitlepage,
        parskip=half,
        abstract=true,
        egregdoesnotlikesansseriftitles
    ]{scrartcl}
\fi

%%% PACKAGES %%%

\ifengl
    \RequirePackage[ngerman, main=english]{babel}
\else
    \RequirePackage[english, main=ngerman]{babel}
\fi

\RequirePackage{microtype}
\RequirePackage[all,defaultlines=2]{nowidow}
\RequirePackage{hyphenat}
\RequirePackage{amsmath, amssymb, amsthm, mathtools}
\RequirePackage{hyperref}

\ifmathpazo
    %\usepackage[utf8]{inputenc} % not needed for XeLaTeX
    \usepackage[T1]{fontenc}
    \usepackage[sc,osf]{mathpazo}
\else
    \RequirePackage{fontspec}

    \defaultfontfeatures{Scale=MatchLowercase}
    \defaultfontfeatures[\rmfamily]{Scale=1}

    \ifcalibri
        \setmonofont{JetBrains Mono}
        \setmainfont{Calibri}
    \fi
    \ifpalatino
        \setmonofont{JetBrains Mono}
        \setmainfont{Palatino Linotype}
    \fi
\fi

\ifthesis\else
    \RequirePackage[left=20mm,right=20mm,top=20mm,bottom=30mm]{geometry}
\fi

\RequirePackage[modulo]{lineno}
\def\linenumberfont{\normalfont\tiny}
\RequirePackage{multicol}
\setlength{\columnsep}{12mm}

\ifhalfspace
    \RequirePackage[onehalfspacing]{setspace}
\fi

\ifheadsep
    \RequirePackage[draft=false,headsepline]{scrlayer-scrpage}
\else
    \RequirePackage[draft=false]{scrlayer-scrpage}
\fi
\ifthesis
    \automark[section]{chapter}
    \ihead{\headmark}
    \ohead{\pagemark}
    \ofoot[\pagemark]{}
\fi

% BibLateX
\RequirePackage{csquotes}
\RequirePackage[
    backend=biber,
    style=ieee,
    url=false,
    eprint=false,
    isbn=false,
    hyperref=true,
    bibencoding=inputenc
]{biblatex}

\RequirePackage{tabularx}
\RequirePackage{booktabs}
\RequirePackage{diagbox}

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
\RequirePackage{subfig}
\RequirePackage{caption}
\RequirePackage{overpic}
\RequirePackage{graphicx}
\RequirePackage[section]{placeins}

\RequirePackage[obeyDraft,colorinlistoftodos]{todonotes}
\newcommand{\missing}[1]{\todo[inline]{#1}}
\newcommand{\rtodo}[1]{\todo[backgroundcolor=red]{#1}}
\newcommand{\ytodo}[1]{\todo[backgroundcolor=yellow]{#1}}
\newcommand{\gtodo}[1]{\todo[backgroundcolor=green]{#1}}

%%% SETTINGS %%%

\graphicspath{{imgs/}}
\setcounter{topnumber}{1}
\numberwithin{equation}{section}
\setcounter{tocdepth}{2}
\ifnosecnum
    \setcounter{secnumdepth}{0}
\fi

%%% COMMANDS %%%

% dots for a signatue in a formular
\newcommand{\signaturespace}[1]{%
  \begin{tikzpicture}
    \draw[dotted] (0,0)--(5,0) (2,0) node[below]{#1};
  \end{tikzpicture}
}
\newcommand{\emptyline}{\vspace{\baselineskip}}

\newcommand{\Nn}{\mathbb{N}}
\newcommand{\Zn}{\mathbb{Z}}
\newcommand{\R}{\mathbb{R}}
\newcommand{\Cn}{\mathbb{C}}
\newcommand{\bw}{\mathbf{w}}
\DeclareMathOperator{\var}{var}
\DeclareMathOperator*{\argmin}{argmin}
\newcommand{\set}[1]{\left\lbrace#1\right\rbrace}
\newcommand{\Set}[2]{\left\lbrace#1\mid#2\right\rbrace}

% See https://www.overleaf.com/learn/latex/theorems_and_proofs
\theoremstyle{plain} % definition
\newtheorem{defn}{Definition}[section]
\newtheorem{satz}{Satz}[section]
\newtheorem{kons}{Konsequenz}[satz]
\theoremstyle{remark}
\newtheorem*{hinweis}{Hinweis}
\newtheorem*{remark}{Remark}

\ifdraft
\RequirePackage{scrtime}
\RequirePackage{eso-pic}
\AddToShipoutPicture{
	\put(20,50){\textcolor[gray]{0.5}{DRAFT: \mytitle{} - \myname{} (Compile date: \today/\thistime)}}
}
\fi

\endinput
