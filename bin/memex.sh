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

# Find todo in the notes with the format of - [<S>] where <S> is an option status of the todo
findToDos(){
  local f="$1"
  set -f
  local status="${2:-}"
  echo "s/^- (\[$status\] .*$)/\1/p"
  sed -n -E "s/^- (\[$status\] .*$)/\1/p" $f
  set +f
}

buildToDoFile(){
  local f="$1"
  local id="$(getID $f)"
  local nf=".$id.todo"
  set -f
  local status=${2:-'.*'}
  findToDos $f $status | sed -E "s/$/ $id/" > $nf
  set +f
}
