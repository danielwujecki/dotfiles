"                        _           
"  _ __   ___  _____   _(_)_ __ ___  
" | '_ \ / _ \/ _ \ \ / / | '_ ` _ \ 
" | | | |  __/ (_) \ V /| | | | | | |
" |_| |_|\___|\___/ \_/ |_|_| |_| |_|
"                                  
" @author danielgolf
"==========================

" #############################
" ######  General Stuff  ######
" #############################

set nocompatible                    " use vim settings rather then vi settings, must be first line

set encoding=UTF-8                  " use UTF-8
set ffs=unix,dos,mac                " use unix as the standard file type
set backspace=indent,eol,start      " allow backspacing over everything in insert mode

set number relativenumber           " relativ line numbers
set splitbelow splitright           " splits at the bottom and right

"set cul                             " highlight line number
set lbr                             " break lines that are longer than...
set tw=200                          " ...200 characters
set so=2                            " try to keep lines before and after the cursor
set ruler		                    " show the cursor position all the time
"set showcmd		                    " display incomplete commands
set showmatch                       " show matching brackets when cursor is over them
set incsearch		                " do incremental searching
set ignorecase                      " ignore case when searching
set matchpairs+=<:>                 " add a pair of brackets to jump with '%'
set history=100		                " keep 50 lines of command line history

set mat=2                           " how many tenths of a second to blink
set noerrorbells                    " no annoying sounds on errors
set updatetime=100                  " needed for gitgutter
set clipboard+=unnamedplus          " use system clipboard instead of primary

" tab settings
set tabstop=4
set shiftwidth=4
set expandtab

" backup settings
set undofile                        " Maintain undo history between sessions
set undodir^=$HOME/.vim/backup/
set backupdir^=$HOME/.vim/backup/
set directory^=$HOME/.vim/backup/

" ##############################
" ######   Key Settings   ######
" ##############################

" disable arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" open a terminal in vertical split window
map <C-t> :vert term<Return>

" #################################
" ######  Conditional Stuff  ######
" #################################

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
  augroup END
else
  set autoindent		" always set autoindenting on
endif " has("autocmd")

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 15 || has("gui_running")
  syntax on
  set hlsearch
endif

if has('langmap') && exists('+langnoremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If unset (default), this may break plugins (but it's backward
  " compatible).
  set langnoremap
endif

" ########################################
" ######     Plugins and Themes     ######
" ########################################

if !exists('g:vscode')

call plug#begin('~/.vim/plugged')
"Plug 'morhetz/gruvbox'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'jiangmiao/auto-pairs'
"Plug 'sheerun/vim-polyglot'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'ryanoasis/vim-devicons', { 'on': 'NERDTreeToggle' }
call plug#end()

" NERDtree
map <C-n> :NERDTreeToggle<Return>

" fzf keybind
map ; :FZF 

" airline settings
let g:airline_theme='hybrid'
let g:airline_symbols_ascii=1
let g:airline#extensions#tabline#enabled=1

" gruvbox theme
"colorscheme gruvbox
"set background=dark

" material-hybrid theme
if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    set background=dark
    colorscheme hybrid_material
endif

endif " !exists('g:vscode')
