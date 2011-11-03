% Use the book style, 12pt writing, chapters start on next page.
\LoadClass[12pt, oneside, a4paper]{book}

\usepackage[version=3]{mhchem}

%Widen the margins.
\usepackage[margin=3.0cm]{geometry}

%Enable graphics.
\usepackage{graphicx}
\usepackage[usenames,dvipsnames]{color}
\definecolor{pdfRed}{rgb}{1,0,0}
\definecolor{pdfGreen}{rgb}{0,1,0}
\definecolor{pdfBlue}{rgb}{0,0,1}

%Advanced tables.
\usepackage{tabularx}
\usepackage{longtable}
\usepackage{afterpage}
\usepackage{multirow}
\usepackage{booktabs}
\usepackage{dcolumn}

%Enable fancy headers and footers.
\usepackage{fancyhdr}

%Enable Natural Sciences bibliography options.
\usepackage[super]{natbib}

%Enable advanced citing options.
\usepackage[centerlast,small]{caption}

%Enable pdfs to be inserted.
\usepackage{pdfpages}

%Enable doublespacing.
\usepackage{setspace}

%Enable more complex mathematical symbols.
\usepackage{amssymb}
\usepackage{textcomp}
\usepackage{url}
\usepackage{amsmath}
\usepackage{vector}

%Enable subfigures within one main figure.
\usepackage{subfigure}

%Create shortcuts for common Greek characters.
\newcommand{\alphaX}{\ensuremath{\alpha}}		%Alpha.
\newcommand{\betaX}{\ensuremath{\beta}}		%Beta
\newcommand{\micro}{\ensuremath{\mu}}		%Mu.
\newcommand{\um}{\ensuremath{\mu}m}		%micro meter.
\newcommand{\uM}{\ensuremath{\mu}M}		%micro molar.
\newcommand{\ul}{\ensuremath{\mu}l}		%micro liter.
\newcommand{\Ohm}{\ensuremath{\Omega}}		%Omega.
\newcommand{\DeltaX}{\ensuremath{\Delta}}		%Delta.
\newcommand{\PhiX}{\ensuremath{\Phi}}			%Phi.
\newcommand{\lambdaX}{\ensuremath{\lambda}}	%Lambda

%Create shortcut for common symbols.
\newcommand{\degree}{\ensuremath{^{\circ}}}						%Creates a degree symbol.
\newcommand{\regi}{\raisebox{1ex}{\small\textregistered}}			%Creates a registered symbol.
\newcommand\til{\char `\~}
\newcommand{\ditto}{\ensuremath{^{..}}}								%Creates a ditto symbol.
\newcommand{\TS}{\ddag}										%Creates a TS symbol.
\newcommand{\etal}{\textit{et al.}}									%Creates an ``et al.''
\newcommand{\plum}{\ensuremath{\pm}}								%Creates a plusminus.
\newcommand{\deltaG}[2]{\ensuremath{\Delta G_\mathrm{#1}^\mathrm{#2}}}	%Shortcut to delta G.
\newcommand{\den}[1]{\ensuremath{[\mathrm{den}]_\mathrm{#1}}}			%Shortcut to den.
\newcommand{\mval}[1]{\ensuremath{m_\mathrm{#1}}}					%Shortcut to m value.
\newcommand{\mk}[1]{\ensuremath{m_{k_\mathrm{#1}}}}					%Shortcut to m value.
\newcommand{\kval}[2]{\ensuremath{k_\mathrm{#1}^\mathrm{#2}}}			%Shortcut to k.

%Create shortcuts for common environments.
\newcommand{\sub}[1]{\ensuremath{_\mathrm{#1}}}		%Controls subscripts.
\newcommand{\subit}[1]{\ensuremath{_{#1}}}		%Controls subscripts.
\newcommand{\super}[1]{\ensuremath{^\mathrm{#1}}}		%Controls superscripts.
\newcommand{\superit}[1]{\ensuremath{^{#1}}}		%Controls superscripts.
\newcommand{\supersub}[2]{\ensuremath{^\mathrm{#1}_{#2}}}%Controls super/subscripts.
\newcommand{\unl}[1]{\underline{#1}}					%Creates an underline.

%Create a box for half-width images.
\newcommand{\imgbox}[2]{\begin{minipage}{0.5\textwidth}\begin{center}\large{#1}\\\includegraphics[width=0.95\textwidth]{Images/{#2}}\\\vspace{1em}\end{center}\end{minipage}}

%Create the variable width column.
\renewcommand{\tabularxcolumn}[1]{>{\centering\arraybackslash\small\rule{0pt}{3ex}}m{#1}<{\rule[-1.5ex]{0pt}{0pt}}}

%Create a fixed width column.
\newcolumntype{Y}[1]{>{\centering\arraybackslash\small\rule{0pt}{3ex}}m{#1}<{\rule[-1.5ex]{0pt}{0pt}}}

%Create a fixed width column for large tables.
\newcolumntype{L}[1]{>{\centering\arraybackslash\small}m{#1}<{}}

%Create a non-incrementing caption for the bottom of a table.
\newcommand{\captionX}[2]{\begin{minipage}{#1}\rule{0pt}{3ex}\noindent #2 \end{minipage}}

%Increase header height for fancy headers.
\setlength{\headheight}{30pt}

%Create headers and footers for plain pages.
\fancypagestyle{plain}{
	\fancyhead{}\lfoot{}\cfoot{}\rfoot{\thepage}
	\renewcommand{\headrulewidth}{0pt}
	\renewcommand{\footrulewidth}{0.5pt}}

%Switch on the fancy pages.
\pagestyle{fancy}

%Create headers and footers for other pages.
\renewcommand{\chaptermark}[1]{\markboth{#1}{}}
\lhead{}\chead{}\rhead{\bfseries\leftmark}
\lfoot{}\cfoot{}\rfoot{\thepage}
\renewcommand{\headrulewidth}{0.5pt}
\renewcommand{\footrulewidth}{0.5pt}

%Create a box for half-width images.
\newcommand{\imbox}[2]{\begin{minipage}{0.5\textwidth}\begin{center}\large{#1}\\\includegraphics[width=0.95\textwidth]{Images/{#2}}\\\vspace{1em}\end{center}\end{minipage}}
