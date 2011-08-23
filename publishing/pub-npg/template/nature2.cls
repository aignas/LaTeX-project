% -------------------------------------------------------------------
% A class file for Nature Publishing Group (NPG) articles
%               written by Ignas Anikevicius
%              inspired by Peter Czoschke
%
% There are two options available:
%       * rev - switch the style for internal review process
%       * pub - switch the style for the submission process
% ------------------------------------------------------------------- 

% ---- Initialize the class -----------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{nature2}[04/8/2011 v0.1]
\ClassInfo{nature2}{Some info on the package}

\RequirePackage[usenames,dvipsnames]{xcolor}
\definecolor{natcol}{HTML}{000000}
\newcommand{\jtitle}[1]{\renewcommand{\jtitle}{#1}}
\newcommand{\flavour}[1]{\renewcommand{\flavour}{#1}}

% ---- Initialize the ifthen package and process the options --------
\RequirePackage{ifthen}
\newboolean{OptSingle}
\newboolean{OptOneHalf}
\newboolean{OptDouble}

\DeclareOption{single}{
    \setboolean{OptSingle}{True}
}
\DeclareOption{onehalf}{
    \setboolean{OptOneHalf}{True}
}
\DeclareOption{double}{
    \setboolean{OptDouble}{True}
}
\DeclareOption{article}{%
    \flavour{ARTICLE}
}
\DeclareOption{letter}{%
    \flavour{LETTER}
}
\DeclareOption{nchem}{%
    \definecolor{natcol}{HTML}{5E2F8F}
    \jtitle{\uppercase{nature chemistry }}
}
\DeclareOption{nmat}{%
    \definecolor{natcol}{HTML}{B5103F}
    \jtitle{\uppercase{nature materials }}
}
\DeclareOption{nnano}{%
    \definecolor{natcol}{HTML}{DFA601}
    \jtitle{\uppercase{nature nanotechnology }}
}
\DeclareOption*{%
    \PassOptionsToClass{\CurrentOption}{scrartcl}%
}
\ProcessOptions\relax

% ---- Load Class and Packages --------------------------------------
\RequirePackage{fix-cm}
\LoadClass{scrartcl}               % Use a simple article class
\KOMAoptions{
    twoside,
    paper=210mm:276mm
}
\RequirePackage{fixltx2e}

\RequirePackage{times}                  % Use Times fonts
\RequirePackage{geometry}               % Use for changing page layout
\RequirePackage{setspace}               % correct way to change line spacing
%\RequirePackage[
%    super, 
%    sort&compress,
%    comma
%    ]{natbib}       % Use for citation formatting
\RequirePackage[style=nature]{biblatex}
\let\cite\autocite
\renewcommand*{\bibfont}{\footnotesize}
\setlength{\bibitemsep}{.0em}
\RequirePackage{
    caption,                % Format the captions the correct way
    scrpage2,
    tikz,
    balance
}

% ---- Set the options to the Packages ------------------------------
\AtBeginDocument{\balance}
\geometry{%
%    text={179mm,242mm},
    inner=14mm,
    outer=16.5mm,
    top=18.5mm,
    bottom=15mm,
    columnsep=4mm,
    footskip=8mm,
    headsep=5.5mm
}

\DeclareCaptionLabelSeparator{pipe}{ | }
\captionsetup{
    format=plain,               %
    justification=justified,    %
    singlelinecheck=false,      %
    font=footnotesize,          %
    labelfont={bf},             %
    format=plain,               %
    labelformat=simple,         %
    labelsep=pipe,
}

%\setlength{\parindent}{0mm}
\setlength{\parindent}{5mm}

\renewcommand{\pagemark}{\textbf{\sffamily\upshape\thepage}}
\newcommand{\myfoottitle}{
\sffamily\upshape{\bfseries\color{natcol} \uppercase{\jtitle
template for \flavour } } | \uppercase{manuscript preparation for
submission} }

\renewpagestyle{plain}{{}{
\hfill
\begin{tikzpicture}[remember picture,overlay]
    \node(0,0) {};
    \draw(0,0) node[yshift=-3.0mm,rectangle,fill,inner sep=0pt,minimum
    width=\textwidth,minimum height=16.85mm,color=natcol]{};% bar
    \draw(0,0)
    node[right, xshift=-\textwidth/2+.5mm,yshift=-2.95mm,rectangle,fill,inner
    sep=0pt,minimum width=40.3mm,minimum height=16.15mm,color=White]{};%
    bar
\end{tikzpicture}
\hfill
}{}}{
{\footnotesize\pagemark\hfill\myfoottitle}
{\footnotesize\myfoottitle\hfill\pagemark}
{}}
\renewpagestyle{headings}{{
%\hfill
%\begin{tikzpicture}[remember picture,overlay]
%    \node(0,0) {};
%    \draw(0,0) node[yshift=-5.0mm,rectangle,fill,inner sep=0pt,minimum
%    width=\textwidth,minimum height=7.3mm,color=natcol]{};% bar
%\end{tikzpicture}
%\hfill
}{
%\hfill
%\begin{tikzpicture}[remember picture,overlay]
%    \node(0,0) {};
%    \draw(0,0) node[yshift=-5.0mm,rectangle,fill,inner sep=0pt,minimum
%    width=\textwidth,minimum height=7.3mm,color=natcol]{};% bar
%\end{tikzpicture}
%\hfill
}{}}{
{\footnotesize\pagemark\hfill\myfoottitle}
{\footnotesize\myfoottitle\hfill\pagemark}
{}}
\pagestyle{headings}

\newcommand{\defaultspacing}{\singlespacing}
\ifOptSingle
    \renewcommand{\defaultspacing}{\singlespacing}
\fi
\ifOptOneHalf
    \renewcommand{\defaultspacing}{\onehalfspacing}
\fi
\ifOptDouble
    \renewcommand{\defaultspacing}{\doublespacing}
\fi

% ---- Customize the style of the current commands ------------------

\renewcommand*{\@maketitle}{%
  \clearpage
  \let\footnote\thanks
  \ifx\@extratitle\@empty \else
    \noindent\@extratitle \next@tpage \if@twoside \null\next@tpage \fi
  \fi
  \setparsizes{\z@}{\z@}{\z@\@plus 1fil}\par@updaterelative
  \null
  \vskip 9mm%
  \begin{flushleft}%
    \titlefont\huge \@title \par
    \vskip 1em\large%
      \begin{tabular}[t]{c}%
          \@author
      \end{tabular}\par
  \end{flushleft}%
  \par
  \vskip 2em
}%

\renewenvironment{abstract}{%
  \if@titlepage
    \titlepage
    \null\vfil
    \@beginparpenalty\@lowpenalty
    \if@abstrt
      \begin{center}
        \normalfont\sectfont\nobreak\abstractname
        \@endparpenalty\@M
      \end{center}
    \fi
  \else
    \if@twocolumn\if@abstrt
        \addsec*{\abstractname}
      \fi
    \else
      \if@abstrt
        \small
        \begin{center}
          {\normalfont\sectfont\nobreak\abstractname
            \vspace{-.5em}\vspace{\z@}}%
        \end{center}
      \fi
      \quotation
    \fi
  \fi\sffamily\noindent\bfseries\small
}{%
  \if@titlepage
    \par\vfil\null\endtitlepage
  \else
    \if@twocolumn\else\endquotation\fi
  \fi
  \upshape
}

%% make labels in bibliobraphy be #.
\renewcommand\@biblabel[1]{#1.}
\setcounter{secnumdepth}{-1} 
\defaultspacing

% Editor settings
% vim: tw=72:spell:spelllang=en_gb:syntax=tex
