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

let g:solarized_termcolors=256

"See http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim for colors
let g:limelight_conceal_ctermfg = 237
let g:limelight_conceal_guifg = '#777777'

let g:pencil#wrapModeDefault = 'soft'

"==
" Settings
"==
syntax on
filetype plugin on
set background=dark
set dir=/tmp
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
set t_Co=256
set guioptions-=m
set guioptions-=T
set guioptions-=r
set gfn=MonoSpace\ 8
set wildchar=<Tab> wildmenu wildmode=full
set foldmethod=manual
set foldcolumn=2
set laststatus=2
let mapleader = ","
let g:mapleader = ","
call matchadd('ErrorMsg', '\%81v', 100) "Highlight Lines over 80 characters long
colorscheme solarized

"==
" Keys Maps
"==
nnoremap <leader>nt :call OpenOrFocusNERDTree()<CR>
nnoremap <leader>ct :NERDTreeClose<CR>
nnoremap <leader>ss :setlocal spell!<cr>
nnoremap <leader>tb :TagbarOpen j<CR>
nnoremap <leader>hl :noh<CR>
nnoremap <space> i <Esc>
nnoremap <leader><CR> O<Esc>j
nnoremap <CR> o<Esc>k
nnoremap < <<
nnoremap > >>
nnoremap  ;  :
nnoremap  :  ;
nnoremap <silent> n  n:call HLNext(0.2)<CR>
nnoremap <silent> N  N:call HLNext(0.2)<CR>
nnoremap <silent> *  *:call HLNext(0.2)<CR>
nnoremap <silent> #  #:call HLNext(0.2)<CR>
nnoremap tl :tabnext<CR>
nnoremap th :tabprev<CR>
nnoremap tn :tabnew<CR>
nnoremap tc :tabclose<CR>
nnoremap fh :bprev<CR>
nnoremap fl :bnext<CR>
nnoremap fd :Sbd<CR>
nnoremap ! :!
nnoremap gy :Goyo<CR>
nnoremap <silent> <leader>bd :Sbd<CR>
nnoremap <silent> <leader>mbd :Sbdm<CR>
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
map <C-H> <C-W>h
vnoremap < <gv
vnoremap > >gv
inoremap jk <Esc>

"==
" Functions
"==
"Blink Highlight match
function! HLNext(blinktime)
    set invcursorline
    redraw
    exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
    set invcursorline
    redraw
endfunction

"Open Nerdtree, or focus if already open
function! OpenOrFocusNERDTree()
  if exists('t:NERDTreeBufName')
    NERDTreeFocus
  else
    NERDTreeToggle
  endif
endfunction

"Prose mode
function! s:goyo_enter()
  if has('gui_running')
    set fullscreen
  elseif exists('$TMUX')
    silent !tmux set status off
  endif
  Pencil
  Limelight
endfunction
function! s:goyo_leave()
  if has('gui_running')
    set nofullscreen
  elseif exists('$TMUX')
    silent !tmux set status on
  endif
  set background=dark
  colorscheme solarized
  Limelight!
  NoPencil
endfunction
autocmd User GoyoEnter nested call <SID>goyo_enter()
autocmd User GoyoLeave nested call <SID>goyo_leave()

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
