"NeoBundle Scripts-----------------------------
if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'


" Core plugins
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/context_filetype.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'wincent/Command-T'
NeoBundle 'bling/vim-airline'
NeoBundle 'jeffkreeftmeijer/vim-numbertoggle'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'Lokaltog/vim-easymotion'

" mostly from Shougo
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outline'

NeoBundle 'Shougo/vimshell'
" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }
NeoBundle 'ujihisa/unite-colorscheme'


" Colors
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'lilydjwg/colorizer'
NeoBundle 'kien/rainbow_parentheses.vim'
NeoBundle 'jdkanani/vim-material-theme'

" Other
NeoBundle 'ekalinin/Dockerfile.vim'
NeoBundle 'chase/vim-ansible-yaml'
NeoBundle 'elzr/vim-json'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'jimenezrick/vimerl'
NeoBundle 'elixir-lang/vim-elixir'
NeoBundle 'yonchu/accelerated-smooth-scroll'
NeoBundle 'vim-erlang/vim-erlang-omnicomplete'
NeoBundle 'godlygeek/tabular'
NeoBundle 'editorconfig/editorconfig-vim'


" Required:
call neobundle#end()

" Required:
filetype plugin indent on
filetype plugin on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------
