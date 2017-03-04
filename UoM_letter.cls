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
%
% OPTIONS
\DeclareOption{international}{\international}
%\DeclareOption{nologo}{\logo@false}
\DeclareOption{nologo}{\typeout{nologo option not yet available}}
\DeclareOption{times}{\ps@true}
\DeclareOption{helv}{\ps@true\helv@true}
\DeclareOption{a4paper}{\typeout{A4 is the default papersize}}
\DeclareOption{a5paper}{\typeout{A5 paper option ignored}}
\DeclareOption{letterpaper}{\typeout{letter paper option ignored}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{letter}}



% Fax, extension number and email address.

\def\phone@prefix{0161 }
\def\international{\def\phone@prefix{+44 (0) 161 }}

\def\fax#1{\def\@fax{Fax: +44 (0) 161 275  #1}}
\fax{6204}

\def\phonenumber#1{\def\@extension{Direct: +44 (0) 161 275 #1}}
\def\extension#1{\def\@extension{Telephone: \phone@prefix 275 2000 ext. #1}}
\def\@extension{%
%  \@@warning{No telephone extension specified---using dept office
%  number \phone@prefix 275 6124}%
  tel +44 (0) 161 306 9280}

%\newcommand{\date}[1]{\renewcommand{\today}{#1}}

\def\shrm#1{\def\@shrm{#1}}

\def\email#1{\def\@email{#1}}

\def\extraa#1{\def\@extraa{#1}}
\def\extrab#1{\def\@extrab{#1}}
\def\extrac#1{\def\@extrac{#1}}
\def\extrad#1{\def\@extrad{#1}}

% The old umcsd-let had a \prof command, so new-let does as well.
\def\prof#1{\typeout{\protect\prof\space not supported at present}}

% Suppress the printing of the logo, so that the letter may be copied onto
% the pre-printed notepaper.
\def\nologo{\logo@false}

% Don't give full path name, let latex and dvips find it
\def\@psfile{\special{psfile=UoM_logo_corner.jpg %newunilogo-corner.ps
               voffset=-65
               hoffset=-20
               hscale=15 vscale=15}}
\def\@pdffile{\begin{picture}(0,0)
              \put(-50,30){
              \includegraphics[width=3.47cm]{UoM_logo}}
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

% FONTS
%\def\familydefault{\sfdefault}
%\def\sfdefault{phv}
%\def\rmdefault{ptm}
%\def\ttdefault{pcr}
%\def\bfdefault{b}

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
  \ifx\@empty\fromaddress%
  \else  % home address
    \@warning{Sender's address ignored---default assumed.}%
  \fi%
  \thispagestyle{empty} %
  \iflogo@%
    \ifx\pdfoutput\undefined
       \@psfile
    \else
       \@pdffile%
    \fi
    \vspace*{-2.0cm}%
    \begin{flushright}
%    \hspace*{\fill}
    \begin{minipage}[t]{4.0cm}%
      {%\renewcommand{\baselinestretch}{0.0}
      \fontsize{8pt}{8pt}\fontfamily{phv}\fontseries{m}\selectfont%
      \textbf{School of Computer Science}\\[-0.75ex]
      The University of Manchester\\[-1.25ex]
      \@shrm\\[-1.25ex]
      Oxford Road\\[-1.25ex]
      Manchester\\[-1.25ex]
      M13 9PL\\[0.0ex]
     \vspace*{0cm}
      www.manchester.ac.uk
          %\@extension\\[-1.25ex]
     %\@fax\\[1.25ex]
     %hcw.cs.manchester.ac.uk\\
     %www.manchester.ac.uk\\[-1.25ex]www.cs.man.ac.uk/$\sim$sharper
    }
    \end{minipage}

    \end{flushright}
    %
   \else%
    \vspace*{0.3cm}%
    \begin{flushright}
    \begin{minipage}[t]{4.0cm}%
    {\fontsize{8pt}{8pt}\fontfamily{phv}\fontseries{m}\selectfont%
     \textbf{(Room: \@shrm)}\\}
    \end{minipage}
    \end{flushright}
   \fi%
   {
    \begin{flushright}
      \begin{minipage}[t]{4.0cm}%

      {%\renewcommand{\baselinestretch}{0.0}
      \fontsize{8pt}{8pt}\fontfamily{phv}\fontseries{m}\selectfont%
      %\textbf{School of Computer Science}\\[-0.75ex]
      %The University of Manchester\\[-1.25ex]
      %2.44, Kilburn Building\\[-1.25ex]
      %Oxford Road\\[-1.25ex]
      %Manchester\\[-1.25ex]
      %M13 9PL\\[0.0ex]
      \vspace{-3mm}
     \@extension\\
     \@fax\vspace{3mm}\\
      %http://hcw.cs.manchester.ac.uk
      %http://www.manchester.ac.uk/research/caroline.jay/
      %www.cs.man.ac.uk/$\sim$sharper\\


        %\fontsize{8pt}{8pt}\fontfamily{phv}\fontseries{m}\selectfont%
        % \@extension\\%
        % \@fax%
        \mbox{}
        \@ifundefined{@email}{}{\vspace{-3mm}\\\@email}%%
        %\@ifundefined{@extraa}{}{\\\@extraa}%
         %\@ifundefined{@extrab}{}{\\\@extrab}%
         %\@ifundefined{@extrac}{}{\\\@extrac}%
         %\@ifundefined{@extrad}{}{\\\@extrad}\par
       }
      \end{minipage}
    \end{flushright}
  }%
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
