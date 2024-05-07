%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Medium Length Professional CV
% LaTeX Template
% Version 0.1 (2023-11-01)
% 
% This template originates from:
% https://www.LaTeXTemplates.com
% 
% Author:
% tigerjack
% 
% Original author:
% Trey Hunner (http://www.treyhunner.com/)
% 
% License:
% CC BY-NC-SA 4.0 (https://creativecommons.org/licenses/by-nc-sa/4.0/)
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 


% ----------------------------------------------------------------------------------------
%	CLASS CONFIGURATION
% ----------------------------------------------------------------------------------------

\ProvidesClass{tresume}[2023/11/01 v0.1 Resume class]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}} % Pass through any options to the base class
\ProcessOptions\relax % Process given options

\LoadClass{article} % Load the base class

% ----------------------------------------------------------------------------------------
%	REQUIRED PACKAGES AND MISC CONFIGURATIONS
% ----------------------------------------------------------------------------------------

\RequirePackage[parfill]{parskip} % Remove paragraph indentation
% \RequirePackage{array} % Required for bold tabular columns
\RequirePackage{ifthen} % Required for ifthenelse statements
\RequirePackage{enumitem} % For lists advanced commands
\RequirePackage{changepage} % To change indentation of pages in tSection
\pagestyle{empty} % Suppress headers and footers on all pages
\RequirePackage{etaremune}

% ----------------------------------------------------------------------------------------
%	MARGINS
% ----------------------------------------------------------------------------------------
\RequirePackage{geometry} % Required for adjusting page dimensions and margins

\geometry{
	top=1.5cm, % Top margin
	bottom=1.5cm, % Bottom margin
	left=2.1cm, % Left margin
	right=2.1cm, % Right margin
	% showframe, % Uncomment to show how the type block is set on the page
}

% ----------------------------------------------------------------------------------------
%	NAME
% ----------------------------------------------------------------------------------------

\newcommand{\name}[1]{\renewcommand{\name}{#1}} % Defines the \name command to set the user's name
% \printname is used to output the user's name in a large size
\newcommand{\printname}{
	\begingroup
  \hfil{\MakeUppercase{\huge\bfseries\name}}\hfil % Style and output the user's name
  \bigskip\break % Vertical whitespace below name
	\endgroup
}
\AtBeginDocument{%
	\printname % Output the user's name
}

% ----------------------------------------------------------------------------------------
%	SECTION FORMATTING
% ----------------------------------------------------------------------------------------

% Defines the rSection environment for the major sections within the CV
\newenvironment{tSection}[1]{ % The single parameter is for the section title
	\medskip % Vertical whitespace
	\MakeUppercase{\textbf{#1}} % Section title
	\medskip % Vertical whitespace
	\hrule % Horizontal rule
  \begin{adjustwidth}{2em}{0pt}
  }{
  \end{adjustwidth}
}

% ----------------------------------------------------------------------------------------
%	WORK EXPERIENCE FORMATTING
% ----------------------------------------------------------------------------------------

\newenvironment{tSubsection}[4]{ % 4 parameters: company name, year(s) employed, job title and location
	\textbf{#1} \hfill {#2} % Bold company name and date to the right
	\ifthenelse{\equal{#3}{}}{}{ % If the third parameter is empty, don't output the job title and location line
		\\ % Job title and location on a new line
		\textit{#3} \hfill \textit{#4} % Output job title and location
	}%
	\smallskip % Vertical whitespace
	\begin{itemize}[label=$\cdot$, left=0em, itemsep=-.5em, topsep=-.5em] % \cdot used for bullets, no indentation
  }{%
	\end{itemize}
  \bigskip
}

% ----------------------------------------------------------------------------------------
%	LIST of publications
% ----------------------------------------------------------------------------------------
\newenvironment{tSubPublications}[2]{ % #1 Type of publication, #2 prefix
	\textbf{#1} \hfill  %
	\smallskip % Vertical whitespace
  % \begin{etaremune}[label=\textbf{#2\arabic*.}, left=0pt]
  \renewcommand*{\labelenumi}{[\labelprefix\theenumi]}
  \def\labelprefix{#2}
  \begin{etaremune}
		\setlength{\itemsep}{-0.5em} \vspace{-0.5em} % Reduce vertical spacing between items in the list for a tighter look
  }{
  \end{etaremune}
	\vspace{0.5em} % Vertical whitespace after the end of the list
}
%%%%% IFs
\newif\ifxetexorluatex\xetexorluatexfalse
\ifxetex
  \xetexorluatextrue
\fi
\ifluatex
  \xetexorluatextrue
\fi

\newif\ifpublic{}
\newif\ifgdpr{}
% by default it is set to false
\publicfalse{}
\gdprfalse{}

% FONTS
\ifxetexorluatex
  \usepackage[math-style=ISO, bold-style=ISO]{unicode-math}
  \setmainfont[
  BoldFont={EBGaramond-Bold.otf},
  ItalicFont={EBGaramond-Italic.otf},
  BoldItalicFont={EBGaramond-BoldItalic.otf},
  WordSpace=1.25
  ]{EBGaramond-Regular.otf}
  \setmathfont{Garamond-Math.otf}[StylisticSet={3}]
  % \setmonofont[Scale=MatchLowercase]{Source Code Pro}
\else
  \usepackage[lf]{ebgaramond}
  % \usepackage[oldstyle,scale=0.7]{sourcecodepro}
  \singlespacing
\fi
