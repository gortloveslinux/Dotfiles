#!/bin/bash

# this scripts location
DIR=$(dirname $(readlink -f "${BASH_SOURCE[0]}"))

# source the to function
. $DIR/to/to.sh

function tail-rainbow {
  i=$(( 1 ))
  tail -f ${@} | while read line; do
    trap 'tput sgr0 && exit 1' INT
    echo -e $line | grep -q "^==>.*<==$"
    if [ $? -eq 0 ]; then
      tput setaf $(( $i % 7 + 1))
      i=$(( $i + 1 ))
    fi
    echo -e $line
  done
}
