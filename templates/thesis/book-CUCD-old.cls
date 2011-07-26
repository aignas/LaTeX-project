%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% This is a Template for CPGS and Part III Reports for the Department of
% Chemistry. It should be used as a starting point to typeset your reports.
% Everything is set up in the preamble, so that the changes would be easy to
% make. However, if you are happy with the formatting, do not change anything
% unless you really know what you are doing.
%
% For those who want to learn more LaTeX and know how everything was done,
% please read through the preamble and enjoy. I hope that the extensive
% documentation will help you to understand everything. If you can think of a
% better way to do things, please submit a patch to the file and I will be happy
% to ammed the changes.
%
% The file is GPL licensed.
%
% Written by Ignas Anikevicius
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{book-CUCD}[2011/07/19 version 0.1 by Ignas Anikevicius]

%\RequirePackage{ifthen}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Option declaration
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\newboolean{OptBritish}
%\newboolean{OptHyperref}

%\DeclareOption{british}{%
%    \setboolean{OptBritish}{true}
%}
%\DeclareOption{hyperref}{%
%    \setboolean{OptHyperref}{true}
%}
\DeclareOption{ptiii}{
    \PassOptionsToClass{12pt,oneside}{book}
    \linespread{1.6} % For double spacing
}
\DeclareOption{cpgs}{
    \PassOptionsToClass{12pt,oneside}{book}
    \linespread{1.6} % For double spacing
}
\DeclareOption{phd}{
    \PassOptionsToClass{11pt}{book}
    \linespread{1.3} % For 1.5 spacing
}
\DeclareOption*{%
    \PassOptionsToClass{\CurrentOption}{book}%
}
% Declare wordcount option

% Should I declare more for phd, cpgs, part III formating?
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProcessOptions\relax
\LoadClass[]{book}
\RequirePackage[english,british]{babel}

\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Page styles
\RequirePackage{fancyhdr}

% Customize the fancyplain style
%\fancypagestyle{fancyplain}{
%\fancyhf{} % remove everything
%\fancyfoot[C]{\thepage}}

% Customize the fancy style
%\fancypagestyle{fancy}{
%\fancyhf{} % remove everything
%\fancyhead[R]{\rightmark}
%\fancyfoot[C]{\thepage}}

% Customize the plain style
%\fancypagestyle{plain}{
%\fancyhf{} % remove everything
%\renewcommand{\headrulewidth}{0pt} % remove lines as well
%\renewcommand{\footrulewidth}{0pt}
%\fancyfoot[C]{\thepage}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[inner=3.5cm, outer=2.5cm, top=2cm, bottom=3cm, includehead, headheight=17.6pt]{geometry}
%\RequirePackage{setspace}

%\ifOptHyperref
%    \RequirePackage[]{hyperref}
%\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Declarations of new stuff
\newcommand{\address}[1]{
    \renewcommand{\address}{#1}}
\newcommand{\supervisor}[1]{
    \renewcommand{\supervisor}{#1}}
\newcommand{\college}[2]{
    \renewcommand{\college}{#1}
    \newcommand{\collegecrest}{#2.eps}}
\newcommand{\laboratory}[1]{
    \renewcommand{\laboratory}{#1}}
\newcommand{\subnotes}[1]{
    \renewcommand{\subnotes}{#1}}
\newcommand{\HRule}{\rule{\linewidth}{0.5mm}}
\newcommand{\Hrule}{\rule{\linewidth}{0.25mm}}
%\renewcommand{\hrule}{\rule{\linewidth}{0.15mm}}

% Change frontmatter and backmatter commands to make use of fancyhdr package
\renewcommand{\frontmatter}{%
    \cleardoublepage
    \@mainmatterfalse
%    \pagestyle{fancyplain}
    \pagenumbering{roman}}
\renewcommand{\mainmatter}{%
    \cleardoublepage
    \@mainmattertrue
%    \pagestyle{fancy}
    \pagenumbering{arabic}}

% Create abstract environment (Code copied from the report environment)
%\newenvironment{abstract}{%
%    \if@twocolumn
%    \section*{\abstractname}
%    \else
%    \cleardoublepage\null \vfill
%    \begin{center}%
%        {\bfseries \abstractname\vspace{-.5em}\vspace{\z@}}%
%    \end{center}
%    \quotation
%    \fi}
%    {\if@twocolumn\else\endquotation\fi}
%\newenvironment{abstract}%
%{\cleardoublepage\null\vfill 
%\begin{center}\bfseries \abstractname\end{center}}
%{\vfill \null}
%

% Redefine stuff so that it would appear in the table of contents
%\renewcommand{\section*}[1]{
%    \ifopt_hyperref}{\phantomsection}
%    \addcontentsline{toc}{chapter}{\numberline { }#1}
%    \section*{#1}}
%\renewcommand{\tableofcontents}{
%    \ifOptHyperref{\phantomsection}
%    \addcontentsline{toc}{chapter}{\numberline { }Contents}
%    \tableofcontents}
%\renewcommand{\listoffigures}{
%    \ifOptHyperref{\phantomsection}
%    \addcontentsline{toc}{chapter}{\numberline { }List of Figures}
%    \listoffigures}
%\renewcommand{\tableofcontents}{
%    \ifOptHyperref{\phantomsection}
%    \addcontentsline{toc}{chapter}{\numberline { }List of Tables}
%    \tableoftables}
%\renewcommand{\tableofcontents}{
%    \ifOptHyperref{\phantomsection}
%    \addcontentsline{toc}{chapter}{\numberline { }List of Algorithms}
%    \tableofalgorithms}
%\renewcommand{\bibliography}[1]{
%    \ifOptHyperref{\phantomsection}
%    \cleardoublepage\singlespacing
%    \refstepcounter{chapter}
%    \addcontentsline{toc}{chapter}{\numberline { }\bibname}
%    \bibliography{#1}}
