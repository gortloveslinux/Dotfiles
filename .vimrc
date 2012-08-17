runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

set nobackup writebackup 
set nocompatible
set tabstop=2
set sw=2
set expandtab
set et
set virtualedit=onemore  "Allow for cursor beyond last character
set nowrap               "Don't Wrap long lines
set history=1000         "Store lots of history
set autoread             "Set to auto read when a file is changed from the outside
set cmdheight=2          
set incsearch            "Make search act like search in modern browsers
set nu
set showcmd
syntax on
filetype plugin on
set gfn=MonoSpace\ 8

set ignorecase 
set smartcase
set noerrorbells
colorscheme smyck

let mapleader = ","
let g:mapleader = ","

"Highlight Lines over 80 characters long
if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

"PhpDocStuff
let g:pdv_cfg_Type = "mixed"
let g:pdv_cfg_Package = ""
let g:pdv_cfg_Version = "$Id$"
let g:pdv_cfg_Author = "Chris Edwards <cme@kount.com>"
let g:pdv_cfg_Copyright = "copyright 2012 Kount Inc."
let g:pdv_cfg_License = ""

"Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

"Swapping Splits - http://od-eon.com/blogs/kaunghtet/vim-working-multiple-split-windows/
function! MarkWindowSwap()
    let g:markedWinNum = winnr()
endfunction

function! DoWindowSwap()
    let curNum = winnr()
    let curBuf = bufnr( "%" )
    exe g:markedWinNum . "wincmd w"
    let markedBuf = bufnr( "%" )    
    exe 'hide buf' curBuf
    exe curNum . "wincmd w"
    exe 'hide buf' markedBuf
endfunction

"NerdTree
function! OpenOrFocusNERDTree ()
  if exists('t:NERDTreeBufName')
    NERDTreeFocus
  else
    NERDTreeToggle
  endif
endfunction

"Buffer Stuffs
set wildchar=<Tab> wildmenu wildmode=full

"CSApprox
set t_Co=256

"Syntastic
let g:syntastic_enable_balloons = 1

"Indent Guides
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2

"Keys Maps
  nmap <leader>vs :vert sb<space>
  map <silent> <F9> :TagbarOpen j<CR>
  map <F3> :buffers<CR>:buffer<Space>
  map <F5> :GundoToggle<CR>
  map <silent> <F2> :call OpenOrFocusNERDTree()<CR>
  nnoremap <space> i <Esc> 
  nmap <S-CR> O<Esc>j
  nmap <CR> o<Esc>k
  nmap <leader>ss :setlocal spell!<cr>
  nmap <silent> <leader>mw :call MarkWindowSwap()<CR>
  nmap <silent> <leader>pw :call DoWindowSwap()<CR>
  nmap <leader>r :s/<C-r><C-w>//g<Left><Left>
  "Easier moving in tabs and windows
  map <C-J> <C-W>j
  map <C-K> <C-W>k
  map <C-L> <C-W>l
  map <C-H> <C-W>h
  "Visual shifting (does not exit Visual mode)
  vnoremap < <gv
  vnoremap > >gv 

