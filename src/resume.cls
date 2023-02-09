% LaTeX document class for Curriculum Vitae
%
% Author: Paweł‚ Żak
% k\NeedsTexFormat{LaTeX2e}
\ProvidesClass{resume}[2020/06/21 Curriculum Vitae LaTeX class]


%%%%
% First, make it clear that we base this class on the LaTeX-standard `article'
% class and set necessary options. This class operates on a fixed canvas and I
% do not intend to allow any other type of paper of font size
\DeclareOption*{\OptionNotUsed}
\ProcessOptions

\LoadClass[oneside,a4paper,11pt]{article}
%%%%

%%%%
% Second come all the packages
%
% Provides >{cmd} and >{cmd} column specifications
\RequirePackage{array}
% For plus and minus operators
\RequirePackage{calc}
% coloring tables
\RequirePackage{colortbl}
% Spacing in enumeration environments
\RequirePackage{enumitem}
% Provides methods to modify header and footer contents
\RequirePackage{fancyhdr}
% Set margins everywhere.
% \RequirePackage[top=.8in,bottom=1in,left=.8in,right=.8in]{geometry}
% \includegraphics with PNG support
\RequirePackage{graphicx}
% color and colorbox commands
\RequirePackage[usenames]{xcolor}
% links within document (require xcolor from above):
\definecolor{DarkBlue}{rgb}{0.100, 0.000, 0.550}
\RequirePackage[colorlinks,urlcolor=DarkBlue]{hyperref}
% no idea, paths with white characters AFAIK
\RequirePackage[space]{grffile}
% UTF-8 input
\RequirePackage[utf8]{inputenc}
% Long table
\RequirePackage{longtable}
% For adjusting paragraph distance
\RequirePackage{parskip}
% For reformatting section headings
\RequirePackage{titlesec}
% \xspace -- allows to define commands that appear not to eat spaces
\RequirePackage{xspace}
% \ifdefempty
\RequirePackage{etoolbox}
%%%%


\makeatletter

%%%%
%% Now comes the layout:
%%

% Make text area a 18cm x 26cm box in the middle of an A4 page:
\setlength{\topmargin}{-2cm}
\setlength{\voffset}{0cm}
\setlength{\oddsidemargin}{-1.1cm}
\setlength{\evensidemargin}{-1.1cm}
\setlength{\footskip}{16pt}
\setlength{\headheight}{16pt}
\setlength{\textwidth}{18cm}
\setlength{\textheight}{26cm}

% Create a custom length for parskip, to share it between various environments:
\newlength{\cv@parskip}
\setlength{\cv@parskip}{2pt plus 2pt} 

% Set the parskip to the custom parskip:
\setlength{\parskip}{\cv@parskip} % The default parskip is 0 plus 1pt

% Set to 0pt all separators between list items (members of itemize or enumerate
% environments).
\setlist{nosep}

% Set the default font to sans-serif
\renewcommand{\familydefault}{\sfdefault}
%%%%

%%%%
%% Update headings:

\titleformat{\section}[block]    % sectioning command and shape
 {\relax}                        % format for both label and text
 {}                              % label
 {0pt}                           % space between label and text
 {\large\rmfamily\scshape}       % Font for the heading. Note, that we have to
                                 % use serifs for small caps to work
 [\normalcolor\normalsize\vspace*{.1\baselineskip}\titlerule]% 
%%%%

%%%%
%% Update header and footer
\renewcommand\headrulewidth{1pt}
\renewcommand\footrulewidth{1pt}
\lhead{\thepage}
\def\@author{} % Reset author to empty value, regardless of that article class
               % has by default
\chead{\large{\rmfamily\scshape Curriculum Vitae \ifx\@author\empty\else --- \@author\fi}}
              % ^ Similarily to the headings, small caps only work with serif
              % fonts
\rhead{\thepage}
\cfoot{\footnotesize \it I hereby authorize you to process my personal data
included in my job application for the needs of the recruitment process.}
%%%%

\makeatother
%%%%
%% The `factstable' environment, based on a long table
\newenvironment{factstable}{%
 \begin{longtable}{%
  >{%
   \raggedleft%
   \let\newline\\%
   \footnotesize\itshape%
   \hspace{0pt}% Allows the first word to be hyphneated
  }p{.20\textwidth}%
  |p{.75\textwidth}}%
}{%
 \end{longtable}
}
\makeatletter
%% Enlarge a distance between items in the factstable:
\renewcommand{\arraystretch}{1.1}
%%%%

\newenvironment{fact}[1][\empty]{%
 \ifx\empty#1\relax\else%
  {\bfseries #1}\vspace{\cv@parskip}\newline%
  \vspace{\cv@parskip}%
 \fi%
%
 \begin{minipage}[t]{\linewidth}%
  \setlength{\parskip}{\cv@parskip}%
}{%
 \end{minipage}%
 \vspace{\baselineskip}%
}

\newcommand{\factheading}[1]{\multicolumn{2}{c}{\bf #1}\\\hline}

\newcommand{\highlights}[1]{
 \begin{flushright}
  {\bfseries #1}
 \end{flushright}
}

\pagestyle{fancy}

\newcommand{\cvphotoinsert}{\makebox(0,0){\includegraphics[width=75pt, height=100pt]{img/face.jpeg}}}

\makeatother
