\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{UoM_letter}[2017/01/15 University of Manchester letter style]

%
% University of Manchester Letterhead
%
% Based on, and inspired by, Computer Science Letterhead
%

\newif\iflogo@
\logo@true

\RequirePackage{graphicx}
\RequirePackage{xstring}
\RequirePackage{color}
\RequirePackage{pslatex}
\RequirePackage[normalem]{ulem}
\RequirePackage[UKenglish]{isodate}

%
% OPTIONS
\DeclareOption{nologo}{\logo@false}
\DeclareOption{a4paper}{\typeout{A4 is the default papersize}}
\DeclareOption{a5paper}{\typeout{A5 paper option ignored}}
\DeclareOption{letterpaper}{\typeout{letter paper option ignored}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{letter}}

% Colour for the address text.
\definecolor{grey}{gray}{0.5}

% Phone, fax, email address, etc.
\def\phone@prefix{+44 (0) 161 }
\def\split@extension#1{
  \IfBeginWith{#1}{5}{275 \StrRight{#1}{4}}{306 \StrRight{#1}{4}}
}

\def\phonenumber#1{\def\@phone{tel \phone@prefix \split@extension{#1}}}
\newif\iffax@
\fax@false
\def\faxnumber#1{\fax@true\def\@fax{fax \phone@prefix \split@extension{#1}}}
\def\email#1{\def\@email{#1}}

% Organizational units:
% Faculty, School, Directorate, etc - required
\def\orgmain#1{\def\@orgmain{#1}}
% Division, etc - optional
\newif\iforgsub@
\orgsub@false
\def\orgsub#1{\orgsub@true\def\@orgsub{#1}}

% building. Could be <building> or <room, building>.
\def\building#1{\def\@building{#1}}

% Optional subject line, as for umcsd-let
\newtoks\@subjheadtoks
\newif\ifsubjline@
\subjline@false
\def\subjhead#1{\subjline@true\@subjheadtoks={#1}}

% Set Helvetica as the font to use.
\renewcommand\familydefault{\sfdefault}

% A couple of commands for notes, etc.
\newcommand{\notetoself}[1]{\textcolor{red}{[\uppercase{#1}]}}
\newcommand{\changed}[1]{\textcolor{red}{\uwave{#1}}}

% Nicer date
\cleanlookdateon

% PROCESS OPTIONS
\ProcessOptions

% LOAD letter
\LoadClass[10pt, a4paper]{letter}

% Update the name command to include a role for the signatory
\renewcommand*{\name}[2]{\def\fromname{{#1}\\{#2}}}
\name{}{}

\renewcommand*{\signature}[1]{\def\fromsig{\includegraphics[height=1.5cm]{#1}\\}}


% Slightly condensed paras, and no initial indent.
\setlength{\parskip}{1.1ex}
\setlength{\parindent}{0pt}

% Make it an error not to call \opening
\newtoks\let@everypar
\let\old@letter=\letter
\def\letter{%
  \global\let@everypar\expandafter{\the\everypar}%
  \global\everypar{%
    \@latexerr
      {No \string\opening\space command, the letterhead will not appear.}%
      \@ehb
    \global\everypar\expandafter{\the\let@everypar}}%
  \old@letter}

% opening modified to include the letterhead
\def\opening#1{%
  \global\everypar\expandafter{\the\let@everypar}%
  \thispagestyle{empty}

  \iflogo@
    % Position the logo.
    \begin{picture}(0,0)
      \put(-50,30){
      \includegraphics[width=3.47cm]{UoM_logo}}
    \end{picture}

    % Position the address block.
    \vspace*{-3.0cm}
    \begin{flushright}
    \begin{minipage}[t]{4.0cm}
      \fontsize{9pt}{9pt}\selectfont
      \color{grey}
      The University of Manchester\\
      \@orgmain\\
      \iforgsub@
        \@orgsub\\
      \fi
      \@building\\
      Oxford Road\\
      Manchester\\
      M13 9PL\\
      \\
      \@phone\\
      \iffax@
        \@fax\\
      \fi
      \@email\\
      \\
      \color{black}
      \@date
    \end{minipage}
    \end{flushright}
  \else % No logo.
    \vspace*{0.175cm}%
    \begin{flushright}
    \begin{minipage}[t]{4.0cm}
      \fontsize{9pt}{9pt}\selectfont
      \color{grey}
      (Room: \@building)\\
      \\
      \color{black}
      \@date
    \end{minipage}
    \end{flushright}
   \fi % End logo.

   \normalfont
   \normalsize
   \vskip\baselineskip
   \ignorespaces \toname\\%
   \toaddress\par\nobreak%
   \vspace{3\baselineskip minus 2\baselineskip}%%
   #1\par\nobreak%
   \ifsubjline@%
   \parbox{\textwidth}{\begin{center}%
       \the\@subjheadtoks%
     \end{center}}%
   \par\nobreak\fi}

\renewcommand{\closing}[1]{\par\nobreak\vspace{\parskip}%
  \stopbreaks
  \noindent
  \parbox{\indentedwidth}{\raggedright
  \ignorespaces #1\\
  \ifx\@empty\fromsig
    \vspace{6\medskipamount}
    \fromname
    \vspace{2\medskipamount}
  \else
    \fromsig
    \fromname
    \vspace{2\medskipamount}
  \fi\strut}%
  \par}

% no stretchability at the very top of the first page
\def\@texttop{}
%


% now set  pagesize while nobody is looking


\topmargin -45truept     %    Nominal distance from top of paper to top of page
\textwidth=159truemm
\oddsidemargin=0truemm \evensidemargin=\oddsidemargin
\ifcase \@ptsize
    % mods for 10 pt (\baselineskip=12pt)
    \textheight 682pt  % Height of text (including footnotes and figures)
\or % mods for 11 pt (\baselineskip=13.6pt)
    \textheight 690 pt    % Height of text (including footnotes and figures)
\or % mods for 12 pt  (\baselineskip=15pt)
    \textheight 685 pt    % Height of text (including footnotes and figures)
\fi
