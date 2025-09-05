\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{munresolution}[MUN Resolution Class]

%% Base class
\LoadClass[11pt]{article}

%% Required packages
\RequirePackage[letterpaper,margin=1in]{geometry}
\RequirePackage{enumitem}
\RequirePackage{fancyhdr}
\RequirePackage{graphicx}
\RequirePackage{fontspec}
\RequirePackage{changepage}
\RequirePackage{lastpage}

%% Font setup (requires XeLaTeX or LuaLaTeX)
\setmainfont{Times New Roman}

%% Page style
\thispagestyle{empty}
\pagestyle{fancy}
\fancyhf{}
\fancyfoot[C]{{\thepage}/\pageref{LastPage}}
\fancyhead[L]{\footnotesize\bfseries\@title}
\fancyhead[R]{\hfill\footnotesize\bfseries MUN/\UNdocnumber}

%% Metadata fields (user settable)
\newcommand{\UNdocnumber}{RES/000}
\newcommand{\UNdate}{\today}
\newcommand{\UNsession}{First session}
\newcommand{\UNagenda}{Agenda item 0}
\newcommand{\UNtopic}{Topic of resolution}
\newcommand{\UNresnumber}{00/000}
\newcommand{\UNcommittee}{CommitteeName}
\newcommand{\UNbodywidth}{0.8\textwidth}
\newcommand{\UNendbar}{\par\vspace{1em}\noindent\hfill\rule{0.15\textwidth}{0.4pt}\hfill\mbox{}}

%% Title formatting
\renewcommand{\maketitle}{%
\setlength{\parindent}{0pt}
  {\large Model United Nations}
  \hfill
  {\LARGE \textmd{MUN}\small /\UNdocnumber}
  \vspace{0.75em}\hrule\vspace{0.5em}

  \begin{minipage}{0.15\textwidth}
        \includegraphics[width=\linewidth]{placeholder.png}
  \end{minipage}
  \begin{minipage}{0.65\textwidth}
    {\LARGE\bfseries{\UNcommittee}}
    \vspace{4em}
  \end{minipage}%
  \hfill
  \begin{minipage}{0.2\textwidth}
    \raggedleft
    {\small \UNdate}
    \vspace{4em}
  \end{minipage}

  \vspace{5em}\hrule\vspace{0.5em}

  %% Session + agenda info
  {\bfseries \UNsession} \\
  {\UNagenda} \\
  {\bfseries{\UNtopic}} \\

  \vspace{1em}

\begin{center}
\begin{minipage}{\UNbodywidth}
  %% Resolution heading
  {\bfseries \large{Resolution adopted by the \UNcommittee}} \\
  {\bfseries \large{on \UNdate}} \\
  \vspace{1em}

  %% Resolution number and title
  {\bfseries \UNresnumber.} {\bfseries \@title;} \\
  {{\bfseries Submitted by: \@author}} \\
  \vspace{2em}

  %% Lead-in
  {\itshape The \UNcommittee,}
  \vspace{1em}
  \end{minipage}
  \end{center}
}


% Preambulatory clauses
\newenvironment{preamb}{%
  \begin{list}{}{}%
}{\end{list}}

% Operative clauses
\newlist{operatives}{enumerate}{1}
\setlist[operatives]{
  label=\arabic*.,
  align=left,
  itemsep=0.8em,
}

%% Environment for body content (clauses, etc.)
\newlength{\UNmargin}
\AtBeginDocument{%
\setlength{\UNmargin}{0.25\dimexpr\textwidth-\UNbodywidth}
}
\newenvironment{UNbody}{%
\begin{adjustwidth}{\UNmargin}{\UNmargin}%
}{%
\end{adjustwidth}%
}

%% Capitalize first letter only
\makeatletter
\newcommand{\CapFirst}[1]{%
  \edef\temp{#1}%
  \MakeUppercase{\expandafter\@car\temp\@nil}%
  \expandafter\@cdr\temp\@nil
}
\makeatother

%% Clause macros
\newcommand{\preambclause}[2][]{\item {\itshape \CapFirst{#1}}~#2,}
\newcommand{\operativeclause}[2][]{\item {\itshape \CapFirst{#1}}~#2;}
\newcommand{\operativeclauselast}[2][]{\item {\itshape \CapFirst{#1}}~#2.}

%% End of class