% -------------------------------------------------------------------
% A class file for Angew Chem Int
%               written by Ignas Anikevicius
% ------------------------------------------------------------------- 

% ---- Initialize the class -----------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{wileyvch}[04/8/2011 v0.1]
\ClassInfo{wileyvch}{A class file for submissions to Wiley-VCH journals}

% ---- Initialize the ifthen package and process the options --------
\RequirePackage{ifthen}
%\RequirePackage{xkeyval}

% ---- Switches for single, onehalf, doublespacing ------------------
\newboolean{OptOneHalf}
\newboolean{OptDouble}

% ---- Switches for various Wiley-VCH journals ----------------------
\newboolean{JAngew}     % Angewandte journals
\newboolean{JMaterials} % Advanced {Functional,} Materials
\newboolean{JSmall}     % Small journal
\newboolean{JChemEUAS}  % Chemistry - a {European,Asian} Journal
\newboolean{JEuOrgChem} % European Journal for Organic Chemistry
%\newboolean{JChemChem}  % Chem{Bio,Phys,Sus}Chem
%\newboolean{JPolymsci}  % J Polym Sci Part A/B
%\newboolean{JMacromol}  % Macromol {ChemPhys,RapidCom,Symposia}

% Commands to display and change title of the journal 
\newcommand{\@JName}{WileyVCH journal}
\newcommand{\JName}[1]{\renewcommand{\@JName}{#1 }}
\newcommand{\JAbstract}{}
\newcommand{\@JAbstracttext}{}
\newcommand{\JAbstracttext}[1]{\renewcommand{\@JAbstracttext}{#1}}
\newcommand{\Jabsnumcols}{1}
\newcommand{\JmyHeader}{}
\newcommand{\@JKeywordWord}{Keywords:}
\newcommand{\JKeywordWord}[1]{\renewcommand{\@JKeywordWord}{#1}}
\newcommand{\@JAuthor}{Mr. Author}
\newcommand{\@JTitle}{Title of the paper}
\newcommand{\JAuthor}[1]{\renewcommand{\@JAuthor}{#1}}
\newcommand{\JTitle}[1]{\renewcommand{\@JTitle}{#1}}

\newcommand{\@Jtitletext}{\LARGE\bfseries}
\newcommand{\@Jauthortext}{\Large\it}

\newlength{\Jauthtitlesep}
\newlength{\Jauthtextsep}
\newlength{\Jtopsep}
\setlength{\Jauthtitlesep}{.5em}
\setlength{\Jauthtextsep}{.5em}
\setlength{\Jtopsep}{0mm}

\newcommand{\Jtitletext}[1]{\renewcommand{\@Jtitletext}{#1}}
\newcommand{\Jauthortext}[1]{\renewcommand{\@Jauthortext}{#1}}

% ---- Option Declaration -------------------------------------------
\DeclareOption{onehalf}{\setboolean{OptOneHalf}{True}}
\DeclareOption{double}{\setboolean{OptDouble}{True}}

\DeclareOption{angewchem}{
    \setboolean{JAngew}{true}
}
\DeclareOption{advmat}{
    \setboolean{JMaterials}{true}
}
\DeclareOption{small}{
    \setboolean{JSmall}{true}
}
\DeclareOption{chemeuas}{
    \setboolean{JChemEUAS}{true}
}
\DeclareOption*{%
    \PassOptionsToClass{\CurrentOption}{scrartcl}%
}
\ProcessOptions\relax

% ---- Load Class and Packages --------------------------------------
\RequirePackage{multicol} % Multicols environment for the abstract
\RequirePackage{fix-cm}
\LoadClass{scrartcl}      % Use KOMAscript article replacement
\KOMAoptions{
    twocolumn,
    captions=tableheading
}
\RequirePackage{fixltx2e}


\RequirePackage{
    geometry,   % Use for changing page layout
    balance,    % Balance the columns on the last page
    mathptmx,   % Use Times fonts
    setspace,   % correct way to change line spacing
    scrpage2,   % Use for headers and footers
    floatrow,
    caption,    % Format the captions the correct way
    chemscheme, % New environment - scheme
}
\RequirePackage[
    bottom,
    hang
    ]{footmisc}
\setlength{\footnotemargin}{.9em}
\renewcommand{\footnoterule}{
    \noindent\rule{\columnwidth}{.3pt}\vspace{.7em}}

\RequirePackage[
    usenames,
    dvipsnames
    ]{xcolor}
\RequirePackage{tikz}

\RequirePackage[
    style=chem-angew
    ]{biblatex}
%\RequirePackage{biblatex}
%\ExecuteBibliographyOptions{
%    style=chem-angew
%}
\let\cite\autocite
\renewcommand*{\bibfont}{\footnotesize}

% ---- Some default settings ----------------------------------------
% Alter some LaTeX defaults for better treatment of figures:
    % See p.105 of "TeX Unbound" for suggested values.
    % See pp. 199-200 of Lamport's "LaTeX" book for details.
    %   General parameters, for ALL pages:
    \renewcommand{\topfraction}{0.9}    % max fraction of floats at top
    \renewcommand{\bottomfraction}{0.8} % max fraction of floats at bottom
    %   Parameters for TEXT pages (not float pages):
    \setcounter{topnumber}{2}
    \setcounter{bottomnumber}{2}
    \setcounter{totalnumber}{4}     % 2 may work better
    \setcounter{dbltopnumber}{2}    % for 2-column pages
    \renewcommand{\dbltopfraction}{0.9} % fit big float above 2-col. text
    \renewcommand{\textfraction}{0.07}  % allow minimal text w. figs
    %   Parameters for FLOAT pages (not text pages):
    \renewcommand{\floatpagefraction}{0.7}      % require fuller float pages
    % N.B.: floatpagefraction MUST be less than topfraction !!
    \renewcommand{\dblfloatpagefraction}{0.7}   % require fuller float pages

    % remember to use [htp] or [htpb] for placement

\renewcommand{\abstract}[1]{}

\DefineFNsymbolsTM*{wileyalph}{
    {[a]}{[a]} % 1
    {[b]}{[b]} % 2
    {[c]}{[c]} % 3
    {[d]}{[d]} % 4
    {[e]}{[e]} % 5
    {[f]}{[f]} % 6
    {[g]}{[g]} % 7
    {[h]}{[h]} % 8
}
\DefineFNsymbolsTM*{wiley}{
    {\textasteriskcentered\textasteriskcentered}{**} % 1
    {\textasteriskcentered}{*}                       % 2
    {\textdagger}{\dagger}                           % 3
    {\textddagger}{\ddagger}                         % 4
    {\textsection}{\mathsection}                     % 5
    {\textparagraph}{\mathparagraph}                 % 6
    {\textbardbl}{\|}                                % 7
}
\newcommand{\@JWWW}{}
\newcommand{\JWWW}[1]{\renewcommand{\@JWWW}{#1}}
\newcommand{\JSupinfo}{
\setcounter{footnote}{-1}
\thanks{
Supporting information for this article is available on the WWW
under \@JWWW\space{} or from the author.}
}
\newcommand{\mailaddressedto}{*}
\AtBeginDocument{\balance}

\setlength{\footnotesep}{1.5em}
\definecolor{WileyGray}{gray}{.85}
\definecolor{JKeywordBoxColour}{gray}{.75}

\floatplacement{table}{htbp}
\floatplacement{figure}{htbp}
\floatsetup[table]{capposition=top}

\captionsetup{
    format          = plain,        %
    labelformat     = simple,       %
    labelsep        = period,       %
    justification   = default,      %
    font            = footnotesize, %
    labelfont       = default,      %
    textfont        = default,      %
    margin          = 0pt,          %
    indention       = 0pt,          %
    parindent       = 0pt,          %
    hangindent      = 0pt,          %
    singlelinecheck = false         %
}

\captionsetup[table]{position=above}
\captionsetup[figure]{position=below}
\setlength{\abovecaptionskip}{1mm}
\setlength{\belowcaptionskip}{1em}

% ---- Set the options to the Packages ------------------------------

% ---- Angew group journals ----------------------------
\ifJAngew
    \geometry{
      paper     = a4paper,      % The default page setting for the Angew
      top       = 20mm,         % journals
      bottom    = 39mm,         %
      inner     = 18mm,         %
      outer     = 18mm,         %
      footskip  = 8mm,          %
      headsep   = 8mm,          %
      columnsep = 5mm           %
%      text      = {174mm,238mm},%
    }                           %

    \captionsetup{
        labelfont = {it,bf,sf} % Change the caption setup
    }

    \Jtitletext{\bfseries\LARGE}
    \Jauthortext{\large\it}
    \setlength{\Jtopsep}{0mm}
    \setlength{\Jauthtitlesep}{0.3em}
    \setlength{\Jauthtextsep}{.5em}
    \setfnsymbol{wiley}
    \JKeywordWord{
    \begin{tikzpicture}[baseline=(N.center)]
        \node (N) {};
        \draw[draw=white,fill=black!30] (N.mid east) circle (1em);
        \draw[right] (N.mid west) node{\bfseries\sffamily Keywords:};
    \end{tikzpicture}
    }
\fi

\ifJSmall
    \geometry{
      papersize = {210mm,280mm},
      top       = 21mm,
      bottom    = 21mm,
      inner     = 17mm,
      outer     = 20mm,
      footskip  = 7.5mm,
      headsep   = 7.7mm,
      columnsep = 4.3mm
    }

    \captionsetup{
        labelfont = {bf,sf} % Change the caption setup
    }

    \setJtopsep{0mm}
    \setJtitletext{\sffamily\bfseries\LARGE}
    \setJauthortext{\Large\it}
    \setJauthtitlesep{0.7em}
    \setJauthtextsep{1.15em}
\fi

\ifJMaterials
    \geometry{
      papersize = {210mm,280mm},
      top       = 27mm,
      bottom    = 25mm,
      inner     = 18mm,
      outer     = 17mm,
      footskip  = 11mm,
      headsep   = 4mm,
      columnsep = 5mm
    }

    \captionsetup{
        labelfont = {bf,sf},    % Change the caption setup
    }

    \setJtopsep{-10mm}
    \setJtitletext{\sffamily\bfseries\LARGE}
    \setJauthortext{\Large\it}
    \setJauthtitlesep{1.0em}
    \setJauthtextsep{1.5em}
\fi

\ifJChemEUAS
    \geometry{
      paper     = a4paper,      %
      top       = 24mm,         %
      bottom    = 38mm,         %
      inner     = 16.5mm,       %
      outer     = 16.5mm,       %
      footskip  = 12mm,         %
      headsep   = 7mm,          %
      columnsep = 7mm           %
    }

    \Jtitletext{\bfseries\Large\centering}
    \Jauthortext{\Large\centering}
    \setlength{\Jtopsep}{0mm}
    \setlength{\Jauthtitlesep}{1.0em}
    \setlength{\Jauthtextsep}{.5em}

    \setkomafont{disposition}{\rm\bfseries}
    \setkomafont{section}{\large\centering}
    \renewcommand{\Jabsnumcols}{3}
    \defbibheading{bibliography}[\bibname]{
    \noindent\rule{.4\columnwidth}{.3pt}}

    \renewcommand{\abstract}[1]{\JAbstracttext{#1}}
    \renewcommand{\JAbstract}{
    \par
    \begin{minipage}[t]{\textwidth}
        \setlength{\columnsep}{4mm}
        \begin{multicols}{3}
            \rm\normalsize
            \textbf{Abstract: }
            \@JAbstracttext
        \end{multicols}
        \setlength{\columnsep}{7mm}
    \end{minipage}
    }
    \setfnsymbol{wileyalph}
    \newcommand{\bfalph}[1]{[\alph{#1}]}
    \renewcommand{\JmyHeader}{\hfill FULL PAPER}
    \setkomafont{pagehead}{\sffamily\bfseries\LARGE}
    \JKeywordWord{\bfseries\sffamily Keywords:\space}
\fi

% ---- Renew some commands ---------------------------------------------
\renewcommand*\@maketitle{%
\clearpage
\let\footnote\thanks
\setparsizes{\z@}{\z@}{\z@\@plus 1fil}\par@updaterelative
\null
\vspace{\Jtopsep}
\begin{flushleft}%
    \@Jtitletext\@title\vspace{\Jauthtitlesep}\\
    \@Jauthortext\@author\vspace{\Jauthtitlesep}
    \JSupinfo
    \JAbstract
\end{flushleft}%
\par
\vskip \Jauthtextsep
}%

\setlength{\parindent}{5mm}

\renewcommand{\pagemark}{\scriptsize\textbf{\sffamily\upshape\thepage}}
\newcommand{\myfoottitle}{\sffamily\upshape\scriptsize\@JName}

\newcommand{\JKsep}{\ensuremath{\cdot}\space}
\newcommand{\JKeywords}[1]{
\vspace{1em}
{\centering
    \colorbox{JKeywordBoxColour}{
    \begin{minipage}[t]{0.93\columnwidth}
        \newcommand{\textwlbbl}[1]{%
        \@JKeywordWord
        #1
        }
    \end{minipage}
}}
\vspace{.1em}
}

\renewpagestyle{plain}{{}{}{\JmyHeader}}{
{\pagemark\hfill\myfoottitle}
{\myfoottitle\hfill\pagemark}
{\myfoottitle\hfill\pagemark}
}
\renewpagestyle{headings}{{}{}{}}{
{\pagemark\hfill\myfoottitle}
{\myfoottitle\hfill\pagemark}
{\myfoottitle\hfill\pagemark}
}
\pagestyle{headings}

\newcommand{\defaultspacing}{\singlespacing}
\ifOptOneHalf
    \renewcommand{\defaultspacing}{\onehalfspacing}
\fi
\ifOptDouble
    \renewcommand{\defaultspacing}{\doublespacing}
\fi

\newcommand{\JTOCEntry}[4]{
\clearpage
\onecolumn
\setlength{\parindent}{0mm}

{\Large \textbf{Entry for the Table of Contents} (Please choose one layout only)}

\vskip 1em
{\large Layout 1:}

\begin{minipage}[t]{55mm}
    \textcolor{Red}{
    \begin{minipage}[t]{\textwidth}
        \rule{\textwidth}{.3mm}\vspace{ 0.3em}\\
        \centering
        \textbf{
        \ifthenelse{\equal{#1}{1}}{#2}{Catch Phrase:}
        }\vspace{-0.3em}\\
        \rule{\textwidth}{.3mm}
    \end{minipage}
    }

    \vskip 1em
    \textit{
    \ifthenelse{\equal{#1}{1}}{\@JAuthor}{
    Author(s), Corresponding Author(s)* \ldots\ldots\ldots\ldots Page Page
    }}

    \vskip 1em
    \textbf{
    \ifthenelse{\equal{#1}{1}}{\@JTitle}{
    Title Text}}
\end{minipage}
\begin{minipage}[t]{60mm}
    \centering
    \begin{tikzpicture}[baseline=(current bounding box.north)]
        \node(0,0) {};
        \draw(0,0) node[
            rectangle,
            fill,
            inner sep=0pt,
            minimum width=53mm,
            minimum height=56mm,
            color=WileyGray
            ]{};
        \draw(0,0) node{
        \ifthenelse{\equal{#1}{1}}{
        \includegraphics[
            keepaspectratio,
            height=56mm,
            width=53mm
            ]{#3}}{\textcolor{Red}{ 
        \begin{minipage}[t]{53mm}
            \centering
            ((The TOC Graphic should not exceed 
            the size of this area))
        \end{minipage}
        }}};
    \end{tikzpicture}
\end{minipage}
\begin{minipage}[t]{55mm}
    \ifthenelse{\equal{#1}{1}}{#4}{
    Text for Table of Contents, max. 450 characters.}
\end{minipage}

\vskip 3em

{\large Layout 2:}

\begin{minipage}[t]{55mm}
    \textcolor{Red}{
    \begin{minipage}[t]{\textwidth}
        \rule{\textwidth}{.3mm}\vspace{ 0.3em}\\
        \centering
        \textbf{
        \ifthenelse{\equal{#1}{2}}{#2}{Catch Phrase:}
        }\vspace{-0.3em}\\
        \rule{\textwidth}{.3mm}
    \end{minipage}
    }

    \vskip 1em
    \textit{
    \ifthenelse{\equal{#1}{2}}{\@JAuthor}{
    Author(s), Corresponding Author(s)* \ldots\ldots\ldots\ldots Page Page
    }}

    \vskip 1em
    \textbf{
    \ifthenelse{\equal{#1}{2}}{\@JTitle}{
    Title Text}}
\end{minipage}
\hspace{3mm}
\begin{minipage}[t]{115mm}
    \begin{tikzpicture}[baseline=(current bounding box.north)]
        \node(0,0) {};
        \draw(0,0) node[
            rectangle,
            fill,
            inner sep=0pt,
            minimum width=112mm,
            minimum height=28.5mm,
            color=WileyGray
            ]{};
        \draw(0,0) node{%
        \ifthenelse{\equal{#1}{2}}{
        \includegraphics[
            keepaspectratio,
            height=28.5mm,
            width=112mm
            ]{#3}}{\textcolor{Red}{ 
        \begin{minipage}[t]{109mm}
            \centering
            ((The TOC Graphic should not exceed 
            the size of this area))
        \end{minipage}
        }}};
    \end{tikzpicture}
    \vskip 1em
    \ifthenelse{\equal{#1}{2}}{#4}{
    Text for Table of Contents, max. 450 characters.}
\end{minipage}
}

% ---- Customize the style of the current commands ------------------

%% make labels in bibliobraphy be #.
%\renewcommand\@biblabel[1]{#1.}
\setcounter{secnumdepth}{-1} 
\defaultspacing

% Editor settings
% vim: tw=72:nospell:syntax=tex
