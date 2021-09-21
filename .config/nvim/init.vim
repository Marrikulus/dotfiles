set nocompatible
filetype plugin on
syntax enable
set t_Co=256
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
set autoindent
set complete-=i

set path+=**
set wildmenu
set wildignore+=*.o,*~
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=node_modules/*

let g:BASH_Ctrl_j = 'off'
let g:buftabs_enabled = 0
let VIMRC = '$HOME/.config/nvim/init.vim'


call plug#begin()

Plug 'matze/vim-move'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'iberianpig/tig-explorer.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'b4b4r07/vim-buftabs'
Plug 'ap/vim-css-color'
Plug 'flazz/vim-colorschemes'
Plug 'unblevable/quick-scope'
Plug 'kana/vim-textobj-user'
Plug 'glts/vim-textobj-comment'
Plug 'airblade/vim-rooter'

Plug 'ThePrimeagen/vim-be-good'
Plug 'machakann/vim-highlightedyank'
Plug 'bronson/vim-trailing-whitespace'


Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh \| UpdateRemotePlugins' }

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
"Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope-fzy-native.nvim'

Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'

Plug 'christoomey/vim-tmux-navigator'

Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'elmcast/elm-vim'
Plug 'habamax/vim-godot'
Plug 'rust-lang/rust.vim'
Plug 'jdonaldson/vaxe'
Plug 'zig-lang/zig.vim'
Plug 'hhvm/vim-hack'

call plug#end()

colorscheme imonokai
"colorscheme gruvbox
set background=dark

"ALE configure
"if &rtp =~ 'ale'
"    let g:ale_completion_enabled = 1
"    let g:ale_completion_autoimport = 1
"    let g:ale_completion_delay = 1
"    call ale#linter#Define('gdscript', {
"    \ 'name': 'godot',
"    \ 'lsp': 'socket',
"    \ 'address': '127.0.0.1:6008',
"    \ 'project_root': 'project.godot',
"    \})
"    let g:ale_linters              = {
"    \   'rust': ['cargo'],
"    \   'hack': ['hack', 'hhast'],
"    \}
"endif

"let g:ctrlp_custom_ignore = '\v[\/](node_modules|data|target|dist)|(\.(swp|ico|git|svn))$'
"let g:ctrlp_max_depth=40
"let g:ctrlp_max_files=0
"let g:ctrlp_by_filename=1

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  "let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  "let g:ctrlp_use_caching = 0
endif

let mapleader = " "

" Nops and fixes
nmap <Up>    <Nop>
nmap <Down>  <Nop>
nmap <Left>  <Nop>
nmap <Right> <Nop>
imap <Up>    <Nop>
imap <Down>  <Nop>
imap <Left>  <Nop>
imap <Right> <Nop>
nnoremap q: <Nop>
nnoremap Q <Nop>
com! W w

"Tabs
nnoremap <Tab> >>
nnoremap <S-Tab> <<
vnoremap <Tab> >><Esc>gv
vnoremap <S-Tab> <<<Esc>gv

"clipboard
set pastetoggle=<F10>
vnoremap <C-c> "+y:let @*=@+<CR>
vnoremap <C-x> "+d:let @*=@+<CR>
inoremap <C-v> <F10><C-r>+<F10>
vnoremap . :normal .<CR>

"byobu navigation
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <S-Left> :TmuxNavigateLeft<cr>
nnoremap <silent> <S-Right> :TmuxNavigateRight<cr>
nnoremap <silent> <S-Down> :TmuxNavigateDown<cr>
nnoremap <silent> <S-Up> :TmuxNavigateUp<cr>

"quickfix list
nmap <C-k> :cprev<CR>zz
nmap <C-j> :cnext<CR>zz
nmap <Leader>co :copen<CR>
nmap <Leader>cc :cclose<CR>

nmap <Leader>gs :Git<CR>
nmap <Leader>w :bd<CR>

nmap <Leader><Leader> @:


