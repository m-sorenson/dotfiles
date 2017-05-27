" Plugins
" -------
call plug#begin('~/.config/nvim/plugged')

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'djoshea/vim-autoread'

Plug 'eugen0329/vim-esearch'
Plug 'c0r73x/neotags.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'rbgrouleff/bclose.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'cohama/lexima.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'sheerun/vim-polyglot'
Plug 'honza/vim-snippets'

Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'vim-erlang/vim-erlang-omnicomplete', { 'for': 'erlang' }
Plug 'vim-erlang/vim-erlang-skeletons', { 'for': 'erlang' }

Plug 'xolox/vim-lua-ftplugin'
Plug 'xolox/vim-misc'

Plug 'easymotion/vim-easymotion'

Plug 'bling/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'nathanaelkane/vim-indent-guides'

Plug 'joshdick/onedark.vim'

Plug 'wakatime/vim-wakatime'

call plug#end()

" Colors
" ------
set termguicolors
let g:_termcolors=256
syntax on
let g:onedark_termcolors=256
colorscheme onedark
let g:airline_theme='onedark'

" Key mappings
" ------------
let mapleader = " "
imap jk <Esc>

nmap <Leader>ft :NERDTreeToggle<CR>

nmap <Leader>ff :FZF<CR>
call esearch#map('<space>/', 'esearch-word-under-cursor')

map <Leader>jw <Plug>(easymotion-overwin-w)
map <Leader>jl <Plug>(easymotion-overwin-line)

map <Leader>pf :FZF<CR>
map <Leader>pl :CtrlSpace b<CR>
map <Leader>pb :CtrlSpace h<CR>
map <Leader>l :CtrlSpace l<CR>

map <Leader>ar :Ranger<CR>
map <Leader>as :term<CR>

map <Leader>tn :set nu!<CR>

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

let mapleader = ","

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

let g:deoplete#omni#input_patterns.erlang = [
      \ '[^. *\t]:\w*',
      \ '^\s*-\w*'
      \ ]

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

augroup omnifuncs
  autocmd!
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
augroup end

autocmd FileType erlang setlocal omnifunc=erlang_complete#Complete

if exists('g:plugs["tern_for_vim"]')
  let g:tern_request_timeout = 1
  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 1

  autocmd FileType javascript setlocal omnifunc=tern#Complete
endif

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deocomplete#start_manual_complete()
function! s:check_back_space() "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

" Control Space
" -------------
set nocompatible
set hidden

let g:CtrlSpaceFileEngine = "auto"
let g:airline#extensions#ctrlspace#enabled = 1

" Z
" -
command! -nargs=* Z :call Z(<f-args>)
function! Z(...)
  if a:0 == 0
    let list = split(system('fasd -dlR'), '\n')
    let path = tlib#input#List('s', 'Select one', list)
  else
    let cmd = 'fasd -d -e printf'
    for arg in a:000
      let cmd = cmd . ' ' . arg
    endfor
    let path = system(cmd)
  endif
  if isdirectory(path)
    echo path
    exec 'cd ' . path
  endif
endfunction

" Ranger
" ------
let g:ranger_map_keys = 0

" esearch
" -------
let g:esearch = {
  \ 'adapter':    'git',
  \ 'backend':    'nvim',
  \ 'out':        'win',
  \ 'batch_size': 1000,
  \ 'use':        ['visual', 'hlsearch', 'last'],
  \}

" NeoTags
" -------
let g:neotags_appendpath = 0
let g:neotags_recursive = 0
let g:neotags_ctags_bin = 'rg --files '. getcwd() .' | ctags'
let g:neotags_ctags_args = [
            \ '-L -',
            \ '--fields=+l',
            \ '--c-kinds=+p',
            \ '--c++-kinds=+p',
            \ '--sort=no',
            \ '--extra=+q'
            \ ]

" Lua
" ---
let g:lua_compiler_name = '/usr/bin/luac'

" WakaTime
" --------
let g:wakatime_PythonBinary = '/usr/bin/python'
