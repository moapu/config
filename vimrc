syntax on
colorscheme slate
filetype on
filetype plugin on

set path+=**				" find files into subfolders
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
set wildmenu				" display all matching files when we tab complete
set wildmode=list:longest		" Make wildmenu behave like similar to Bash completion.

set nocompatible			" Disable compatibility with vi which can cause unexpected issues.
set backspace=indent,eol,start
set mouse=a
set cursorline				" Highlight cursor line underneath the cursor horizontally.
set nocuc				" do not show cursorcloumn
set nobackup				" Do not save backup files.
set ignorecase
set incsearch
set hlsearch
set number relativenumber 
set showmatch
set smartcase
set nowrap
set tabstop=8
set softtabstop=5
set shiftwidth=4
set autoindent
set smarttab 
set clipboard=unnamedplus		" Use system clipboard
set diffopt=filler,vertical		" Vertical diff
set scrolloff=10			" Do not let cursor scroll below or above N number of lines when scrolling.
set history=1000			" Set the commands to save in history default number is 20

set showcmd				" show cmd as you type
set statusline=
set statusline+=\ %F\ %m\ %Y\ %R
set statusline+=%=
set statusline+=\ line\ %l\ col:\ %c\ \|\ %L\ lines\ \|\ percent:\ %p%%
set laststatus=2
set showmode

" ---------------------------------------------------------------------------------------------------------------------
" MAPPINGS
" ---------------------------------------------------------------------------------------------------------------------
let mapleader=' '

nnoremap <leader>\ ``			
inoremap jj <esc>
nnoremap <leader>nr :set norelativenumber<CR> 
nnoremap <leader>rn :set relativenumber<CR> 
nnoremap <leader>q :q<CR> 
nnoremap <leader>s :w<CR>
nnoremap <leader>f :find 
nnoremap <leader>d yyp 
nnoremap <leader>p :e<space> 
nnoremap <leader>x dd 
nnoremap o o<esc>
nnoremap O O<esc>
nnoremap Y y$
nnoremap ; :

" file explorer
nnoremap <leader>1 :e .<CR>

" moving lines up and down
nnoremap <C-Down> :m .+1<CR>==
nnoremap <C-Up> :m .-2<CR>==
vnoremap <C-Down> :m '>+1<CR>==gv=gv
vnoremap <C-Up> :m '<-2<CR>==gv=gv
inoremap <C-Down> <Esc>:m .+1<CR>==gi
inoremap <C-Up> <Esc>:m .-2<CR>==gi
