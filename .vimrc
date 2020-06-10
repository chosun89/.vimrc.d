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
set foldcolumn=1

" remember folds after closing files
autocmd BufWinLeave *.* mkview!
autocmd BufWinEnter *.* silent loadview

autocmd BufWinEnter *.cpp set textwidth=80 fo=tcq
autocmd BufWinEnter *.tex set textwidth=80 fo=tcq

" line numbers
set number relativenumber

" highlights the row
set cursorline 

" configure highlight colors
hi CursorLine cterm=bold ctermbg=0 ctermfg=NONE

" highlights the column
set cursorcolumn 
set linebreak

" allows mouse usage in vim
set mouse=a

" allows copy and paste
set pastetoggle=<F2>

" keystroke sequence delay for maps
set ttimeoutlen=100 

" swap 0 and ^ (0 = move to column 0, ^ = move to first char of line)
nnoremap 0 ^
nnoremap ^ 0

" tab switching maps
nnoremap <C-t>k :tabr<cr>
nnoremap <C-t>j :tabl<cr>
nnoremap <C-t>h :tabp<cr>
nnoremap <C-t>l :tabn<cr>

" cylce through buffers
nnoremap <C-l> :bnext<CR>
nnoremap <C-h> :bprevious<CR>

" list buffers and jump to buffer number
nnoremap <C-b> :ls<CR>:b<Space>

" :r removes file extensions '.cpp'
" '!' executes externally (outside of vim)
" '%' token for current file name
" hotkey for save, clear terminal, compile and run
map <F5> <Esc>:w<CR>:!clear<CR>:!g++ -O2 -DLOCAL -Wall -Wno-sign-compare -Wno-unused-result -std=c++11 -static % -o %:r<CR>:!./%:r<CR>

" NERDTree Toggle
nmap <leader>f :NERDTreeToggle %<CR>

" vim-plug install command via curl:
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

call plug#begin('~/.vim/plugged')

" Vimtex: LaTeX Plugin for Vim
Plug 'lervag/vimtex'
let g:tex_flavor='latex'

" Default PDF viewer
let g:vimtex_view_method='general'
let g:vimtex_quickfix_open_on_warning = 1
set conceallevel=1
let g:tex_conceal='abdmg'

" NerdTree: File Manager Plugin
Plug 'scrooloose/nerdtree'

" YouCompleteMe: Autocomplete Plugin
Plug 'valloric/youcompleteme', { 'do': './install.py' }

" UltiSnips: Snippet Insertion Plugin
Plug 'SirVer/ultisnips'

" Trigger configuration. Do not use <tab> YouCompleteMe.
let g:UltiSnipsExpandTrigger='<c-j>'

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit='vertical'

" disable scratch preview from auto complete
set completeopt-=preview

call plug#end()
