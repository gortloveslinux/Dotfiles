function workspace
  if test (count $argv) -gt 0
    cd $GOPATH/src/$argv
  else
    cd $GOPATH
  end
end
