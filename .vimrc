filetype plugin indent on
syntax on

set noswapfile
set tabstop=4
set softtabstop=4
set shiftwidth=4
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
   autocmd BufWinLeave * mkview
   autocmd BufWinEnter * silent! loadview
augroup END

set number relativenumber
set ttimeoutlen=100
set cursorline
set cursorcolumn
set linebreak
set foldcolumn=1

inoremap {<CR> {<CR>}<Esc>O
set pastetoggle=<F2>
nnoremap <leader>1 :0r ~/.vim/snippets/temp1.cpp<CR>
nnoremap <leader>2 :0r ~/.vim/snippets/temp2.cpp<CR>

" :r removes file extensions '.cpp'
" '!' executes externally (outside of vim)
" '%' token for current file name
" hotkey for save, clear terminal, compile and run
map <F5> <Esc>:w<CR>:!clear<CR>:!g++ -O2 -DLOCAL -Wall -Wno-sign-compare -Wno-unused-result -std=c++11 -static % -o %:r<CR>:!./%:r<CR>
" hotkey for save and compile (CodeForces)
map <F6> <Esc>:w<CR>:!g++ -O2 -DLOCAL -Wall -Wno-sign-compare -Wno-unused-result -std=c++11 -static % -o %:r<CR>:wq<CR>

" hotkey for save, compile, and run Python3 .py
map <F7> <Esc>:w<CR>:!clear<CR>:!pypy ./%<CR>


" vim-plug
call plug#begin('~/.vim/plugged')

Plug 'lervag/vimtex'
let g:tex_flavor='latex'

" Default PDF viewer
"let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_open_on_warning = 1
set conceallevel=1
let g:tex_conceal='abdmg'

" UltiSnips
Plug 'sirver/ultisnips'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

" Initialize plugin system
call plug#end()
