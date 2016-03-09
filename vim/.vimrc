set nocompatible
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

"==
" Plugin Settings
"==
let g:go_fmt_command = "goimports"
let g:syntastic_check_on_open = 1
let g:syntastic_go_checkers = ['go', 'gofmt', 'golint', 'govet']


"==
" Settings
"==
syntax on
filetype plugin on
set dir=/tmp
set ignorecase
set smartcase
set noerrorbells
set vb t_vb=
set expandtab
set nowrap
set autoread
set incsearch
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
colorscheme monokai
set laststatus=2

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
noremap <Leader>w :w<CR>
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
augroup filetype_md
    autocmd!
    autocmd BufNewFile,BufReadPost *.md set filetype=markdown
augroup END

augroup filetype_pde
    autocmd!
    autocmd BufNewFile,BufReadPost *.pde set filetype=processing
augroup END

au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t !clear && go test -cover<CR>
au FileType go nmap <leader>th !clear && pushd $(dirname $(go test -coverprofile=coverage.out &>/dev/null && go tool cover -html=coverage.out 2>&1 \| awk '{print $5}')); echo "Coverage report: `hostname --fqdn`/coverage.html"; sudo python -m SimpleHTTPServer 80 &>/dev/null; popd<CR>
