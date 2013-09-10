" Enable Syntax highlighting
filetype on " without this vim emits a zero exit status, later, because of :ft off 
filetype off

"Some stuff to get Vundle to work
set nocompatible  " be iMproved
filetype plugin indent on
syntax enable

set rtp +=~/.vim/bundle/vundle/
call vundle#rc()
" Let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles
Bundle 'bling/vim-airline'
"Bundle 'Lokaltog/vim-easymotion'
Bundle 'mileszs/ack.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'airblade/vim-gitgutter'
Bundle 'skwp/greplace.vim'
Bundle 'austintaylor/vim-indentobject'
Bundle 'vim-scripts/kwbdi.vim'
Bundle 'tmhedberg/matchit'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-pastie'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/syntastic'
Bundle 'majutsushi/tagbar'
Bundle 'leafgarland/typescript-vim'
Bundle 'tpope/vim-unimpaired'
Bundle 'vim-markdown-preview'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'tpope/vim-vividchalk'
Bundle 'MarcWeber/UltiSnips'

" Languages
Bundle "kchmck/vim-coffee-script"
Bundle 'tpope/vim-rails.git'
Bundle 'slim-template/vim-slim'

" Colors
Bundle "nanotech/jellybeans.vim"
Bundle "Pychimp/vim-luna"
Bundle "baskerville/bubblegum"

filetype plugin indent on

" Various sets to make stuff better
set autoindent
set autoread
set backspace=2        "indent,eol,start
set backupcopy=yes
"set t_vb=
set clipboard=unnamed
set cmdheight=2
set cursorline
set directory-=.
set encoding=utf-8
set expandtab
set formatoptions=qrn1
set ignorecase
set incsearch
set laststatus=2
set list
set listchars=tab:▸\ ,trail:▫
"set hidden
set number
set ruler
set scrolloff=3
set shiftwidth=2
set showcmd
set smartindent
set smartcase
set softtabstop=2
set splitright
set switchbuf=useopen
set synmaxcol=400
set tabstop=8
set t_Co=256
set visualbell
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu
set wildmode=longest,list,full

" I don't know what these do but I should find out
set noswapfile
"set nobackup
set undofile
set undodir=~/tmp/vim/undo

" Same here I don't know what these do but I need to figure it out
set showmatch
set incsearch
set hlsearch
set foldlevelstart=0

" Better Completion
set omnifunc=syntaxcomplete#Complete
set complete=.,w,b,u,t
set completeopt+=longest,menuone,preview

set mouse=a
if exists('$TMUX') "Support resizing in TMUX
  set ttymouse=xterm2
endif

let mapleader = ','
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <leader>l :Align
nmap <leader>a :Ack 
nmap <leader>b :CtrlPBuffer<CR>
nmap <leader>d :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>
nmap <leader>t :CtrlP<CR>
nmap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>
nmap <leader>] :TagbarToggle<CR>
nmap <leader><space> :call whitespace#strip_trailing()<CR>
nmap <leader>g :GitGutterToggle<CR>
nmap <leader>c <Plug>Kwbd
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" plugin settings
let g:ctrlp_match_window = 'order:ttb,max:20'
let g:NERDSpaceDelims=1
let g:gitgutter_enabled = 0

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  let g:ackprg = 'ag --nogroup --column'

  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" fdoc is yaml
autocmd BufRead,BufNewFile *.fdoc set filetype=yaml
" md is markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown
" extra rails.vim help
autocmd User Rails silent! Rnavcommand decorator      app/decorators            -glob=**/* -suffix=_decorator.rb
autocmd User Rails silent! Rnavcommand observer       app/observers             -glob=**/* -suffix=_observer.rb
autocmd User Rails silent! Rnavcommand feature        features                  -glob=**/* -suffix=.feature
autocmd User Rails silent! Rnavcommand job            app/jobs                  -glob=**/* -suffix=_job.rb
autocmd User Rails silent! Rnavcommand mediator       app/mediators             -glob=**/* -suffix=_mediator.rb
autocmd User Rails silent! Rnavcommand stepdefinition features/step_definitions -glob=**/* -suffix=_steps.rb
" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" Fix Cursor in TMUX
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Go crazy!
if filereadable(expand("~/.vimrc.local"))
  " In your .vimrc.local, you might like:
  "
  " set autowrite
  " set nocursorline
  " set nowritebackup
  " set whichwrap+=<,>,h,l,[,] " Wrap arrow keys between lines
  "
  " autocmd! bufwritepost .vimrc source ~/.vimrc
  " noremap! jj <ESC>
  source ~/.vimrc.local
endif

" Continue on line 85 in the rest of Dunn's config https://github.com/Attamusc/dotfiles/blob/master/vim/vimrc.symlink#L87

