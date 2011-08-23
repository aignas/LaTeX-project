% ===== Class initialization ===================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{scrvitae}[2011/08/03 version 0.1 by Ignas Anikevicius]

% ===== Initial definitions ====================================================
\RequirePackage{ifthen}
\RequirePackage{calc}                   % Helpful to put math inside length
                                        % specifications

% ===== Option declaration & processing ========================================

\DeclareOption*{%
    \PassOptionsToClass{\CurrentOption}{scrartcl}%
}

%Process the options
\ProcessOptions\relax

% ===== Load the class with the necessary option ===============================

\LoadClass[]{scrartcl}                   % Initiate Class
\KOMAoptions{                           %
    paper=a4,                           % Set the paper size
    fontsize=11pt,                      % Get the default font size
    bibliography=totoc,                 % Put bibliography to TOC
    numbers=noenddot,                   % Numbers of chapters are not proceded by a .
    DIV=14
}
                        
% ===== Package loading and their usage ========================================

\RequirePackage{geometry}               % Load Geometry package
\reversemarginpar
\geometry{                              
    marginparwidth=13mm,      %
    marginparsep=2mm,         % Space between titles and text
    left=2.5cm,               %
    right=2.5cm,              % 
    top=2cm,                  % 
    bottom=2cm,               % 
    includeall,               %
}

\RequirePackage{lastpage}   % Make a ref to the last page
\RequirePackage{scrpage2}   % Initiate fancyhdr equivalent for the % KOMAscript
                            % clases (like scrbook, % scrartcl etc). This
                            % package is much better integrated with the classes
\newlength{\marginwidth}
\newlength{\completewidth}
\setlength{\marginwidth}{\marginparwidth+.5\marginparsep}
\setlength{\completewidth}{\marginwidth+\textwidth}
\setheadwidth[-\marginwidth]{textwithmarginpar}

\setlength{\parindent}{0mm}
\RequirePackage[usenames,dvipsnames]{xcolor}

\renewpagestyle{empty}            % Redefine scrheadings page style
{ {}{}{} }                              % Empty header
{ {}{}
    {\rm \hfill\thepage\ of             % Footer definition
        \pageref{LastPage}\hfill}       %
}
\renewpagestyle{scrheadings}            % Redefine scrheadings page style
{ {}{}
    {\rm \@title\hfill\@author}   % Header definition
    (\completewidth,.0mm)
}
{ {}{}
    {\rm \hfill\thepage\ of             % Footer definition
        \pageref{LastPage}\hfill}       %
}
\pagestyle{scrheadings}                 % Set the default style to the scrheadings

\RequirePackage{mathpazo}
\RequirePackage{paralist}

% Change how section looks like
\renewcommand{\section}[1]{
    \pagebreak[3]\vspace{1.3\baselineskip}%
    \hspace{-\marginwidth}
    \begin{minipage}[c]{\marginparsep+\marginparwidth+\textwidth}
        \sffamily
        \Large\color{BlueViolet}\bfseries #1\vspace{-.7\baselineskip}\\
        \color{Yellow}\rule{\textwidth}{.4mm}\vspace{.8\baselineskip}
    \end{minipage}
    %\newline #2
}

\renewcommand{\maketitle}{
    \clearpage
    \vspace{1.3\baselineskip}
    \thispagestyle{empty}
    \hspace{-\marginwidth}
    \begin{minipage}[c]{\marginwidth+\textwidth}
        \sffamily\bfseries\centering\LARGE
        \@title
        \vspace{.3\baselineskip}\\\large
        \@author
    \end{minipage}
}

% An itemize-style list with lots of space between items
\newenvironment{outerlist}[1][\enskip\textbullet]%
        {\begin{itemize}[#1]}{\end{itemize}%
         \vspace{-.6\baselineskip}}

% An environment IDENTICAL to outerlist that has better pre-list spacing
% when used as the first thing in a \section
\newenvironment{lonelist}[1][\enskip\textbullet]%
        {\vspace{-\baselineskip}\begin{list}{#1}{%
        \setlength{\partopsep}{0pt}%
        \setlength{\topsep}{0pt}}}
        {\end{list}\vspace{-.6\baselineskip}}

% An itemize-style list with little space between items
\newenvironment{innerlist}[1][\enskip\textbullet]%
        {\begin{compactitem}[#1]}{\end{compactitem}}

% An environment IDENTICAL to innerlist that has better pre-list spacing
% when used as the first thing in a \section
\newenvironment{loneinnerlist}[1][\enskip\textbullet]%
        {\vspace{-\baselineskip}\begin{compactitem}[#1]}
        {\end{compactitem}\vspace{-.6\baselineskip}}

% vim: tw=80:spell:spelllang=en_gb
