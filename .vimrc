" ---- Armno's .vimrc ----
" collection (and probably stolen ones) of vim configuration
"
" required:
" 	- vundle: for managing plugins
" 	- the silver searcher: (way) faster search (used with CtrlP)
"
" 		use `brew` to install silver searcher
"
" 		```sh
" 		$ brew install the_silver_searcher
" 		```
"
" 		then install vundle
"
" 		```sh
" 		$ cd dotfiles
" 		$ git clone https://github.com/gmarik/vundle.git .vim/bundle/vundle
" 		```
"

let g:python_host_prog = '/usr/local/bin/python'
set shell=/bin/zsh
" meh
set nocompatible

" vundle-required config
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

                                         " ----- plugins to be installed via vundle -----
Plugin 'ctrlpvim/ctrlp.vim'                  " sublime-text-like Cmd+P - navigate through files
Plugin 'tacahiroy/ctrlp-funky'           " sublime-text-like Cmd+R - navigate through functions
Plugin 'Raimondi/delimitMate'            " automatically close quotes, brackets
Plugin 'editorconfig/editorconfig-vim'   " enable .editorconfig support automatically
Plugin 'mattn/emmet-vim'                 " emmet for vim
Plugin 'ervandew/supertab'               " enable using <tab> for completion
Plugin 'Lokaltog/vim-easymotion'         " make search better
Plugin 'tpope/vim-surround'              " easily manipulate surrounding tags/characters
Plugin 'bronson/vim-trailing-whitespace' " highlight whitespace in red
Plugin 'airblade/vim-gitgutter'          " display git status in vim's gutter
Plugin 'godlygeek/tabular'               " plugin for aligning text, required for vim-markdown
Plugin 'plasticboy/vim-markdown'         " enable mardown syntax support
Plugin 'vim-scripts/matchit.zip'         " make % highlights mating tags
Plugin 'pangloss/vim-javascript'         " syntax and indent plugin for javascript
Plugin 'wookiehangover/jshint.vim'
Plugin 'chriskempson/base16-vim'         " base16 colorscheme for vim
Plugin 'xsbeats/vim-blade'
Plugin 'mxw/vim-jsx'
Plugin 'leafgarland/typescript-vim'
" Plugin 'ternjs/tern_for_vim'
Plugin 'rking/ag.vim'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'tpope/vim-vinegar'

call vundle#end()            " required

" don't let vundle mess with indentation / folding for markdown files
filetype plugin on

" ----- look and feel ----- "
syntax on                       " enable syntax highlighting
set background=dark             " use dark background to reduce tears level
set t_Co=256                    " enable 256-color mode
let base16colorspace=256
colorscheme base16-ocean
set ruler                       " show ruler (vim-airline will take care of this anyway)
set number                      " show line numbers
set title                       " show file name in title bar
set hlsearch                    " highlight search researchs
set showbreak=↪                 " display this character for line break
set linespace=3                 " spaces between lines
set cursorline                  " highlight current line where the cursor is at
set scrolloff=5                 " number of lines to keep from the edge when scrolling
if has('statusline')
  set laststatus=2              " always show status line
endif
" set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set lcs=tab:⤑\ ,trail:·,eol:¬
set nolist
" ---- general settings ----
set mouse=a                     " enable mouse support in console
set autoread                    " reload files when changed on disk
set clipboard=unnamed           " use the same clipboard with osx
set encoding=utf-8              " when in doubt, use utf-8
set nobackup                    " who needs backup?
set nowritebackup
set noswapfile                  " who needs swap files?
set binary                      " allow vim to edit binary files
set showcmd                     " show typing command (bottom right)
set visualbell                  " enable vim's visual bell instead of beeeeeep
set t_vb=                       " then visual bell does nothing. so no beeeeep
set ttyfast                     " fast terminal connection between terminal and vim

if !has('nvim')
	set ttyscroll=3
endif

set lazyredraw

" ----- code editing -----
set tabstop=2                               " use 2 spaces for a tab
set shiftwidth=2                            " use 2 spaces for indent
set smartindent                             " be smart, even for indentation
set autoindent
set splitbelow                              " split window to the bottom and the right (for vsp) by default
set splitright
set backspace=indent,eol,start              " allow using backspace in insert mode
set ch=1
set noeol                                   " no empty newlines at the end of lines
set wildmenu                                " enable code completion in enhanced mode
set wildmode=list:longest                   " list all matched strings in autocomplete
set timeout timeoutlen=1000 ttimeoutlen=100 " fix delay when type `O` (capital o) in normal mode

" ----- key bindings -----
let mapleader=","
nnoremap ; :
imap <leader>e <esc>
nmap <leader>b :bn<CR>
nmap <leader>B :bp<CR>
nmap noh :nohl<CR>

" netrw (file explorer)
map <leader>d :Explore<CR>

" disable moving around with arrow keys in normal mode
noremap <left> <nop>
noremap <right> <nop>
noremap <up> <nop>
noremap <down> <nop>

" Use ctrl-[hjkl] to select the active split
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" put closing x the next line when hit enter
inoremap {<cr> {<cr>}<c-o>O
inoremap [<cr> [<cr>]<c-o>O
inoremap (<cr> (<cr>)<c-o>O

" enable omni completion
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" ----- plugin-specific settings & key bindings ----- "

" vim-trailingspace
nmap fx :FixWhitespace<CR>

" emmet
imap <leader><tab> <C-y>,

" easymotion
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" ctrlp/ctrlp-funky plugins
let g:ctrlp_user_command = 'ag %s --hidden -l --nocolor -g ""' " use ag to perform search (faster) https://github.com/ggreer/the_silver_searcher
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_use_caching = 0                         " ag is fast enough that CtrlP doesn't need to cache
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_extensions = ['funky']
let g:ctrlp_funky_syntax_highlight = 1
nnoremap <leader>r :CtrlPFunky<Cr>

" The Silver Searcher
" https://robots.thoughtbot.com/faster-grepping-in-vim
" Use `ag` over `grep`
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif

" bind K to grep word under cursor
" nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind Ctrl-F to grep shortcut
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap <C-F> :Ag<SPACE>

" vim-airline
let g:airline_powerline_fonts = 1                   " use powerline-patched fonts
let g:airline#extensions#tabline#left_sep = ' '     " use | instead of > for bufferline
let g:airline#extensions#tabline#left_alt_sep = '|'

" vim-gitgutter
let g:gitgutter_sign_column_always = 1              " always show sign column (gutter)
let g:gitgutter_max_signs = 5000

" vim-markdown
" disable folding when open markdown files
let g:vim_markdown_folding_disabled=1

" vim-syntaxhighlighther
" prevent super slow for lengthy lines
set synmaxcol=200

" vim-jsx
" enable jsx syntax highlighting for non-jsx extensions
let g:jsx_ext_required = 0

" vim-jshint
" hint only on save
let JSHintUpdateWriteOnly=1

" netrw directory style
let g:netrw_liststyle=3