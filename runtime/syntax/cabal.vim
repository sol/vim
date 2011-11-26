" Vim syntax file
" Language:	Haskell Cabal Build file
" Maintainer:	Vincent Berthoux <twinside@gmail.com>
" File Types:	.cabal
" v1.4: Add benchmark support, thanks to Simon Meier
" v1.3: Updated to the last version of cabal
"       Added more highlighting for cabal function, true/false
"       and version number. Also added missing comment highlighting.
"       Cabal known compiler are highlighted too.
"
" V1.2: Added cpp-options which was missing. Feature implemented
"       by GHC, found with a GHC warning, but undocumented. 
"       Whatever...
"
" v1.1: Fixed operator problems and added ftdetect file
"       (thanks to Sebastian Schwarz)
"
" v1.0: Cabal syntax in vimball format
"       (thanks to Magnus Therning)

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn match	cabalCategory	"\cexecutable"
syn match	cabalCategory	"\clibrary"
syn match	cabalCategory	"\cbenchmark"
syn match	cabalCategory	"\ctest-suite" 
syn match	cabalCategory	"\csource-repository" 
syn match	cabalCategory	"\cflag"

syn keyword     cabalConditional    if else
syn match       cabalOperator       "&&\|||\|!\|==\|>=\|<="
syn keyword     cabalFunction       os arche impl flag
syn match       cabalComment    /--.*$/
syn match       cabalVersion    "\d\+\(.\(\d\)\+\)\+"

syn match       cabalTruth      "\ctrue"
syn match       cabalTruth      "\cfalse"

syn match       cabalCompiler   "\cghc"
syn match       cabalCompiler   "\cnhc"
syn match       cabalCompiler   "\cyhc"
syn match       cabalCompiler   "\chugs"
syn match       cabalCompiler   "\chbc"
syn match       cabalCompiler   "\chelium"
syn match       cabalCompiler   "\cjhc"
syn match       cabalCompiler   "\clhc"


setlocal iskeyword+=-
syn case ignore
syn keyword	cabalStatement	author
syn keyword	cabalStatement	branch
syn keyword	cabalStatement	bug-reports
syn keyword	cabalStatement	build-depends
syn keyword	cabalStatement	build-tools
syn keyword	cabalStatement	build-type
syn keyword	cabalStatement	buildable
syn keyword	cabalStatement	c-sources
syn keyword	cabalStatement	cabal-version
syn keyword	cabalStatement	category
syn keyword	cabalStatement	cc-options
syn keyword	cabalStatement	copyright
syn keyword	cabalStatement	cpp-options
syn keyword	cabalStatement	data-dir
syn keyword	cabalStatement	data-files
syn keyword	cabalStatement	default
syn keyword	cabalStatement	description
syn keyword	cabalStatement	executable
syn keyword	cabalStatement	exposed-modules
syn keyword	cabalStatement	exposed
syn keyword	cabalStatement	extensions
syn keyword	cabalStatement	extra-lib-dirs
syn keyword	cabalStatement	extra-libraries
syn keyword	cabalStatement	extra-source-files
syn keyword	cabalStatement	extra-tmp-files
syn keyword	cabalStatement	for example
syn keyword	cabalStatement	frameworks
syn keyword	cabalStatement	ghc-options
syn keyword	cabalStatement	ghc-prof-options
syn keyword	cabalStatement	ghc-shared-options
syn keyword	cabalStatement	homepage
syn keyword	cabalStatement	hs-source-dirs
syn keyword	cabalStatement	hugs-options
syn keyword	cabalStatement	include-dirs
syn keyword	cabalStatement	includes
syn keyword	cabalStatement	install-includes
syn keyword	cabalStatement	ld-options
syn keyword	cabalStatement	license-file
syn keyword	cabalStatement	license
syn keyword	cabalStatement	location
syn keyword	cabalStatement	main-is
syn keyword	cabalStatement	maintainer
syn keyword	cabalStatement	module
syn keyword	cabalStatement	name
syn keyword	cabalStatement	nhc98-options
syn keyword	cabalStatement	other-modules
syn keyword	cabalStatement	package-url
syn keyword	cabalStatement	pkgconfig-depends
syn keyword	cabalStatement	stability
syn keyword	cabalStatement	subdir
syn keyword	cabalStatement	synopsis
syn keyword	cabalStatement	tag
syn keyword	cabalStatement	tested-with
syn keyword	cabalStatement	type
syn keyword	cabalStatement	version

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_cabal_syn_inits")
  if version < 508
    let did_cabal_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink cabalVersion       Number
  HiLink cabalTruth         Boolean
  HiLink cabalComment       Comment
  HiLink cabalStatement     Statement
  HiLink cabalCategory      Type
  HiLink cabalFunction      Function
  HiLink cabalConditional   Conditional
  HiLink cabalOperator      Operator
  HiLink cabalCompiler      Constant
  delcommand HiLink
endif

let b:current_syntax = "cabal"

" vim: ts=8

