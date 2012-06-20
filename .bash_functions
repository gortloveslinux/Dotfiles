#! /bin/bash
funcdir=.bash_functions.d
curdir=$(pwd)
sourcedir=$(readlink "${curdir}/${funcdir}")
if [ -d "$sourcedir" ]; then
  for i in $(find $sourcedir -type f); do
    . $i
  done
fi

