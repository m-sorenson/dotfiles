call plug#begin('~/.config/nvim/plugged')
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'majutsushi/tagbar'
Plug 'djoshea/vim-autoread'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }


Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'cohama/lexima.vim'
Plug 'scrooloose/syntastic'

Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }

Plug 'airblade/vim-gitgutter'

Plug 'joshdick/onedark.vim'
Plug 'bling/vim-airline'
call plug#end()

" Colors
" ------
set termguicolors
let g:onedark_termcolors=256
syntax on
colorscheme onedark
let g:airline_theme='onedark'

" Key mappings
" ------------
let mapleader = " "
imap jk <Esc>

nmap <Leader>ft :NERDTreeToggle<CR>

nmap <Leader>ff :FZF<CR>
nmap <Leader>pf :FZF<CR>

map <Leader>w/ :vs<CR>
map <Leader>w- :split<CR>
map <Leader>ww <C-w>w
map <Leader>wh <C-w><left>
map <Leader>wj <C-w><down>
map <Leader>wk <C-w><up>
map <Leader>wl <C-w><right>
map <Leader>wH <C-w>H
map <Leader>wJ <C-w>J
map <Leader>wK <C-w>K
map <Leader>wL <C-w>L
map <Leader>wd <C-w>q

" deoplete.vim
" ------------
set completeopt-=preview
set omnifunc=syntaxcomplete#Complete
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_completion_start_length = 1
let g:deoplete#enable_smart_case = 1

let g:deoplete#max_list = 20
let g:deoplete#sources = {}

if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

augroup omnifuncs
  autocmd!
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
augroup end

if exists('g:plugs["tern_for_vim"]')
  let g:tern_request_timeout = 1
  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 1

  autocmd FileType javascript setlocal omnifunc=tern#Complete
endif
