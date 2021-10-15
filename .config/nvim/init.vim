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
Plug 'rbgrouleff/bclose.vim'
Plug 'b4b4r07/vim-buftabs'
Plug 'ap/vim-css-color'
Plug 'flazz/vim-colorschemes'
Plug 'unblevable/quick-scope'
Plug 'kana/vim-textobj-user'
Plug 'glts/vim-textobj-comment'
Plug 'airblade/vim-rooter'
Plug 'editorconfig/editorconfig-vim'

Plug 'ThePrimeagen/vim-be-good'
Plug 'machakann/vim-highlightedyank'
Plug 'bronson/vim-trailing-whitespace'

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'


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
set background=dark

let mapleader = " "

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


