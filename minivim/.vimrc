filetype plugin on
syntax on
set dir=/tmp
set ignorecase
set smartcase
set noerrorbells
set expandtab
set smarttab
set autoread
set incsearch
set nu
set ruler
set shiftround
set history=1000
set wildcharm=<Tab>
set wildmenu
set wildmode=full
set foldmethod=manual
set foldcolumn=2
set laststatus=2
set path=.,**
set grepprg=grep\ -rnH
let mapleader = ","
let g:mapleader = ","
colorscheme morning

nnoremap <leader>ss :setlocal spell!<cr>
nnoremap <space> i <Esc>
nnoremap <CR> o<Esc>k
nnoremap < <<
nnoremap > >>
nnoremap  ;  :
nnoremap  :  ;
inoremap jk <Esc>
nnoremap ! :!
vnoremap < <gv
vnoremap > >gv

" tabs
nnoremap <leader>T :tabprev<CR>
nnoremap <leader>t :tabnext<CR>
nnoremap <leader>nt :tabnew<CR>
nnoremap <leader>ct :tabclose<CR>

" buffer
nnoremap <leader>B :bprev<CR>
nnoremap <leader>b :bnext<CR>

" moving in splits
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
map <C-H> <C-W>h

" File type stuff
augroup filetype_md
    autocmd!
    autocmd BufNewFile,BufReadPost *.md set filetype=markdown
augroup END
augroup filetype_pde
    autocmd!
    autocmd BufNewFile,BufReadPost *.pde set filetype=processing
augroup END
