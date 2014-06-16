# vim: set ft=sh:

SCRIPT=${BASH_SOURCE[0]}
if [[ -h $SCRIPT ]]
then
	DOTFILE_DIR=$(dirname $(readlink ${BASH_SOURCE[0]}))
else
	DOTFILE_DIR=$(dirname ${BASH_SOURCE[0]})
fi

os=`uname -s`

if [[ $os = "Darwin" ]]
then
	ls_color="-G"
	top_arg="-o"
elif [[ $os = "Linux" ]]
then
	ls_color="--color"
	top_arg=""
fi


alias ls="ls ${ls_color}"
alias grep="grep --color=auto -n"
alias egrep="egrep --color=auto -n"
alias erlm="erl -man"
alias mk=make
alias m=make
alias vi=vim
alias l=ls
alias ll="ls -l ${ls_color}"
#alias .="source ~/.bash_profile"
#alias .g="source $DOTFILE_DIR/gitconf.sh"
alias so=source
alias tma="tmux attach"
alias tm=tmux
alias eb="vim ~/.bash_profile" # Edit bash profile
alias eg="vim $DOTFILE_DIR/gitconf.sh" # Edit git config file
alias diff=colordiff
alias df="df -h"
alias g=git
alias c='clear'
alias quit='exit'
alias q='exit'
alias e='exit'
alias 'ccs'='clang -S -mllvm --x86-asm-syntax=intel '
alias tcpdump='sudo tcpdump'
alias tree='tree -C'

#alias top="top ${top_arg}"
alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"
alias .....="cd ../../../../"
alias -- -="cd -"
alias cd..="cd ../"

alias dot="cd $DOTFILE_DIR"

################################################
################## for dev #####################
################################################

alias ubuntu="ssh ubuntu@42.62.77.86"
alias deployer="ssh deployer@42.62.77.86"
alias onekey="cd /Users/kevin/repos/proj_golang/src/zerogame.info/thserver/&& ./one_key_dev.sh&& cd -"
alias down="cd ~/Downloads/"
alias cdg="cd ~/repos/proj_golang"
alias cdgbin="cd ~/repos/proj_golang/bin/"
alias bin="cd ~/repos/proj_golang/bin/"
alias cdgsrc="cd ~/repos/proj_golang/src/zerogame.info/thserver/"
alias src="cd ~/repos/proj_golang/src/zerogame.info/thserver/"
alias cdgpkg="cd ~/repos/proj_golang/pkg/darwin_amd64/"
alias pkg="cd ~/repos/proj_golang/pkg/darwin_amd64/zerogame.info/thserver/"
alias de="cd ~/dev/thserver"
alias dev="cd ~/dev/thserver;vim"

################################################
################## end dev #####################
################################################

source ~/.colors.sh

if [[ $os = "Linux" ]]
then
	if command -v lsb_release > /dev/null 2>&1
	then
		redist=`lsb_release -i|awk '{print $3}'`
	else
		redist=`cat /etc/issue|awk '{print $1]'`
	fi
fi

if [[ -z $redist ]]
then
	redist=$os
fi

if [[ $(id -u) == "0" ]]
then
	PS1="$On_Red\u$IGreen@$Cyan\H $Purple($os) $Yellow\w $Purple$"
else
	PS1="$Green\u$IGreen@$Cyan\H $Purple($redist) $Yellow\w $Purple#"
fi
PS1+=$Color_Off #end setting color

PATH="/usr/local/mysql/bin:/usr/local/bin:/usr/bin:/bin/:/sbin:/usr/sbin:/usr/local/sbin"

export PS1
export PATH
export DOTFILE_DIR
# 在history中忽略重复的命令
export HISTCONTROL=ignoredups
export EDITOR=vim

#export GOROOT=/usr/local/go
#export GOPATH=~/go/

export DYLD_LIBRARY_PATH="/usr/local/mysql/lib"

if [ -e "~/.git-completion.bash" ]; then
	echo "sourcing git completion"
	source "~/.git-completion.bash"
fi

# mini wiki
# inspied by http://www.commandlinefu.com/commands/view/5188/query-wikipedia-via-console-over-dns
mwiki() { dig +short txt "$*".wp.dg.cx; }

# qingyun cloud
qingyun_ip="121.201.8.37"
alias qingyun_root="ssh root@$qingyun_ip"
alias qingyun="ssh ubuntu@$qingyun_ip"
alias staging="ssh ubuntu@e.blingstorm.com.cn -p 5022"

export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# enable vi mode of bash readline
set -o vi
set -o ignoreeof

