let mapleader=" "

"" Window management mapping
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

nmap <leader>e :call JSFormat()<cr>

if bufwinnr(1)
    map + <C-W>+
    map - <C-W>-
endif

" enable quick look
let g:vimfiler_quick_look_command = 'qlmanage -p'
"nmap <buffer> p <Plug>(vimfiler_quick_look)

