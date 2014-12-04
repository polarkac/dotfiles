set nocompatible

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Set mapleader to comma
let mapleader = ','

" Bind Ctrl + [h,j,k,l] for quick window movement
map <c-h> <c-w>h
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l

" Easy sorting of selected lines
vnoremap <Leader>s :sort<CR>

" Better indenting of code block
vnoremap < <gv
vnoremap > >gv

" Enable syntax highlighting
filetype off
filetype plugin indent on
syntax on

" Set runtimepath for Vundle and initialiaze it
set rtp+=~/.vim/bundle/vundle
call vundle#begin()

" Vundle can manage itself
Plugin 'gmarik/Vundle.vim'

" Library needed by some plugins
Plugin 'L9'

" Molokai colorscheme
Plugin 'tomasr/molokai'

" Quick navigation for files/folders in current folder
Plugin 'scrooloose/nerdtree'

" Quick switching between source and header file
Plugin 'a.vim'

" Quick (un)comment line(s)
Plugin 'scrooloose/nerdcommenter'

" Check source code syntax
Plugin 'scrooloose/syntastic'

" Easy managing for snippets
Plugin 'SirVer/ultisnips'

" Autocompletion for quotes, parentheses etc
Plugin 'Raimondi/delimitMate'

" Groovy syntax for .gradle files
Plugin 'tfnico/vim-gradle'

" Fuzzy finder for files and buffers
Plugin 'kien/ctrlp.vim'

" Autocompletion in insert mode
Plugin 'ervandew/supertab'

" Completion, better indention etc for python scripts
Plugin 'klen/python-mode'

call vundle#end()

" No code folding
set nofoldenable

" Set colorscheme to molokai
colorscheme molokai

" NERDTree should ignore Python binary files
let NERDTreeIgnore = ['\.pyc$'] 
" Map Ctrl + x to open NERDTree file explorer
nnoremap <C-x> :NERDTreeToggle<CR>
inoremap <C-x> <Esc>:NERDTreeToggle<CR>

" Vertical split for UltiSnips edit window
let g:UltiSnipsEditSplit = 'vertical'

" Ctrlp should ignore some hidden folders and binary/temp files
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn)$',
            \ 'file': '\v\.(pyc|swp|so|class)$',
            \ }

" Set Syntastic to use python and flake8 checkers for Python
let g:syntastic_python_checkers = ['python', 'flake8']
" Ignore some conventions and set line length to 85
let g:syntastic_python_flake8_args = '--ignore=E302 --max-line-length=85'

" Move line up
nnoremap k :m .-2<CR>==
inoremap k <Esc>:m .-2<CR>==gi
" Move block up
vnoremap k :m '<-2<CR>gv=gv
" Move line down
nnoremap j :m .+1<CR>==
inoremap j <Esc>:m .+1<CR>==gi
" Move block down
vnoremap j :m '>+1<CR>gv=gv
" Hack to switch from insert to normal mode in instant (10ms)
" If this is not set, <Esc>j or <Esc>k will act same as mapping above
set ttimeoutlen=10
set timeoutlen=10

" Make files should use tabs instead of spaces
autocmd FileType make setlocal noexpandtab

" Set relative numbers with current line number on cursor line
set relativenumber
set number
" Switch to absolute numbers in Insert mode
autocmd InsertEnter * set number norelativenumber
" Switch back to relative numbers in Normal mode
autocmd InsertLeave * set number relativenumber

" Set dark background
set background=dark
" Set tab to result in 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab

" Set smartindent so after newline cursor is at right place
set smartindent

" Ignores case
set ignorecase
set smartcase
" Highlight searched word
set incsearch

" Always show status bar
set laststatus=2

" Reload file if it was changed
set autoread

" Show options for command complete above
set wildmenu

" Show vertical line on 85 column
set colorcolumn=85

" Persistent undo, it remember changes after file is closed
set undofile
set undodir=~/.vim/undo
set undolevels=1000
set undoreload=10000

" Highlight matched parentheses with light blue background
highlight MatchParen ctermbg=LightBlue

" Set local Python path for Powerline
let $PYTHONPATH='~/.local/lib/python3.4/site-packages'
" Initialize Powerline
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
