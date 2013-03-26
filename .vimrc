" Make Vim more useful
set nocompatible

" Look and Feel
" Lucius color scheme is at https://github.com/vim-scripts/Lucius
syntax on
colorscheme lucius
LuciusDarkLowContrast
set guifont:Droid\ Sans\ Mono\ 13
set ruler
set number
" show invisible characters
" set lcs=eol:¬
" set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
" set list
" show file name at title bar
set title

" Code editing
set tabstop=2
set shiftwidth=2
set smartindent
set autoindent
set backspace=indent,eol,start

set nobackup
set nowritebackup

" No empty newlines at the end of lines
set binary
set noeol

set wildmenu
set wildmode=list:longest

" key binding
nmap <space> :
imap ,e <esc>
imap ,<tab> <C-x><C-o>
" let mapleader=","

"automatically source .vimrc after save
if has("autocmd")
    autocmd bufwritepost .vimrc source $MYVIMRC
endif

"hide menu bar for gvim
if has('gui_running')
  set guioptions-=T  " no toolbar
  "colorscheme desertEx
endif

"enable mouse support in console
set mouse=a

"highlight search results
set hlsearch

if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif
