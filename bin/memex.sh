#!/bin/bash

# The ID is intended as a unique identifier for each entry
generateID(){
  date "+%Y%m%d%H%M%S"
}

# The file name will be the ID plus an text passed in as arguments
generateFilename(){
  local t=$(echo "$@" | tr " " "-")
  local id=$(generateID)
  echo "$id-$t"
}

# Given a file return the ID
getID(){
  local f="$1"
  echo $f | sed -n -E "s/([0-9]+)-.*/\1/p"
}

# Given a file return a list of tags
findTags(){
  local f="$1"
  sed -n -E 's/(#[a-zA-Z][a-zA-Z-]+)/\1/p' $f | tr " " "\n" | sort
}

# Create a hidden file (.<ID>.tag). Each line of the tag file will contain tag and ID
buildTagFile(){
  local f="$1"
  local id="$(getID $f)"
  local nf=".$id.tag"
  findTags $f | sed -E "s/$/ $id/" > $nf
}
