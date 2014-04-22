" no compatible with vi
set nocompatible

" vundle-required config
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'gmarik/vundle'

" plugins to be installed via vundle
Plugin 'kien/ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'Raimondi/delimitMate'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'ervandew/supertab'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-fugitive'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-surround'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Bundle 'plasticboy/vim-markdown'

" base16 colorscheme for vim
Plugin 'chriskempson/base16-vim'

" don't let vundle mess with indentation
filetype on     " required

" Look and Feel
syntax on
colorscheme Tomorrow-Night
set background=dark
set guifont:Inconsolata\ for\ Powerline:h20
set ruler
set number

set t_Co=256
" show invisible characters
"set list
"set lcs=trail:·
"set lcs=eol:
"set list listchars=tab:»·,trail:·

" show file name at title bar
set title
set showcmd
set showbreak=↪
" Code editing
set smartindent
set tabstop=2
set shiftwidth=2
set autoindent
" reload files when changed on disk
set autoread
" use the same clipboard with osx
set clipboard=unnamed
" split window to the bottom and the right (for vsp) by default
set splitbelow
set splitright

set encoding=utf-8
set backspace=indent,eol,start
set ch=1
set linespace=3
set expandtab
set cursorline

set nobackup
set nowritebackup
set noswapfile

" No empty newlines at the end of lines
set binary
set noeol

set wildmenu
set wildmode=list:longest

" https://github.com/garybernhardt/dotfiles/blob/master/.vimrc
" number of lines to keep from the edge when scrolling
set scrolloff=5
" fix delay when type `O` (capital o) in normal mode
set timeout timeoutlen=1000 ttimeoutlen=100

" key binding
let mapleader=","
" nmap <space> : - not really used
imap <leader>e <esc>
map <leader>c <c-_><c-_>
map <leader>d :NERDTreeToggle<CR>
nmap <leader>b :bn<CR>
nmap <leader>B :bp<CR>

" emmet
imap <leader>t <C-y>,
nmap noh :nohl<CR>
nmap fx :FixWhitespace<CR>

" easymotion
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

"automatically source .vimrc after save
if has("autocmd")
    autocmd bufwritepost .vimrc source $MYVIMRC
endif

" using vim-airline, only `laststatus` config needed here ...
if has('statusline')
  " Always show status line
  set laststatus=2
  " Broken down into easily includable segments
  " Filename
  " set statusline=%<%f
  " Options
  " set statusline+=%W%h%m%r
  " Current directory
  " set statusline+=\ [%{getcwd()}]
  " Right aligned file nav info
  " set statusline+=%=%-14.(%l,%c%c%)\ %p%%

  " Vim Powerline
  " Ubuntu
  " set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
  " OSX 10.8
  " set rtp+=~/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim
endif

"hide menu bar for gvim
if has('gui_running')
  set guioptions-=T  " no toolbar
endif

"enable mouse support in console
set mouse=a

"highlight search results
set hlsearch

" let g:neocomplcache_enable_at_startup=1

" tab completion for neocomplcache plugin
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" disable  arrow keys O_O
noremap <left> <nop>
noremap <right> <nop>
noremap <up> <nop>
noremap <down> <nop>

set runtimepath^=~/.vim/bundle/ctrlp.vim
" Settings for vim-multicursor plugin
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<leader><leader>'

" Settings for ctrlp-funky plugin
nmap <C-p> CtrlP
let g:ctrlp_extensions = ['funky']
let g:ctrlp_funky_syntax_highlight = 1
nnoremap <C-R> :CtrlPFunky<Cr>

" Settings for vim-airline
" use powerline-patched fonts
let g:airline_powerline_fonts = 1
" enable displaying all buffers when only 1 tab is opened
let g:airline#extensions#tabline#enabled = 1
" use | instead of > for bufferline
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" Settings for vim-gitgutter
" always show sign column (gutter)
let g:gitgutter_sign_column_always = 1