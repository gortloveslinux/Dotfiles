set nocompatible
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

"==
" Settings
"==
set ignorecase
set smartcase
set noerrorbells
set expandtab
set nowrap
set autoread
set incsearch
set nu
set tabstop=2
set sw=2
set history=1000
set gfn=MonoSpace\ 8
set term=xterm-256color
set guioptions-=m
set guioptions-=T
set guioptions-=r
set wildchar=<Tab> wildmenu wildmode=full
set foldmethod=manual
set foldcolumn=2
set laststatus=2
colorscheme desert
syntax on
filetype plugin on
let mapleader = ","
let g:mapleader = ","
call matchadd('ErrorMsg', '\%81v', 100) "Highlight Lines over 80 characters long


"==
" Plugin Settings
"==
let g:syntastic_enable_balloons=1

"==
" Keys Maps
"==
nnoremap <leader>nt :call OpenOrFocusNERDTree()<CR>
nnoremap <leader>ct :NERDTreeClose<CR>
nnoremap <leader>ss :setlocal spell!<cr>
nnoremap <leader>rl :s/<C-r><C-w>//g<Left><Left>
nnoremap <leader>tb :TagbarOpen j<CR>
nnoremap <leader>hl :noh<CR>
nnoremap <space> i <Esc>
nnoremap <leader><CR> O<Esc>j
nnoremap <CR> o<Esc>k
nnoremap < <<
nnoremap > >>
nnoremap  ;  :
nnoremap  :  ;
nnoremap <silent> n   n:call HLNext(0.4)<CR>
nnoremap <silent> N   N:call HLNext(0.4)<CR>
nnoremap <silent> *   *:call HLNext(0.4)<CR>
nnoremap <silent> #   #:call HLNext(0.4)<CR>
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
map <C-H> <C-W>h
nnoremap th :tabnext<CR>
nnoremap tl :tabprev<CR>
nnoremap tn :tabnew<CR>
vnoremap < <gv
vnoremap > >gv
nnoremap <leader>? :set cursorline!<CR><Bar>:exec 'sleep ' . float2nr(0.2 * 1000) . 'm'<CR><Bar>:set cursorline!<CR>
vnoremap <leader>r :w !
if v:version < 703
  noremap <C-n> :call NumberToggle()<CR>
endif

"==
" Functions
"==
"Blink Highlight match
function! HLNext (blinktime)
    set invcursorline
    redraw
    exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
    set invcursorline
    redraw
endfunction

"Open Nerdtree, or focus if already open
function! OpenOrFocusNERDTree ()
  if exists('t:NERDTreeBufName')
    NERDTreeFocus
  else
    NERDTreeToggle
  endif
endfunction

"Toggle between releative and absolute line numbering
function! NumberToggle ()
  if (&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunction
