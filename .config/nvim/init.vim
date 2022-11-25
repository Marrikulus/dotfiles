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
let VIMRC = $HOME . '/.config/nvim/init.vim'

colorscheme imonokai
set background=dark

runtime ./plug.vim
runtime ./sets.vim
runtime ./maps.vim

let g:OmniSharp_server_path = '/home/ingimar/bin/omnisharp/run'
let g:OmniSharp_prefer_global_sln = 1

