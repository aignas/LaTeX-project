% ===== Class initialization ===================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{scrbook-cucd}[2011/07/19 version 0.3 by Ignas Anikevicius]

% ===== Initial definitions ====================================================
\RequirePackage{ifthen}
\newboolean{OptPhd}
\newboolean{OptReport}

% ===== Option declaration & processing ========================================

\DeclareOption{report}{
    \PassOptionsToClass{
        twoside=false,
    }{scrbook}
    \setboolean{OptReport}{True}
    \setboolean{OptPhd}{False}
}
\DeclareOption{phd}{
    \PassOptionsToClass{
        twoside=true,
    }{scrbook}
    \setboolean{OptPhd}{True}
    \setboolean{OptReport}{False}
}
\DeclareOption*{%
    \PassOptionsToClass{\CurrentOption}{scrbook}%
}

%Process the options
\ProcessOptions\relax

% ===== Load the class with the necessary option ===============================

\LoadClass[]{scrbook}                   % Initiate Class
\KOMAoptions{                           %
    paper=a4,                           % Set the paper size
    chapterprefix=true,                 % Show chapter prefix. Put false to hide
    fontsize=11pt,                      % Get the default font size
    listof=totoc,                       % Put list of .. to TOC
    index=totoc,                        % Put Index to TOC
    bibliography=totoc,                 % Put bibliography to TOC
    listof=graduated,                   % Make the list of .. indented
    chapteratlists=10pt,                %
    numbers=noenddot,                   % Numbers of chapters are not proceded by a .
    captions=tableheading}              % Format the table captions to be put 
                        
% ===== Package loading and their usage ========================================

\RequirePackage{geometry}               % Load Geometry package
\geometry{                              
    inner=3.5cm,                        % Set the default geometry which will be
    outer=2.5cm,                        % through the entire document. If one
    top=2cm,                            % needs different geometry it can be
    bottom=2cm,                         % achieved with the \newgeometry command.
    includefoot,                        % The default geometry is restored with 
    includehead                         % the \restoregeometry command
}
        
\RequirePackage{setspace}                       % Load the setspace package, which seems
\newcommand{\defaultspacing}{\onehalfspacing}   % to be the only sensible way to change
                                                % line spacing. Also set the linespacing
\ifOptPhd                                       % according to the formal requirements
    \onehalfspacing                             % If you need other spacing, just use
    \renewcommand{\defaultspacing}{\onehalfspacing} % the appropriate commands in your
                                                % preamble.
\fi
\ifOptReport
    \doublespacing
    \renewcommand{\defaultspacing}{\doublespacing}
\fi

\RequirePackage{scrpage2}               % Initiate fancyhdr equivalent for the
                                        % KOMAscript clases (like scrbook,
                                        % scrartcl etc). This package is much
                                        % better integrated with the classes

\renewpagestyle{plain}                  % Redefine plain style
{
    {}                                  % Header section:
    {}                                  % 
    {}                                  % Nothing in the header,
    (\textwidth,.0mm)                   % but retain the same line
}
{
    {\hfill\pagemark\hfill}             % Footer Section:
    {\hfill\pagemark\hfill}             %
    {\hfill\pagemark\hfill}             % Add page numbers to the footer
}

\renewpagestyle{scrheadings}            % Redefine scrheadings page style
{
    {\leftmark\hfill}                   % Header section:
    {\hfill\rightmark}                  %
    {\hfill\rightmark}                  %
    (\textwidth,.2mm)                   %
}
{
    {\hfill\pagemark\hfill}             % Footer section:
    {\hfill\pagemark\hfill}             %
    {\hfill\pagemark\hfill}             %
}
\pagestyle{scrheadings}                 % Set the default style to the
                                        % scrheadings

\RequirePackage[english,british]{babel} % Set the language to British English
                                        % NB that both english and british
                                        % options are mandatory!

\RequirePackage[utf8]{inputenc}         % Make the file utf8 compatible
\RequirePackage[T1]{fontenc}            % Make use of Type1 fonts
\RequirePackage{palatino}               % Use Palatino font package

\RequirePackage{pbox}                   % Make use of the pbox package as it is
                                        % needed for the title page
\RequirePackage{calc}                   % This is useful for calculating lengths
                                        % and it is used in title page as well.

\RequirePackage[]{amsmath}              % These 2 packages are generally for
\RequirePackage{amsfonts}               % good looking maths and they probably
                                        % will be needed by the majority of
                                        % students either way.

\RequirePackage[version=3]{mhchem}      % This is needed to typeset various
                                        % chemical formulae quickly.

\RequirePackage{array}                  % Get more control over formatting in tables
\RequirePackage{booktabs}               % Better looking tables

% Define new commands
\newcommand{\supervisor}[1]{\renewcommand{\supervisor}{#1}}
\newcommand{\college   }[1]{\renewcommand{\college}{#1}}
\newcommand{\laboratory}[1]{\renewcommand{\laboratory}{#1}}
\newcommand{\labaddress}[1]{\renewcommand{\labaddress}{#1}}

% Editor Settings
% vim: tw=80:spell:spelllang=en_gb:syntax=tex
