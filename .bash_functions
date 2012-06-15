#! /bin/bash
funcdir=.bash_functions.d

if [ -d "$funcdir" ]; then
  for i in $(find `pwd`/$funcdir -type f); do
    . $i
  done
fi

