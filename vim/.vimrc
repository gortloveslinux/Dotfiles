call plug#begin('~/.config/nvim/plugged')
Plug 'fatih/vim-go'
Plug 'jlanzarotta/bufexplorer'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'bitc/vim-bad-whitespace'
Plug 'tpope/vim-fugitive'
Plug 'crusoexia/vim-monokai'
Plug 'elubow/cql-vim'
call plug#end()


"==
" Plugin Settings
"==
let g:go_fmt_command = "goimports"
let g:syntastic_check_on_open = 1
let g:syntastic_go_checkers = ['go', 'gofmt', 'golint', 'govet']
let g:syntastic_javascript_checkers = ['jsl', 'jshint']

"==
" Settings
"==
set dir=/tmp
set ignorecase
set smartcase
set noerrorbells
set expandtab
set nowrap
set autoread
set showmode
set relativenumber
set nu
set tabstop=2
set sw=2
set history=1000
set wildchar=<Tab> wildmenu wildmode=full
set foldmethod=manual
set foldcolumn=2
let mapleader = ","
let g:mapleader = ","
set laststatus=2
set term=screen-256color
colorscheme monokai


"==
" Keys Maps
"==
nnoremap <leader>nt :call OpenOrFocusNERDTree()<CR>
nnoremap <leader>ct :NERDTreeClose<CR>

nnoremap <leader>ss :setlocal spell!<cr>

nnoremap <space> i <Esc>

nnoremap < <<
nnoremap > >>
vnoremap < <gv
vnoremap > >gv

nnoremap  ;  :
nnoremap  :  ;

nnoremap tl :tabnext<CR>
nnoremap th :tabprev<CR>
nnoremap tn :tabnew<CR>
nnoremap tc :tabclose<CR>

inoremap jk <Esc>

nnoremap fh :bprev<CR>
nnoremap fl :bnext<CR>

map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
map <C-H> <C-W>h

nnoremap <leader>ln :lne<CR>
nnoremap <leader>lp :lp<CR>

"==
" Commands
"==
command! W w !sudo tee % > /dev/null

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
au FileType go nmap <leader>t <Plug>(go-test)

