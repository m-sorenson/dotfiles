set nocompatible
filetype off
let mapleader=" "

set rtp+=~/.vim/vundle.git/
call vundle#begin()

" Vundles:
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'bling/vim-airline'
Plugin 'Shougo/vimproc.vim'
Plugin 'eagletmt/ghcmod-vim'
Plugin 'dag/vim2hs'
Plugin 'lilydjwg/colorizer'
Plugin 'Valloric/YouCompleteMe'
Plugin 'marijnh/tern_for_vim'
Plugin 'Blackrush/vim-gocode'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'pangloss/vim-javascript'
Plugin 'yonchu/accelerated-smooth-scroll'
Plugin 'wincent/Command-T'
Plugin 'flazz/vim-colorschemes'

" Erlang plugins
Plugin 'jimenezrick/vimerl'

call vundle#end()
filetype plugin indent on
filetype plugin on

" Rainbows
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Airline
set laststatus=2
let g:airline_theme="badwolf"

" Nerdtree
map <C-n> :NERDTreeToggle<CR>
map <Leader>f :NERDTreeToggle<CR>

"YCM
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
let g:ycm_path_to_python_interpreter= '/usr/bin/python2'
set completeopt-=preview

syntax enable
syntax on
let g:syntastic_mode_map = {'mode': 'passive', 'active_filetypes': [], 'passive_filetype': ['asm']}

"" Easy Motion config
nmap s <Plug>(easymotion-s2)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion

"" Command T
map <Leader>f :CommandT<CR>
map <Leader>b :CommandTBuffer<CR>

"" Window management remapping
" opening closing windows
map <Leader>w- <C-w>s
map <Leader>w/ <C-w>v
map <Leader>wc <C-w>q
map <Leader>wo <C-w>m
map <Leader>wT <C-w>t
" move between windows
map <Leader>ww <C-w>w
map <Leader>wh <C-w><left>
map <Leader>wj <C-w><down>
map <Leader>wk <C-w><up>
map <Leader>wl <C-w><right>
map <Leader>wn <C-w>n
" move windows
map <Leader>wH <C-w>H
map <Leader>wJ <C-w>J
map <Leader>wK <C-w>K
map <Leader>wL <C-w>L

if has('gui_running')
	" GVIM
	set guioptions-=L
	set guioptions-=r
	set guioptions-=T
	set guioptions-=m
	set guifont=hermit\ 10
	color chance-of-storm
else
	color neverness
endif

set number
set cursorline
set shiftwidth=4
set tabstop=4
set shell=/bin/sh
