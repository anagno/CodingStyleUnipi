%% ============================================================
\NeedsTeXFormat{LaTeX2e}[2005/12/01]
\ProvidesClass{assignment}[2011/09/01 v0.1 DIT.UoA Assignment LaTeX
  document class]

\LoadClass[a4paper,titlepage,twoside,12pt,leqno]{article}[2005/09/16]
%% ============================================================

%%
%% User Interface Commands
%%


% \idlabel:        how to label the ID of the author(s)
% \place:     the place where the exerc was deemed successfully completed

\newcommand{\idlabel}{A.M.}
\newcommand{\place}{Πειραιάς}
\newcommand{\projectlevel}[1]{\newcommand{\pprojectlevel}{#1}\relax}
\newcommand{\advisor}[1]{\newcommand{\padvisor}{#1}\relax}

% \university{name}{abr}:Δήλωση του Πανεπιστημίου και της συντόμευσης τους 
% \school{name}{abr}:Δήλωση της Σχολή και της συντόμευσης της
% \department{department}{abr}:Ο τομέας της σχολής και η συντόμευση του(δεν είναι υποχρεωτική η δήλωση του)
% \cover{path}{source}:Δηλωση του path της εικόνας του εξώφυλλου και της πηγής του


\makeatletter
\newcommand{\university}[2]{%
  \ifthenelse{\isundefined{\theuniversity}}{%
    \def\theuniversity{#1}
  }%
  {%
    \g@addto@macro\theuniversity{\\#1}
  }
 \ifthenelse{\isundefined{\abruniversity}}{%
    \def\abruniversity{#2}
  }%
  {%
    \g@addto@macro\abruniversity{\\#2}
  }
}
\makeatother

\makeatletter
\newcommand{\school}[2]{%
  \ifthenelse{\isundefined{\theschool}}{%
    \def\theschool{#1}
  }%
  {%
    \g@addto@macro\theuniversity{\\#1}
  }
 \ifthenelse{\isundefined{\abrschool}}{%
    \def\abrschool{#2}
  }%
  {%
    \g@addto@macro\abrschool{\\#2}
  }
}
\makeatother

\makeatletter
\newcommand{\department}[2]{%
  \ifthenelse{\isundefined{\thedepartment}}{%
    \def\thedepartment{#1}
  }%
  {%
    \g@addto@macro\theuniversity{\\#1}
  }
 \ifthenelse{\isundefined{\abrdepartment}}{%
    \def\abrdepartment{#2}
  }%
  {%
    \g@addto@macro\abrdepartment{\\#2}
  }
}
\makeatother


\makeatletter
\newcommand{\cover}[2]{%
  \ifthenelse{\isundefined{\coverpath}}{%
    \def\coverpath{#1}
  }%
  {%
    \g@addto@macro\coverpath{\\#1}
  }
 \ifthenelse{\isundefined{\coversource}}{%
    \def\coversource{#2}
  }%
  {%
    \g@addto@macro\coversource{\\#2}
  }
}
\makeatother


\makeatletter

\newcommand{\lesson}[2]{%
  \ifthenelse{\isundefined{\lessontitle}}{%
    \def\lessontitle{#1}
  }%
  {%
    \g@addto@macro\lessontitle{\\#1}
  }
 \ifthenelse{\isundefined{\lessonsemester}}{%
    \def\lessonsemester{#2}
  }%
  {%
    \g@addto@macro\lessonsemester{\\#2}
  }
}
\makeatother

\newcommand{\register}[2]{%
  \ifthenelse{\isundefined{\theregister}}{%
    \def\theregister{#1}
  }%
  {%
    \g@addto@macro\theregister{\\#1}
  }
 \ifthenelse{\isundefined{\semester}}{%
    \def\semester{#2}
  }%
  {%
    \g@addto@macro\semester{\\#2}
  }
}
\makeatother


%%
%% Format of the Title and Acceptance Pages
%%
\RequirePackage{titling}
\RequirePackage{xifthen}
\RequirePackage{textcomp}

% the logo should exist to go on.
%\IfFileExists{images/university.eps}{}{
%  \ClassError{thesisclass}{The logo of the University was not found.}
%             {Add the logo of the university in the class folder and try again.}
%}


% maketitle modifications (refer to the titling package)

\setlength{\droptitle}{-120pt}

\renewcommand{\maketitlehooka}{%
  \begin{center}
    \begin{singlespace}
     \includegraphics[scale=0.40]{images/university.eps} \\
      \vspace*{0.03in}

      {\fontsize{14pt}{16.8pt}\selectfont\bfseries
        \MakeUppercase{\theuniversity}} \\
      {\fontsize{12pt}{14.4pt}\selectfont\bfseries
        \MakeUppercase{\theschool}} \\ 

	\ifdefined\thedepartment{
 	 {\fontsize{12pt}{14.4pt}\selectfont\bfseries
        \MakeUppercase{\thedepartment}}}
	\fi
      
      \ifthenelse{\isundefined{\theregister}}{%
        \vspace*{30pt}
      }{
        \vspace*{0.20in}
      }

    \end{singlespace}
  \end{center}
}


%\titleformat{\chapter}[display]
%{\bfseries\Large}
%{\filleft\MakeUppercase{\chaptertitlename} \Huge\thechapter}
%{2ex}
%{\titlerule
%\vspace{1ex}%
%\filleft}
%[\vspace{1ex}%
%\titlerule]


\pretitle{%
  \begin{center} 
    \begin{singlespace} 
      \vspace{3ex} \Huge \selectfont\bfseries \hrule \vspace{0.5ex} %\\%[0.4cm] %\MakeUppercase
} 

\posttitle{%
 \vspace{0.8ex} \hrule \end{singlespace}\end{center}
}


\renewcommand{\maketitlehookb}{%
    
    \ifdefined\lessontitle{
    \begin{flushleft}
      \begin{singlespace}
        {Εργασία} \\
        {που υποβλήθηκε στο πλαίσιο τους μαθήματος "}\lessontitle{''} \\
        {του }\lessonsemester{ου Eξαμήνου Σπουδών του }\abrschool {, }\abruniversity
      \end{singlespace}
    \end{flushleft}
    \vspace*{0.20in}
    }
    \fi

  \vspace*{25pt}
  \ifdefined\coverpath{
    \ifthenelse{\isundefined{\theregister}}{%
      \begin{center}
        \begin{singlespace}
        \resizebox*{!}{8.5cm}{
        \includegraphics{\coverpath}}
      \end{singlespace}
    \end{center}
    }{}
  }
  \fi
 
  

  %\vspace*{25pt}
 
  \ifdefined\pprojectlevel{
  \begin{center}
    \begin{singlespace}
      \pprojectlevel
    \end{singlespace}
  \end{center}
  }
  \fi

}

\preauthor{%
  \begin{center}
    \begin{singlespace}
      \Large \selectfont\bfseries
}

\postauthor{
  \end{singlespace}\end{center}
}

\renewcommand{\maketitlehookc}{%

 \begin{center}

  \ifdefined\theregister{
    \ifdefined\semester{
      \begin{flushleft}
        \begin{singlespace}
          {{Μεταπτυχιακός φοιτητής }\abrschool {, }\abruniversity \\
                         {\semester\textsuperscript{ο}} { Εξάμηνο} \\
                         {Α.Μ.:} \theregister}
        \end{singlespace}
      \end{flushleft}
    }
    \fi
  }
  \fi 

\vspace*{25pt}

  \ifdefined\coverpath{
    \ifdefined\theregister{%
      \begin{center}
        \begin{singlespace}
        \resizebox*{!}{8.5cm}{
        \includegraphics{\coverpath}}
      \end{singlespace}
    \end{center}
    
    \vspace*{0.15in}
    }
    \fi
  }
  \fi

  \ifdefined\padvisor{ 
  \begin{center}
    \begin{singlespace}
      Επιβλέπων\\
      \vspace*{14pt}
      {\fontsize{14pt}{14.4pt}\selectfont\padvisor}
    \end{singlespace}
  \end{center}
  }
  \fi

\vspace*{14pt}
\line(1,0){250}
\end{center}


}

\predate{%
  \begin{center}
    \fontsize{12pt}{14.4pt}\selectfont\bfseries\MakeUppercase}
\postdate{\end{center}}

\renewcommand{\maketitlehookd}{%
  \newpage
   \thispagestyle{empty}
      \vspace*{350pt}

 \textcopyleft { } \thedate {} \theauthor  \\ \\
Το κείμενο αυτό έχει γραφτεί σε \XeLaTeX. \\
Αυτό το κείμενο διανέμεται σύμφωνα με τους όρους της άδειας \en{Creative Commons Attribution - ShareAlike Unported 3.0.} \\
Εν συντομία: Είστε ελεύθεροι να διανέμετε και να τροποποιήσετε αυτό το κείμενο εφόσον αναφέρετε τον δημιουργό του και διατηρήσετε την ίδια άδεια χρήσης. \\
Το παρόν έγγραφο διανέμεται με την ελπίδα ότι θα είναι χρήσιμο, αλλά χωρίς καμία εγγύηση, χωρίς ακόμη και την έμμεση εγγύηση εμπορευσιμότητας ή καταλληλότητας για κάποιο συγκεκριμένο σκοπό. \\
Οι απόψεις και τα συμπεράσματα που περιέχονται σε αυτό το έγγραφο εκφράζουν τον συγγραφέα και δεν πρέπει να ερμηνευτεί ότι αντιπροσωπεύουν το \theuniversity

      \vspace*{0.40in}
      \line(1,0){250}

      \ifdefined\coversource{
      {Εξώφυλλο: }{\coversource}
      }
      \fi      

}

\let\oldmaketitle\maketitle
\renewcommand{\maketitle}{\oldmaketitle
		          %\setcounter{page}{3}
}


\newenvironment{dedication} % Για την αφιέρωση
{
   \cleardoublepage
   \thispagestyle{empty}
   \vspace*{\stretch{1}}
   \hfill\begin{minipage}[t]{0.66\textwidth}
   \raggedleft
}%
{
   \end{minipage}
   \vspace*{\stretch{3}}
   \clearpage
}

\newenvironment{acknowledgements} % Για τις ευχαριστίες
    {\cleardoublepage\thispagestyle{empty}\null\vfill\begin{center}%
    \bfseries \huge{Ευχαριστίες} \vspace*{10pt} \end{center}}%
    {\vfill\null}


%%
%% End of Format of the Title and Acceptance Pages
%% ============================================================

%%
%% General Packages
%%
\RequirePackage[]{fontspec}
\RequirePackage{xltxtra}
\RequirePackage[monogreek]{xgreek}
\def\anwtonos{\char"0027\relax} % Επειδή στην γραμματοσειρά ubuntu δεν υπάρχει το σύμβολο U+0374
\newcommand{\en}[1]{\setlanguage{american}#1\setlanguage{monogreek}} % Για υφενώσεις στα αγγλικά

\defaultfontfeatures{Mapping=tex-text%, Scale=MatchLowercase}
} 
\setmainfont[]{Ubuntu} % Για τις γραμματοσειρές 
\setsansfont[]{Ubuntu} %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setmonofont[]{Ubuntu} %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%\newfontface\TVSp{DejaVu Serif}
%\def\textvisiblespace{{\TVSp\char"0884}}


\RequirePackage{hyperref} % In-text references
\RequirePackage{tabularx} % Special tables
\RequirePackage{multirow} % Είναι για τους πίνακες για πολλαπλές σειρές
\RequirePackage{amsmath}  % Είναι το πακέτο για τα μαθηματικά σύμβολα και τις εξισώσεις
\RequirePackage[]{natbib}   % Είναι το πακέτο για την βιβλιογραφία 


%%
%% End of General Packages
%% ============================================================

%%
%% Figures, Subfigures and Captions
%%
\RequirePackage{graphicx}              % To include graphics
\RequirePackage{float}                 % Figures
\RequirePackage[]{subfig}              % Subfigures

\RequirePackage{chngcntr}
\counterwithin{figure}{section}
\counterwithin{table}{section}

\RequirePackage[%
  justification=centering,
  labelsep=colon,
  figureposition=bottom,
  tableposition=top]{caption}          % Captions

\newfloat{photo}{tbp}{lop}[section] % Για τις εικόνες
\floatname{photo}{Εικόνα}
\newsubfloat{photo}


% caption fonts should be boldface 10pt.
\renewcommand{\captionfont}{\fontsize{10pt}{12pt}\selectfont\bfseries}
%%
%% End of Figures, Subfigures and Captions
%% ============================================================

%%
%% Margins of Text Pages
%%
\RequirePackage[%
  a4paper,
  top=2cm,   bottom=2cm,     left=2cm,    right=2cm, bindingoffset=0.5cm, 
  head=14pt, headsep=0.50cm, foot=0.75cm, footskip=0.9cm,
  headsep=0.7cm ]{geometry}
%%
%% End of Margins of Text Pages
%% ============================================================

%%
%% Paragraph and Line Spacing
%%
\RequirePackage{parskip}                  % Paragraphs
\RequirePackage[onehalfspacing]{setspace} % Lines

% Indentation preceeding a paragraph should be 0 pt, and vertical space after
% a paragraph should be 6 pt.
\setlength{\parindent}{0pt}
\setlength{\parskip}{6pt}
%%
%% End of Paragraph and Line Spacing
%% ============================================================

%%
%% Headers and Footers of Text Pages
%%
\RequirePackage{fancyhdr}

% each page should have a left header with the exerc title at 8 pt, a left 
% footer with the names of authors at 8 pt, and a right footer with the current
% page number at 10 pt.
\pagestyle{fancy}
%\renewcommand{\leftmark}{\chaptername\enspace\thechapter}
%\renewcommand{\rightmark}{\chaptertitle}

\fancyhead{} % clear all header fields
%\fancyhead[OR]{\scshape\nouppercase{\leftmark}}
\fancyhead[C]{}
%\fancyhead[EL]{\scshape\nouppercase{\rightmark}}
\fancyfoot[R]{}
\fancyfoot[C]{\thepage}
\fancyfoot[L]{}

%Η παρακάτω εντολή εξαφανίζει την γραμμή κάτω από την επικεφαλίδα.
\renewcommand{\headrulewidth}{0pt}
%%
%% End of Headers and Footers of Text Pages
%% ============================================================

%%
%% Format of Titles for Sections, Subsections and Subsubsections.
%%

\RequirePackage{titlesec}

%\titleformat{\chapter}[display]
%{\bfseries\Large}
%{\filleft\MakeUppercase{\chaptertitlename} \Huge\thechapter}
%{2ex}
%{\titlerule
%\vspace{1ex}%
%\filleft}
%[\vspace{1ex}%
%\titlerule]


% sections should be boldfaced, uppercase and centered, at 14pt, with no 
% further spacing near them.
\titleformat{\section}[block]
            {\Large \selectfont\flushleft\bfseries}
            {\thesection . }{3pt}{} 
%\titlespacing{\section}{0pt}{0pt}{5pt}
% subsections should be boldfaced and justified at left, at 12pt, with
% 12pt vertical spacing before them.
%\titleformat{\subsection}[block]
%            {\fontsize{12pt}{14.4pt}\selectfont\flushleft\bfseries}
%            {\thesubsection\quad}{0pt}{}
%\titlespacing{\subsection}{0pt}{12pt}{5pt}
% subsubsections should be boldfaced and justified at left, at 12pt, with
% 12pt vertical spacing before them.
%\titleformat{\subsubsection}[block]
%            {\fontsize{12pt}{14.4pt}\selectfont\flushleft\bfseries}
%            {\thesubsubsection\quad}{0pt}{}
%\titlespacing{\subsubsection}{0pt}{12pt}{5pt}
%%
%% End of Format of Titles for Sections, Subsections and Subsubsections.
%% ============================================================

%%
%% Format of Table of Contents, List of Figures and List of Tables.
%%
\RequirePackage{titletoc}
\RequirePackage[subfigure,titles]{tocloft}

% Table of Contents
\let\oldtableofcontents\tableofcontents
\DeclareRobustCommand{\tableofcontents}{
\oldtableofcontents
\line(1,0){250}
}

% place dots between each section and the respective page number
\renewcommand{\cftsecleader}{\bfseries\cftdotfill{\cftdotsep}}
% place dots between each subsection and the respective page number
%\renewcommand{\cftsubsecleader}{\bfseries\cftdotfill{\cftdotsep}}
% place a dot after each section number
%\renewcommand{\cftsecaftersnum}{. }
% section entries should be 12 pt and bold
\renewcommand{\cftsecfont}{\fontsize{12pt}{14.4pt}\selectfont\bfseries}
% subsection entries should be 10 pt
%\renewcommand{\cftsubsecfont}{\fontsize{10pt}{12pt}\selectfont\bfseries}
% subsubsection entries should be 10 pt
%\renewcommand{\cftsubsubsecfont}{\fontsize{10pt}{12pt}\selectfont}
% subsections should not be indented, whereas subsubsections should
%\setlength\cftsubsubsecindent\cftsubsecindent
%\setlength{\cftsubsecindent}{0pt}
% subsections should have the same vertical space with sections
%\setlength\cftbeforesubsecskip\cftbeforesecskip
% space between sections and numbering in case of double digit numbers
%\newlength{\tocbinnumwidth}
%\settowidth{\tocbinnumwidth}{9}
%\addtolength{\cftsecnumwidth}{\tocbinnumwidth}

% List of Figures
\let\oldlistoffigures\listoffigures
\DeclareRobustCommand{\listoffigures}{
  \oldlistoffigures
  \line(1,0){250}
}

% place ``Figure x:'' labels in front of each figure
\newlength{\figlabelwidth}
%\renewcommand{\cftfigpresnum}{\figurename\enspace}
\renewcommand{\cftfigaftersnum}{\qquad}
\settowidth{\figlabelwidth}{\cftfigaftersnum}
\addtolength{\cftfignumwidth}{\figlabelwidth}

% List of Tables
\let\oldlistoftables\listoftables
\DeclareRobustCommand{\listoftables}{
  \oldlistoftables
  \line(1,0){250}
}

% place ``Table x:'' labels in front of each table
\newlength{\tablabelwidth}
%\renewcommand{\cfttabpresnum}{\tablename\enspace}
\renewcommand{\cfttabaftersnum}{\qquad}
\settowidth{\tablabelwidth}{\cfttabaftersnum}
\addtolength{\cfttabnumwidth}{\tablabelwidth}

% List of photo (Με το πακέτ float γίνονται αυτά)

\makeatletter
\newcommand{\listofphotos}{%
  \@namedef{l@photo}{\@dottedtocline{1}{1.5em}{4em}}
  \float@listhead{Κατάλογος Εικόνων}%
  \begingroup\setlength{\parskip}{\z@}%
    \@starttoc{\@nameuse{ext@photo}}%
  \endgroup%
}%
\makeatother



%Για την δημιουργία mini περιεχομένων στην αρχή του κάθε κεφαλαίου 

%\usepackage{minitoc}
%\dominitoc

%\renewcommand{\mtctitle}{}  % Για να μην εμφανίζεται η λέξη Contects
%\mtcsetrules{minitoc}{off}  % Για να εξαφανιστούν κάτι γραμμές
%\renewcommand{\afterminitoc}{\newpage} 



%%
%% End of Format of Table of Contents, List of Figures and List of Tables.
%% ============================================================



\hypersetup{%
pdfborder = {0 0 0},
}


%----------------------------------------------------------------------------------------
%	CODE INCLUSION CONFIGURATION
%----------------------------------------------------------------------------------------

\RequirePackage{color}
%\PassOptionsToPackage{usenames,dvipsnames}{color}
\definecolor{Brown}{cmyk}{0,0.81,1,0.60}
\definecolor{OliveGreen}{cmyk}{0.64,0,0.95,0.40}
\definecolor{CadetBlue}{cmyk}{0.62,0.57,0.23,0}


\definecolor{DarkGreen}{rgb}{0.0,0.4,0.0} % Comment color
\definecolor{highlight}{RGB}{255,251,204} % Code highlight color
\definecolor{highlight2}{RGB}{235,235,235} % Code highlight color

\RequirePackage{listings}
\lstdefinestyle{cpp}
{
language={C++},                % choose the language of the code
backgroundcolor=\color{highlight}, % Set the background color for the snippet - useful for highlighting
basicstyle=\footnotesize\ttfamily, % The default font size and style of the code
breaklines=true, % Automatic line breaking (prevents code from protruding outside the box)
captionpos=b, % Sets the caption position: b for bottom; t for top
commentstyle=\usefont{T1}{pcr}{m}{sl}\color{DarkGreen}, % Style of comments within the code - dark green courier font
firstnumber=1, % Line numbers begin at line 1
frame=single, % Frame around the code box, value can be: none, leftline, topline, bottomline, lines, single, shadowbox
frameround=tttt, % Rounds the corners of the frame for the top left, top right, bottom left and bottom right positions
keywordstyle=\color{Brown}\bf, % Functions are bold and blue
%
numbers=left,                   % where to put the line-numbers
numberstyle=\footnotesize,      % the size of the fonts that are used for the line-numbers
stepnumber=5,                   % the step between two line-numbers. If it is 1 each line will be numbered
numbersep=10pt,                  % how far the line-numbers are from the code
%
showspaces=false,               % show spaces adding particular underscores
showstringspaces=false,         % underline spaces within strings
showtabs=false,                 % show tabs within strings adding particular underscores
showlines=true,                 % show empty lines after the end of the program
frame=single,           % adds a frame around the code
tabsize=2,          % sets default tabsize to 2 spaces
captionpos=b,           % sets the caption-position to bottom
breaklines=true,        % sets automatic line breaking
breakatwhitespace=false,    % sets if automatic breaks should only happen at whitespace
identifierstyle=\ttfamily\color{CadetBlue}\bfseries,
stringstyle=\ttfamily,
showstringspaces=ture
%escapeinside={\%*}{*)}          % if you want to add a comment within your code
}

\lstdefinestyle{Bash}
{language=bash,
keywordstyle=\color{blue},
basicstyle=\ttfamily,
morekeywords={peter@kbpet},
alsoletter={:~$}, %$
%morekeywords=[2]{peter@kbpet:},
%keywordstyle=[2]{\color{red}},
literate={\$}{{\textcolor{red}{\$}}}1 
         {:}{{\textcolor{red}{:}}}1
         {~}{{\textcolor{red}{\textasciitilde}}}1,
breaklines=true, % Automatic line breaking (prevents code from protruding outside the box)
frameround=tttt, % Rounds the corners of the frame for the top left, top right, bottom left and bottom right positions
frame=single, % Frame around the code box, value can be: none, leftline, topline, bottomline, lines, single, shadowbox
backgroundcolor=\color{highlight2}, % Set the background color for the snippet - useful for highlighting
}

\renewcommand{\lstlistingname}{Πρόγραμμα}

%----------------------------------------------------------------------------------------
%	END CODE INCLUSION CONFIGURATION
%----------------------------------------------------------------------------------------

%----------------------------------------------------------------------------------------
%	Assignment configuration
%
% Structured General Purpose Assignment
% LaTeX Template
%
% This template has been downloaded from:
% http://www.latextemplates.com
%
% Original author:
% Ted Pavlic (http://www.tedpavlic.com)
%----------------------------------------------------------------------------------------

\RequirePackage{extramarks} % Required for headers and footers

% Header and footer for when a page split occurs within a problem environment
\newcommand{\enterAssignmentHeader}[1]{
\nobreak\extramarks{#1}{#1 Συνέχεια στην επόμενη σελίδα\ldots}\nobreak
\nobreak\extramarks{#1 (Συνέχεια)}{#1 συνέχεια στην επόμενη σελίδα\ldots}\nobreak
}

% Header and footer for when a page split occurs between problem environments
\newcommand{\exitAssignmentHeader}[1]{
\nobreak\extramarks{#1 (συνέχεια)}{#1 συνέχεια στην επόμενη σελίδα\ldots}\nobreak
\nobreak\extramarks{#1}{}\nobreak
}

%\setcounter{secnumdepth}{0} % Removes default section numbers
\newcounter{AssignmentCounter} % Creates a counter to keep track of the number of problems

\newcommand{\AssignmentName}{}
\newenvironment{Assignment}[1][Ερώτημα \arabic{AssignmentCounter}]{ % Makes a new environment called Assignment which takes 1 argument (custom name) but the default is "Problem #"
\stepcounter{AssignmentCounter} % Increase counter for number of problems
\renewcommand{\AssignmentName}{#1} % Assign \AssignmentName the name of the problem
\section{\AssignmentName} % Make a section in the document with the custom problem count
\enterAssignmentHeader{\AssignmentName} % Header and footer within the environment
}{
\exitAssignmentHeader{\AssignmentName} % Header and footer after the environment
}

\newcommand{\AssignmentTitle}[1]{ % Defines the problem title command with the content as the only argument
\noindent\framebox[\columnwidth][c]{\begin{minipage}{0.98\columnwidth}#1\end{minipage}} % Makes the box around the problem answer and puts the content inside
}

\newcommand{\AssignmentSectionName}{}
\newenvironment{AssignmentSection}[1]{ % New environment for sections within Assignment, takes 1 argument - the name of the section
\renewcommand{\AssignmentSectionName}{#1} % Assign \AssignmentSectionName to the name of the section from the environment argument
\subsection{\AssignmentSectionName} % Make a subsection with the custom name of the subsection
\enterAssignmentHeader{\AssignmentName\ [\AssignmentSectionName]} % Header and footer within the environment
}{
\enterAssignmentHeader{\AssignmentName} % Header and footer after the environment
}

%----------------------------------------------------------------------------------------
%	End of Assignment configuration
%----------------------------------------------------------------------------------------

