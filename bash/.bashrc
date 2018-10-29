if [[ -d  $HOME/projects/go ]];then
  export GOPATH=$HOME/projects/go
elif [[ -d $HOME/Projects/go ]];then
  export GOPATH=$HOME/Projects/go
elif [[ -d $HOME/Projects/GO ]];then
  export GOPATH=$HOME/Projects/GO
fi
if [[ -d $HOME/bin ]];then
  PATH=/bin:$PATH
fi
if [[ -d $GOPATH/bin ]];then
  PATH=$GOPATH/bin:$PATH
fi
if [[ -d /usr/local/go/bin ]];then
  PATH=$PATH:/usr/local/go/bin
fi

BASHRC=$HOME/.bashrc
PATH=/usr/sbin:$PATH

export NOTE_DIR=$HOME/Documents/notes
export EDITOR=vim

set -o vi

alias ll='ls -alF'
alias la='ls -A'
alias sl='ls'
alias serve='python -m SimpleHTTPServer'
alias cdnote='cd $NOTE_DIR'

function parse_git_branch {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
    if [ ! "${STAT}" == "" ]
    then
      printf '[\e[33m%s\e[m]' "${BRANCH}${STAT}"
    else
      printf '[\e[32m%s\e[m]' "${BRANCH}"
    fi
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

export PS1='\[\e[36m\]\w\[\e[m\] `parse_git_branch` \n\[\e[2m\]\D{%F %T}\[\e[m\] \$ '
