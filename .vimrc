filetype plugin indent on
syntax on

set noswapfile
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent
set backspace=indent,eol,start
set ignorecase
set encoding=utf-8
set laststatus=2

set foldmethod=manual
set foldlevelstart=99

" remember folds after closing files
augroup remember_folds
   autocmd!
   autocmd BufWinLeave *.* mkview
   autocmd BufWinEnter *.* silent loadview
augroup END

set number relativenumber
set ttimeoutlen=100
set cursorline
hi CursorLine cterm=bold ctermbg=0 ctermfg=NONE
set cursorcolumn
set linebreak
set foldcolumn=1

" allows mouse to scroll through page
set mouse=a

" allows copy and paste
set pastetoggle=<F2>

" curly brace autocomplete
inoremap {<CR> {<CR>}<Esc>O

" template pasting
nnoremap <leader>1 :0r ~/.vim/snippets/temp.cpp<CR>
nnoremap <leader>2 :0r ~/.vim/snippets/temp.tex<CR>

" tab switching maps
map <C-t><k> :tabr<cr>
map <C-t><j> :tabl<cr>
map <C-t><h> :tabp<cr>
map <C-t><l> :tabn<cr>

" :r removes file extensions '.cpp'
" '!' executes externally (outside of vim)
" '%' token for current file name
" hotkey for save, clear terminal, compile and run
map <F5> <Esc>:w<CR>:!clear<CR>:!g++ -O2 -DLOCAL -Wall -Wno-sign-compare -Wno-unused-result -std=c++11 -static % -o %:r<CR>:!./%:r<CR>
" hotkey for save and compile (CodeForces)
map <F6> <Esc>:w<CR>:!g++ -O2 -DLOCAL -Wall -Wno-sign-compare -Wno-unused-result -std=c++11 -static % -o %:r<CR>:wq<CR>

" hotkey for save, compile, and run Python3 .py
map <F7> <Esc>:w<CR>:!clear<CR>:!python3 ./%<CR>

" NERDTree Toggle
nmap <leader>f :NERDTreeToggle %<CR>

" vim-plug
call plug#begin('~/.vim/plugged')
"
Plug 'lervag/vimtex'
let g:tex_flavor='latex'

"" Default PDF viewer
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_open_on_warning = 1
set conceallevel=1
let g:tex_conceal='abdmg'

"" On-demand loading
Plug 'scrooloose/nerdtree'

"" Initialize plugin system
call plug#end()
