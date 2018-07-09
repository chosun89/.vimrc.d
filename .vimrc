set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent

set foldmethod=syntax
set foldlevelstart=99

set number relativenumber
set ttimeoutlen=100
set nowrap
set cursorline
set cursorcolumn

inoremap {<CR> {<CR>}<Esc>O
set pastetoggle=<F2>
nnoremap <leader>1 :0r ~/.vim/snippets/temp1.cpp<CR>
map <F5> :<C-U>!g++ -O2 -DLOCAL -Wall -Wno-sign-compare -Wno-unused-result -std=c++11 -static %:r.cpp -o %:r<CR>
map <F9> :<C-U>!./%:r<CR>
