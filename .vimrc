" ---- Armno's .vimrc ----
" collection (and probably stolen ones) of vim configuration
"
" required:
" 	- vundle: for managing plugins
" 	- the silver searcher: (way) faster search (used with CtrlP)
"
" 		use `brew` to install silver search
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

set shell=/bin/zsh
" meh
set nocompatible

" vundle-required config
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'gmarik/vundle'

                                         " ----- plugins to be installed via vundle -----
Plugin 'kien/ctrlp.vim'                  " sublime-text-like Cmd+P - navigate through files
Plugin 'tacahiroy/ctrlp-funky'           " sublime-text-like Cmd+R - navigate through functions
Plugin 'Raimondi/delimitMate'            " automatically close quotes, brackets
Plugin 'editorconfig/editorconfig-vim'   " enable .editorconfig support automatically
Plugin 'mattn/emmet-vim'                 " emmet (formerly zen coding) for vim
Plugin 'scrooloose/nerdtree'             " display directories and files list
Plugin 'scrooloose/nerdcommenter'        " another comment plugin
Plugin 'ervandew/supertab'               " enable using <tab> for completion
Plugin 'Lokaltog/vim-easymotion'         " make search better
Plugin 'tpope/vim-fugitive'              " git support in vim
Plugin 'terryma/vim-multiple-cursors'    " sublime-text-likd Cmd+d - multiple cursors
Plugin 'tpope/vim-surround'              " easily manipulate surrounding tags/characters
Plugin 'tomtom/tcomment_vim'             " commenting made easy
Plugin 'bronson/vim-trailing-whitespace' " highlight whitespace in red
Plugin 'airblade/vim-gitgutter'          " display git status in vim's gutter
Plugin 'bling/vim-airline'               " an alternative (and lighter) to powerline
Plugin 'scrooloose/syntastic'            " syntax checker
Plugin 'godlygeek/tabular'               " plugin for aligning text, required for vim-markdown
Plugin 'plasticboy/vim-markdown'         " enable mardown syntax support
Plugin 'vim-scripts/matchit.zip'         " make % highlights mating tags
Plugin 'pangloss/vim-javascript'         " syntax and indent plugin for javascript

Plugin 'chriskempson/base16-vim' 							" base16 colorscheme for vim

" don't let vundle mess with indentation / folding for markdown files
filetype plugin on

" ----- look and feel ----- "
syntax on                       " enable syntax highlighting
set background=dark             " use dark background to reduce tears level
set t_Co=256                    " enable 256-color mode
let base16colorspace=256
colorscheme base16-railscasts
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
set list
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
imap <leader>e <esc>
nmap <leader>b :bn<CR>
nmap <leader>B :bp<CR>
nmap noh :nohl<CR>

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

" nerdtree
map <leader>d :NERDTreeToggle<CR>

" vim-trailingspace
nmap fx :FixWhitespace<CR>

" emmet
imap <leader><tab> <C-y>,

" easymotion
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" vim-multicursor
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<leader><leader>'

" ctrlp/ctrlp-funky plugins
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""' " use ag to perform search (faster) https://github.com/ggreer/the_silver_searcher
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$|node_modules|_site',
    \ 'file': '\v\.(exe|so|dll|png|jpg|gif|ico)$'
    \ }
let g:ctrlp_extensions = ['funky']
let g:ctrlp_funky_syntax_highlight = 1
nnoremap <leader>r :CtrlPFunky<Cr>
" let g:ctrlp_show_hidden = 1                       " show hidden files in ctrlp (might slow down)

" vim-airline
let g:airline_powerline_fonts = 1                   " use powerline-patched fonts
let g:airline#extensions#tabline#left_sep = ' '     " use | instead of > for bufferline
let g:airline#extensions#tabline#left_alt_sep = '|'

" vim-gitgutter
let g:gitgutter_sign_column_always = 1              " always show sign column (gutter)
let g:gitgutter_max_signs = 5000

" syntactic
let g:syntastic_php_checkers = ['php']
let g:syntastic_html_checkers=['']
let g:syntastic_javascript_gjslint_conf = "-nojsdoc"

" vim-markdown
" disable folding when open markdown files
let g:vim_markdown_folding_disabled=1