% ===== Class initialization ===================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{scrvitae2}[2011/08/03 version 0.1 by Ignas Anikevicius]

% ===== Initial definitions ====================================================
\RequirePackage{ifthen} % ifthenelse logics inside TeX
\RequirePackage{calc}   % Helpful to put math inside length specifications
\RequirePackage{array}  % Helpful for making tables

% ===== Option declaration & processing ========================================

\DeclareOption*{%
    \PassOptionsToClass{\CurrentOption}{scrartcl}%
}

%Process the options
\ProcessOptions\relax

% ===== Load the class with the necessary option ===============================

\LoadClass[]{scrartcl}    % Initiate Class
\KOMAoptions{             %
    paper=a4,             % Set the paper size
    fontsize=11pt,        % Get the default font size
    bibliography=totoc,   % Put bibliography to TOC
    numbers=noenddot,     % Numbers of chapters are not proceded by a .
    DIV=15,               % Increase the DIV to increase the area of the text
    headinclude,
    footinclude
}
                        
% ===== Package loading and their usage ========================================

\RequirePackage{lastpage}   % Make a ref to the last page
\RequirePackage{scrpage2}   % Initiate fancyhdr equivalent for the % KOMAscript
                            % clases (like scrbook, % scrartcl etc). This
                            % package is much better integrated with the classes

\RequirePackage[usenames,dvipsnames]{xcolor} % Color support

\renewpagestyle{empty}            % Redefine scrheadings page style
{ {}{}{} }                        % Empty header
{ {}{}
    {\rm \hfill\thepage\ of       % Footer definition
        \pageref{LastPage}\hfill} %
}
\renewpagestyle{scrheadings}      % Redefine scrheadings page style
{ {}{}
    {\rm \@title\hfill\@author}   % Header definition
    (\textwidth, 0.0mm)           % Put a line bellow. To make it appear change
                                  % thicknes from 0.0mm to something else
}
{ {}{}
    {\rm \hfill\thepage\ of       % Footer definition
        \pageref{LastPage}\hfill} %
}
\pagestyle{scrheadings}           % Set the default style to the scrheadings

\RequirePackage{mathpazo}         % Use Palatino fonts
\setlength{\parindent}{0mm}       % No paragraph indentation
\setlength{\parskip}{3mm}         % Paragraph spacing

\RequirePackage{paralist}         % Required to make use of the newly created
                                  % environments

% Change how section looks like
\renewcommand{\section}[1]{
    \pagebreak[3]\vspace{1.3\baselineskip}%
    \begin{minipage}[c]{\textwidth}
        \sffamily
        \Large\color{Black}\bfseries #1\vspace{-.7\baselineskip}\\
        \color{Mahogany}\rule{\textwidth}{.3mm}\vspace{.4\baselineskip}
    \end{minipage}
    %\newline #2
}

\renewcommand{\maketitle}{
    \clearpage
    \vspace{1.3\baselineskip}
    \thispagestyle{empty}
    \begin{minipage}[c]{\textwidth}
        \bfseries\centering\large
        \textit{\@title}
        \sffamily\vspace{-.2\baselineskip}\\\Huge
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
