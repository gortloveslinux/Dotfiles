runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

set nocompatible
set tabstop=2
set sw=2
set et
set virtualedit=onemore  "Allow for cursor beyond last character
set nowrap               "Wrap long lines
set history=1000         "Store lots of history
"set ttyfast              
set autoread             "Set to auto read when a file is changed from the outside
set cmdheight=2          
set incsearch            "Make search act like search in modern browsers
set nu
set cursorline
set showcmd
syntax on
filetype plugin on
set gfn=MonoSpace\ 8
set ignorecase 
set smartcase
set noerrorbells
"set background=light      "For solorize color scheme
colorscheme elflord

"Insert space under the cursor
map <space> i<space><Esc> 

"Insert newline under/above current line
map <S-CR> O<Esc>j
map <CR> o<Esc>k

let mapleader = ","
let g:mapleader = ","

"Highlight Lines over 80 characters long
if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

"Easier moving in tabs and windows
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-L> <C-W>l<C-W>_
map <C-H> <C-W>h<C-W>_
map <C-K> <C-W>k<C-W>_

"Wrapped lines goes down/up to next row, rather than next line in file.
nnoremap j gj
nnoremap k gk

"Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv 

map <leader>ss :setlocal spell!<cr>

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

"NerdTree
function! OpenOrFocusNERDTree ()
  if exists('t:NERDTreeBufName')
    NERDTreeFocus
  else
    NERDTreeToggle
  endif
endfunction
:map <silent> <F2> :call OpenOrFocusNERDTree()<CR>

"Buffer Stuffs
nnoremap <F3> :buffers<CR>:buffer<Space>
set wildchar=<Tab> wildmenu wildmode=full

"Gundo
nnoremap <F5> :GundoToggle<CR>

"Tagbar
nnoremap <silent> <F9> :TagbarToggle<CR>
