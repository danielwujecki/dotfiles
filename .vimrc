" __     _____ __  __ 
" \ \   / /_ _|  \/  |
"  \ \ / / | || |\/| |
"   \ V /  | || |  | |
"    \_/  |___|_|  |_|
"
"==========================

" #############################
" ######  General Stuff  ######
" #############################

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

set encoding=UTF-8                  " use UTF-8
set backspace=indent,eol,start      " allow backspacing over everything in insert mode
set number relativenumber           " Zeilen relativ nummerieren

set splitright                      " always split on the right site
set history=100		                " keep 50 lines of command line history
set ruler		                    " show the cursor position all the time
set showcmd		                    " display incomplete commands
set incsearch		                " do incremental searching
set smartcase                       " ignore case when searching
set so=5                            " try to keep lines before and after the cursor
set noerrorbells                    " no annoying sounds on errors
set ffs=unix,dos,mac                " use unix as the standard file type
set updatetime=100                  " gitgutter
set timeoutlen=1000
set ttimeoutlen=5
set cul

set showmatch                       " show matching brackets when cursor is over them
set mat=2
set matchpairs+=<:>

set lbr                             " Linebreak on 500 characters
set tw=200

" metadateien in speichern
set undofile                        " Maintain undo history between sessions
set undodir^=$HOME/.vim/backup/
set backupdir^=$HOME/.vim/backup/
set directory^=$HOME/.vim/backup/

" tabs mit 4 Leerzeichen
set tabstop=4
set shiftwidth=4
set expandtab

" disable arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

inoremap jj <ESC>

" #############################
" ######  Special Stuff  ######
" #############################

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 15 || has("gui_running")
  syntax on
  set hlsearch
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

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

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


if has('langmap') && exists('+langnoremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If unset (default), this may break plugins (but it's backward
  " compatible).
  set langnoremap
endif


" #############################
" ######     Plugins     ######
" #############################

packadd indentLine
packadd nerdtree
packadd vim-airline
packadd vim-devicons
packadd vim-gitgutter
packadd vim-polyglot

" NERDtree
map <C-n> :NERDTreeToggle<CR>
" fzf keybind
map ; :FZF

" ayu theme
if has("termguicolors")
  packadd ayu-vim
  set termguicolors
  let ayucolor="mirage"
  colorscheme ayu
endif
