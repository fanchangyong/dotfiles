# vim: set ft=sh:


SCRIPT=${BASH_SOURCE[0]}
if [[ -h $SCRIPT ]]
then
	DOTFILE_DIR=$(dirname $(readlink ${BASH_SOURCE[0]}))
else
	DOTFILE_DIR=$(dirname ${BASH_SOURCE[0]})
fi

source "$DOTFILE_DIR/utils.sh"
source "$DOTFILE_DIR/colors.sh"

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

if `has sshrc`; then
	alias ssh=sshrc
fi

if `has hub`; then
	alias git=hub
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
alias cf=coffee
alias dtrace='sudo dtrace'
alias dtruss='sudo dtruss'

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
	PS1="$On_Red\u$IGreen@$Cyan\H $Purple($os) $Yellow\w $Purple#"
else
	PS1="$Green\u$IGreen@$Cyan\H $Purple($redist) $Yellow\w $Purple>"
fi
PS1+=$Color_Off #end setting color

export GOPATH=~/test/go
PATH="/usr/local/mysql/bin:/usr/local/bin:/usr/bin:/bin:/sbin:/usr/sbin:/usr/local/sbin:$GOPATH/bin"
PATH+=":$HOME/.rvm/bin"

export PS1
export DOTFILE_DIR
# 在history中忽略重复的命令
export HISTCONTROL=ignoredups
export EDITOR=vim

#export GOROOT=/usr/local/go

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

#load nvm
export NVM_DIR=~/.nvm

function loadnvm()
{
	if [ -e $NVM_DIR/nvm.sh ]; then
		source $NVM_DIR/nvm.sh
	elif `has brew` && [ -e $(brew --prefix nvm)/nvm.sh ]; then 
		source $(brew --prefix nvm)/nvm.sh
	fi
}

# Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
export COCOS_CONSOLE_ROOT=/Users/kevin/Downloads/cocos2d-js-v3.0-rc1/tools/cocos2d-console/bin
export PATH=$COCOS_CONSOLE_ROOT:$PATH

# locales
export LC_TIME=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# open files limit
ulimit -n 100000 2> /dev/null
