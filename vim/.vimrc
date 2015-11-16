set nocompatible
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

"==
" Plugin Settings
"==
let g:syntastic_enable_balloons=1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enabled = 1

"==
" Settings
"==
syntax on
filetype plugin on
set dir=/tmp
set ignorecase
set smartcase
set noerrorbells
set expandtab
set nowrap
set autoread
set incsearch
set showmode
set relativenumber
set tabstop=2
set sw=2
set history=1000
set wildchar=<Tab> wildmenu wildmode=full
set foldmethod=manual
set foldcolumn=2
let mapleader = ","
let g:mapleader = ","
colorscheme morning

"==
" Keys Maps
"==
nnoremap <leader>nt :call OpenOrFocusNERDTree()<CR>
nnoremap <leader>ct :NERDTreeClose<CR>
nnoremap <leader>ss :setlocal spell!<cr>
nnoremap <space> i <Esc>
nnoremap <leader><CR> O<Esc>j
nnoremap <CR> o<Esc>k
nnoremap < <<
nnoremap > >>
nnoremap  ;  :
nnoremap  :  ;
nnoremap tl :tabnext<CR>
nnoremap th :tabprev<CR>
nnoremap tn :tabnew<CR>
nnoremap tc :tabclose<CR>
inoremap jk <Esc>
nnoremap fh :bprev<CR>
nnoremap fl :bnext<CR>
nnoremap fd :Sbd<CR>
nnoremap ! :!
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
map <C-H> <C-W>h
vnoremap < <gv
vnoremap > >gv

"==
" Functions
"==
"Open Nerdtree, or focus if already open
function! OpenOrFocusNERDTree()
  if exists('t:NERDTreeBufName')
    NERDTreeFocus
  else
    NERDTreeToggle
  endif
endfunction

"==
"File type stuff
"==
augroup filetype_md
    autocmd!
    autocmd BufNewFile,BufReadPost *.md set filetype=markdown
augroup END

augroup filetype_pde
    autocmd!
    autocmd BufNewFile,BufReadPost *.pde set filetype=processing
augroup END

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
