\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{UoM_letter}[2017/01/15 University of Manchester letter style]

%
% University of Manchester Letterhead
%
% Based on, and inspired by, Computer Science Letterhead
%

\newif\iflogo@
\logo@true
\newif\ifps@
\ps@false
\newif\ifhelv@
\helv@false

\RequirePackage{graphicx}
\RequirePackage{xstring}

%
% OPTIONS
\DeclareOption{nologo}{\logo@false}
\DeclareOption{times}{\ps@true}
\DeclareOption{helv}{\ps@true\helv@true}
\DeclareOption{a4paper}{\typeout{A4 is the default papersize}}
\DeclareOption{a5paper}{\typeout{A5 paper option ignored}}
\DeclareOption{letterpaper}{\typeout{letter paper option ignored}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{letter}}



% Phone, fax, email address, etc.
\def\phone@prefix{+44 (0) 161 }
\def\split@extension#1{
  \IfBeginWith{#1}{5}{275 \StrRight{#1}{4}}{306 \StrRight{#1}{4}}
}

\def\phonenumber#1{\def\@phone{tel \phone@prefix \split@extension{#1}}}
\def\faxnumber#1{\def\@fax{fax \phone@prefix \split@extension{#1}}}
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

% The old umcsd-let had a \prof command, so new-let does as well.
\def\prof#1{\typeout{\protect\prof\space not supported at present}}

% Don't give full path name, let latex and dvips find it
\def\@psfile{\special{psfile=UoM_logo_corner.jpg %newunilogo-corner.ps
               voffset=-65
               hoffset=-20
               hscale=15 vscale=15}}
\def\@pdffile{\begin{picture}(0,0)
              \put(-65,-40){
              \includegraphics[width=5cm,height=4.63cm]{UoM_logo_corner}}
	      \end{picture}}

% Optional subject line, as for umcsd-let
\newtoks\@subjheadtoks
\newif\ifsubjline@
\subjline@false
\def\subjhead#1{\subjline@true\@subjheadtoks={#1}}



% PROCESS OPTIONS
\ProcessOptions

% LOAD letter
\LoadClass{letter}


\DeclareFontFamily{OT1}{phv}{}

\DeclareFontShape{OT1}{phv}{b}{n}{
   <-> s * [.9] phvb7t
}{}

\DeclareFontShape{OT1}{phv}{b}{sc}{
   <-> s * [.9] phvbc7t
}{}

\DeclareFontShape{OT1}{phv}{b}{sl}{
   <-> s * [.9] phvbo7t
}{}

\DeclareFontShape{OT1}{phv}{bc}{n}{
   <-> s * [.9] phvbrn7t
}{}

\DeclareFontShape{OT1}{phv}{bc}{sc}{
   <-> s * [.9] phvbcn7t
}{}

\DeclareFontShape{OT1}{phv}{bc}{sl}{
   <-> s * [.9] phvbon7t
}{}

\DeclareFontShape{OT1}{phv}{m}{n}{
   <-> s * [.9] phvr7t
}{}

\DeclareFontShape{OT1}{phv}{m}{sc}{
   <-> s * [.9] phvrc7t
}{}

\DeclareFontShape{OT1}{phv}{m}{sl}{
   <-> s * [.9] phvro7t
}{}

\DeclareFontShape{OT1}{phv}{mc}{n}{
   <-> s * [.9] phvrrn7t
}{}

\DeclareFontShape{OT1}{phv}{mc}{sc}{
   <-> s * [.9] phvrcn7t
}{}

\DeclareFontShape{OT1}{phv}{mc}{sl}{
   <-> s * [.9] phvron7t
}{}

\DeclareFontShape{OT1}{phv}{bx}{n}{<->ssub * phv/b/n}{}
\DeclareFontShape{OT1}{phv}{bx}{sc}{<->ssub * phv/b/sc}{}
\DeclareFontShape{OT1}{phv}{bx}{sl}{<->ssub * phv/b/sl}{}
\DeclareFontShape{OT1}{phv}{b}{it}{<->ssub * phv/b/sl}{}
\DeclareFontShape{OT1}{phv}{bx}{it}{<->ssub * phv/b/it}{}
\DeclareFontShape{OT1}{phv}{bc}{it}{<->ssub * phv/bc/sl}{}
\DeclareFontShape{OT1}{phv}{m}{it}{<->ssub * phv/m/sl}{}
\DeclareFontShape{OT1}{phv}{mc}{it}{<->ssub * phv/mc/sl}{}

\DeclareFontFamily{T1}{phv}{}

\DeclareFontShape{T1}{phv}{b}{n}{
   <-> s * [.9] phvb8t
}{}

\DeclareFontShape{T1}{phv}{b}{sc}{
   <-> s * [.9] phvbc8t
}{}

\DeclareFontShape{T1}{phv}{b}{sl}{
   <-> s * [.9] phvbo8t
}{}

\DeclareFontShape{T1}{phv}{bc}{n}{
   <-> s * [.9] phvbrn8t
}{}

\DeclareFontShape{T1}{phv}{bc}{sc}{
   <-> s * [.9] phvbcn8t
}{}

\DeclareFontShape{T1}{phv}{bc}{sl}{
   <-> s * [.9] phvbon8t
}{}

\DeclareFontShape{T1}{phv}{m}{n}{
   <-> s * [.9] phvr8t
}{}

\DeclareFontShape{T1}{phv}{m}{sc}{
   <-> s * [.9] phvrc8t
}{}

\DeclareFontShape{T1}{phv}{m}{sl}{
   <-> s * [.9] phvro8t
}{}

\DeclareFontShape{T1}{phv}{mc}{n}{
   <-> s * [.9] phvrrn8t
}{}

\DeclareFontShape{T1}{phv}{mc}{sc}{
   <-> s * [.9] phvrcn8t
}{}

\DeclareFontShape{T1}{phv}{mc}{sl}{
   <-> s * [.9] phvron8t
}{}

\DeclareFontShape{T1}{phv}{bx}{n}{<->ssub * phv/b/n}{}
\DeclareFontShape{T1}{phv}{bx}{sc}{<->ssub * phv/b/sc}{}
\DeclareFontShape{T1}{phv}{bx}{sl}{<->ssub * phv/b/sl}{}
\DeclareFontShape{T1}{phv}{b}{it}{<->ssub * phv/b/sl}{}
\DeclareFontShape{T1}{phv}{bx}{it}{<->ssub * phv/b/it}{}
\DeclareFontShape{T1}{phv}{bc}{it}{<->ssub * phv/bc/sl}{}
\DeclareFontShape{T1}{phv}{m}{it}{<->ssub * phv/m/sl}{}
\DeclareFontShape{T1}{phv}{mc}{it}{<->ssub * phv/mc/sl}{}

\normalfont

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
  \thispagestyle{empty} %
  \iflogo@%
    \ifx\pdfoutput\undefined
       \@psfile
    \else
       \@pdffile%
    \fi
    \vspace*{-3.5cm}
    \begin{flushright}
%    \hspace*{\fill}
    \begin{minipage}[t]{4.0cm}{
      \fontsize{9pt}{9pt}\fontfamily{phv}\fontseries{m}\selectfont
      The University of Manchester\\[-1.25ex]
      \@orgmain\\[-1.25ex]
      \iforgsub@
        \@orgsub\\[-1.25ex]
      \fi
      \@building\\[-1.25ex]
      Oxford Road\\[-1.25ex]
      Manchester\\[-1.25ex]
      M13 9PL\\[1.0ex]
      \@phone\\[-1.25ex]
      \@fax\\[-1.25ex]
      \@email\\
    }
    \end{minipage}

    \end{flushright}
    %
   \else%
    \vspace*{0.3cm}%
    \begin{flushright}
    \begin{minipage}[t]{4.0cm}%
    {\fontsize{8pt}{8pt}\fontfamily{phv}\fontseries{m}\selectfont%
     \textbf{(Room: \@building)}\\}
    \end{minipage}
    \end{flushright}
   \fi

   \normalfont
   \normalsize%
   \vskip\baselineskip%
   \@date\\[\baselineskip]%
   \ignorespaces \toname\\%
   \toaddress\par\nobreak%
   \vspace{3\baselineskip minus 2\baselineskip}%%
   #1\par\nobreak%
   \ifsubjline@%
   \parbox{\textwidth}{\begin{center}%
       \the\@subjheadtoks%
     \end{center}}%
   \par\nobreak\fi}

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

\ifps@
 \RequirePackage{pslatex}
 \ifhelv@
%   \typeout{Using Helvetica font for letter body}
   \def\familydefault{\sfdefault}
 \fi
\fi
