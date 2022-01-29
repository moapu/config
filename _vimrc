""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" StatusLine customized

set runtimepath^=~/.vim/bundle/lightline.vim
set runtimepath^=~/.vim/bundle/nerdtree
map <C-n> :NERDTree
"autocmd VimEnter * NERDTree
map <c-h> :vertical resize +10 <enter>
map <c-l> :vertical resize -10 <enter>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" my own variables
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype on
syntax on
"colorscheme tomorrow_night
set number
filetype indent on
set expandtab
set tabstop=4
set smarttab
set softtabstop=4
set shiftwidth=4
set textwidth=120
set autoindent
set backspace=indent,eol,start
set mouse=a
