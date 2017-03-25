" Vim Specific {{{
if !has('nvim')
  " ===== Neovim provides defaults for these =====
  set backspace=2        "indent,eol,start
  set wildmenu
  if &term =~ '^screen'
      " tmux knows the extended mouse mode
      set ttymouse=xterm2
  endif
  " mouse=a will prevent you from copying using the mouse in iterm
  " You can still copy if you hold option while selecting
  set mouse=a
  set laststatus=2
  set incsearch
  set autoread
  set autoindent
  set nocompatible  " be iMproved
endif
" }}}
" Plugin Bundles {{{
call plug#begin()
Plug 'bling/vim-airline' " Pretty, informative status bar at the bottom of vim
Plug 'mileszs/ack.vim' " Search directory with Ack or Ag from vim
Plug 'ctrlpvim/ctrlp.vim' " Very fast file switching
Plug 'myusuf3/numbers.vim' " Relative numbering for line numbers
Plug 'fatih/vim-go' " Edit golang the right way in vim
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } " Tree file explorer in a sidebar
Plug 'rizzatti/dash.vim' " Integration for https://kapeli.com/dash
Plug 'nvie/vim-flake8' " Because we should all try and folllow PEP8 sort of
Plug 'majutsushi/tagbar' " Exhuberant C tags in a sidebar
Plug 'jtratner/vim-flavored-markdown' " Support for Github flavored markdown highlighting
Plug 'pearofducks/ansible-vim' " Better highlighting of ansible yaml
Plug 'JamshedVesuna/vim-markdown-preview' " Quick previewing of markdown files in browser
Plug 'fmoralesc/vim-pad' " Quick place to take notes
Plug 'mhinz/vim-startify' " Shiny start page for vim
Plug 'neomake/neomake' " linting and asynchronus job execution
Plug 'smerrill/vcl-vim-plugin' " vcl file highlighting
Plug 'elzr/vim-json' " Way better json highlighting end editing
Plug 'Shougo/neosnippet' " Snippets manager
Plug 'Shougo/neosnippet-snippets' " Additional snippets to get started
Plug 'junegunn/goyo.vim' " Writeroom style distraction free writing
Plug 'junegunn/limelight.vim' " Writeroom style distraction free writing
Plug 'ngmy/vim-rubocop' " Rubocop Syntax Highlighting in vim
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Autocomplete
Plug 'zchee/deoplete-jedi'
Plug 'christoomey/vim-tmux-navigator' " Easy pane switching in tmux
Plug 'morhetz/gruvbox' " Great colorscheme https://github.com/morhetz/gruvbox
Plug 'Shougo/unite.vim' "Unite and create user interfaces
" tpope f'yea
Plug 'tpope/vim-commentary' " Quick commenting in most languages
Plug 'tpope/vim-endwise' " Smarter closing of functions, if statements in ruby, vimscript and a few othersj
Plug 'tpope/vim-fugitive' " vim managing git like a boss
Plug 'tpope/vim-surround' " Shortcuts for surrounding text with quotes, brackets etc
Plug 'tpope/vim-repeat' " Add support for repeating plugin maps
call plug#end()
"}}}
" Backups {{{
set directory-=.
set noswapfile
set undofile
set undodir=~/tmp/vim/undo
set backupcopy=yes
set nobackup
" }}}
" Colors {{{
set termguicolors "Use 24-bit color
colorscheme gruvbox
set background=dark
" }}}
" {{{ Misc
set clipboard=unnamed
set inccommand=split "Shows the effects of a command incrementally, as you type.
" }}}
" UI Layout {{{
set cursorline
set number              " show line numbers
set showcmd             " show command in bottom bar
set switchbuf=useopen   " Jump to the first open window that contains the specified buffer
set cmdheight=2         " height of the command bar
set hidden
set formatoptions=qrn1  " Defines how automatic formatting is done
set ruler               " Show cursor line, column position at bottom
set showmatch           " highlight matching parenthesis
set scrolloff=3         " Lines around cursor to keep visible
set list                " Display whitespace
set nocursorline " don't highlight current line
" set listchars=tab:▸\ ,trail:▫
" set synmaxcol=400     " Set the max column width to continue highlighting
set splitright          " Always split windows to the right
set visualbell
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmode=longest,list,full

" Fix Cursor in TMUX
" Neovim has a better way to do this, might not be backwards compatible
" https://github.com/neovim/neovim/wiki/FAQ#cursor-shape-doesnt-change-in-tmux
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
" }}}
" Searching {{{
set ignorecase " ignore case when searching
set incsearch  " search as characters entered
set hlsearch   " highlight all matches
set smartcase  " Override 'ignorecase' when uppercase characters are used
" }}}
" Nvim Python {{{
let g:python_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'
" }}}
" NERDTree {{{
let g:NERDSpaceDelims=1
" }}}
" CtrlP {{{
let g:ctrlp_match_window = 'order:ttb,max:20'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""' " Use ag in CtrlP for listing files.
endif

" }}}
" GitGutter {{{
let g:gitgutter_enabled = 0
" }}}
" VimRubocop {{{
let g:vimrubocop_rubocop_cmd = 'bundle exec rubocop '
" }}}
" Deoplete {{{
let g:airline#extensions#tabline#enabled = 1
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
"
" SuperTab like snippets' behavior.
imap <expr><TAB>
 \ pumvisible() ? "\<C-n>" :
 \ neosnippet#expandable_or_jumpable() ?
 \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
 \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
" }}}
" Flake8 {{{
let g:flake8_show_in_gutter=1  " show
let g:flake8_show_quickfix=0  " don't show
"}}}
" Neomake {{{
autocmd! BufWritePost * Neomake
"}}}
" Vim-Pad {{{
let g:pad#dir="/Users/mtoledo/Dropbox/Notes/vim-pad"
let g:pad#window_height=20
let g:pad#search_backend="ag"
"}}}
" Goyo/Limelight {{{
" Limelight and Goyo inteagration
autocmd User GoyoEnter Limelight
autocmd User GoyoLeave Limelight!
" }}}
" {{{ Ack.Vim
" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  let g:ackprg = 'ag --nogroup --column'
  set grepprg=ag\ --nogroup\ --nocolor " Use Ag over Grep
endif
" }}}
" Leader Shortcuts {{{
let mapleader = ','
noremap <leader>l :Align
nnoremap <leader>a :Ack
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>
nnoremap <leader>t :CtrlP<CR>
nnoremap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>
nnoremap <leader>] :TagbarToggle<CR>
nnoremap <leader><space> :call whitespace#strip_trailing()<CR>
nnoremap <leader>g :GitGutterToggle<CR>
nnoremap <leader>c <Plug>Kwbd
nnoremap <silent> <leader>z :Goyo<cr>
noremap <silent> <leader>V :source ~/.nvimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
inoremap jj <ESC>
" }}}
" {{{ AutoGroups
augroup configgroup
  au!
  autocmd BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown spell textwidth=85 wrapmargin=2 " vim-flavored-markdown config
  autocmd BufRead,BufNewFile *.fdoc set filetype=yaml " fdoc is yaml
  autocmd BufRead,BufNewFile *.template set filetype=json " cloudformation template as json
  autocmd VimResized * :wincmd = " automatically rebalance windows on vim resize
  autocmd BufRead,BufNewFile */behanceops/ansible/*.yaml,*/behanceops/ansible/*.yml set syntax=ansible
augroup END
" }}}
" Spaces & Tabs {{{
set smartindent
set modelines=1
set shiftwidth=2
set expandtab
set softtabstop=2
set tabstop=4
"  }}}
" Folding {{{
set foldmethod=indent   " fold based on indent level
set foldnestmax=10      " max 10 depth
set foldenable          " don't fold files by default on open
set foldlevelstart=10   " Start with fold level of 10
" }}}
" Deoplete {{{
" }}}
" vim:foldmethod=marker:foldlevel=0
