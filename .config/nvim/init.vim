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

set ffs=unix,dos,mac                " use unix as the standard file type
set backspace=indent,eol,start      " allow backspacing over everything in insert mode

set number relativenumber           " relativ line numbers
set splitbelow splitright           " splits at the bottom and right
set cursorline                      " highlight line number
set wrap                            " break lines that are longer than...
set scrolloff=4                     " try to keep lines before and after the cursor
set ruler		                    " show the cursor position all the time
set showmatch                       " show matching brackets when cursor is over them
set incsearch		                " do incremental searching
set ignorecase                      " ignore case when searching
set matchpairs+=<:>                 " add a pair of brackets to jump with '%'
set history=100		                " keep 50 lines of command line history
set clipboard+=unnamedplus          " use system clipboard instead of primary
set mat=2                           " how many tenths of a second to blink
set noerrorbells                    " no annoying sounds on errors
set updatetime=100                  " needed for gitgutter

" tab settings
set tabstop=4
set shiftwidth=4
set expandtab

" backup settings
set undofile                        " Maintain undo history between sessions
set undodir^=$HOME/.vim/backup/
set backupdir^=$HOME/.vim/backup/
set directory^=$HOME/.vim/backup/

" python setup
let g:loaded_python_provider=0
let g:python3_host_prog='/home/daniel/.pyenv/versions/mypython/bin/python3'

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  filetype plugin indent on
  set mouse=nv
endif

" Vim jumps to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" ##############################
" ######   Key Settings   ######
" ##############################

" disable arrow keys
"noremap <Up>    <Nop>
"noremap <Down>  <Nop>
"noremap <Left>  <Nop>
"noremap <Right> <Nop>

" move lines up and down
nnoremap <A-j> :m +1<CR>==
nnoremap <A-k> :m -2<CR>==
inoremap <A-j> <Esc>:m +1<CR>==gi
inoremap <A-k> <Esc>:m -2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" open a terminal in vertical split window
map <C-t> :vert term<Return>

" use tab for next buffer
nmap <Tab> :bn<Return>

" Compile current file with pdflatex
nmap <C-l> :!pdflatex %<Return>

" ########################################
" ######     Plugins and Themes     ######
" ########################################

if !exists('g:vscode')

call plug#begin('~/.vim/plugged')
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'ryanoasis/vim-devicons', { 'on': 'NERDTreeToggle' }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight', { 'on': 'NERDTreeToggle' }

Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'vim-python/python-syntax'

"Plug 'jreybert/vimagit'
"Plug 'sheerun/vim-polyglot'
call plug#end()

map <C-n> :NERDTreeToggle<Return>
map ; :FZF<Return>
let g:python_highlight_all=1

" airline settings
let g:airline_theme='hybrid'
let g:airline_symbols_ascii=1
let g:airline#extensions#tabline#enabled=1

" material-hybrid theme
if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    set background=dark
    colorscheme hybrid_material
endif

endif " !exists('g:vscode')
