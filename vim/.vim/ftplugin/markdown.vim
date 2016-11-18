func Eatchar(pat)
  let c = nr2char(getchar(0))
  return (c =~ a:pat) ? '' : c
endfunc

iabbr -[x - [x]
iabbr -[ - [ ]
iabbr []( [link]()<Left><C-R>=Eatchar('\s')<CR>
iabbr ![]( ![link]()<Left><C-R>=Eatchar('\s')<CR>
