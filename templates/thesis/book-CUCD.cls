%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% This is a Class File for Cambridge University Cambridge Department Theses and
% Reports. This basically defines the formatting of the reports so that they
% would meet the requirements of the examiners, but it does not offer full
% functionality required to typeset a report. For this one should need to use
% various packages, which are dealt with more in the template.
%
% For those who want to learn LaTeX, this file can be a very good example how to
% define thing in a TeX-ish way as opposed to WYSIWYG way. LaTeX full power lies
% exactly in its structural typesetting. Also, think always, 'How could I get the
% result in least lines of text?' or 'How can I ease my life by making my
% content cross-referenced and linked, so that if something changes, I do not
% have to redo all the graphics and other things?'
%
% This file is GPL licensed, so if you want to change it, feel free, but be kind
% to mention the authors of the file and please make the source available.
%
% Written by Ignas Anikevicius
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{book-CUCD}[2011/07/19 version 0.1 by Ignas Anikevicius]


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Option declaration

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

%Process all the options

\ProcessOptions\relax

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Initiate class
\LoadClass[]{book}

% Require babel with british option. 
% !!! Both english and british options must be present !!!
\RequirePackage[english,british]{babel}

% For Unicode and Type1 fonts
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}

% Set the page geometry
\RequirePackage[inner=3.5cm, outer=2.5cm, top=2cm, bottom=3cm, includehead, headheight=17.6pt]{geometry}

\RequirePackage{fancyhdr}

\fancypagestyle{plain}{%
\pagestyle{empty}
\fancyfoot[C]{\thepage}}

\fancypagestyle{fancyplain}{%
\fancyhf{}
\fancyfoot[C]{\thepage}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Declarations of new stuff

\newcommand{\supervisor}[1]{\renewcommand{\supervisor}{#1}}

\newcommand{\college}[2]{
    \renewcommand{\college}{#1}
    \newcommand{\collegeid}{#2}}

\newcommand{\laboratory}[1]{\renewcommand{\laboratory}{#1}}
\newcommand{\labaddress}[1]{\renewcommand{\labaddress}{#1}}
\newcommand{\subnotes}[1]{\renewcommand{\subnotes}{#1}}

\newcommand{\HRule}{\rule{\linewidth}{0.5mm}}
\newcommand{\Hrule}{\rule{\linewidth}{0.25mm}}

% Change frontmatter and backmatter commands to make use of fancyhdr package
\renewcommand{\frontmatter}{%
    \cleardoublepage
    \@mainmatterfalse
%    \pagestyle{fancyplain}
    \pagenumbering{roman}}
\renewcommand{\mainmatter}{%
    \cleardoublepage
    \@mainmattertrue
    \pagestyle{fancy}
    \pagenumbering{arabic}}

% vim: tw=80:spell:spelllang=en_gb:syntax=tex
