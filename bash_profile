# vim: set ft=sh:

export PROMPT_DIRTRIM=2

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
	alias ack="ack-grep"
	ls_color="--color"
	top_arg=""
fi

#if `has sshrc`; then
	#alias ssh=sshrc
#fi

if `has hub`; then
	alias git=hub
fi

alias ls="ls ${ls_color}"
alias grep="grep --color=auto -n"
alias egrep="egrep --color=auto -n"
alias erlm="erl -man"
alias mk=make
alias m=make
# alias vi=nvim
# alias vim=nvim
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
alias ng=nginx
alias v=vagrant
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
alias ipy='ipython'

#alias top="top ${top_arg}"
alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"
alias .....="cd ../../../../"
alias -- -="cd -"
alias cd..="cd ../"

alias dot="cd $DOTFILE_DIR"

alias dev="ssh fanchangyong@10.4.17.164"

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

export PROMPT_DIRTRIM=3

if [[ $(id -u) == "0" ]]
then
	PS1="$On_Red\u$IGreen@$Cyan\H $Purple($os) $Yellow\w $Purple#"
else
	PS1="$Green\u$IGreen@$Cyan\H $Purple($redist) $Yellow\w $Purple>"
fi
PS1+=$Color_Off #end setting color

export GOPATH=~/go
export PATH="$PATH:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/sbin:/usr/sbin"
export PATH+=":$GOPATH/bin"

export PS1
export DOTFILE_DIR
# 在history中忽略重复的命令
export HISTCONTROL=ignoredups
export EDITOR=vim

#export GOROOT=/usr/local/go

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

linode_ip="23.239.9.105"
alias linode="ssh root@$linode_ip"

aws_ip="54.65.178.152"
alias aws="ssh ubuntu@$aws_ip"
alias socks="ssh -ND 5555 ubuntu@$aws_ip"

# automatically `ls` after `cd`
cd() { builtin cd "$@" && ls; }

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

# 加了这个，会导致新开一个窗口的时候很慢
# loadnvm

# locales
export LC_TIME=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# open files limit
ulimit -n 100000 2> /dev/null


# pyenv

# mysql prompt
export MYSQL_PS1="\u@\h [\d]> "

if [ -f ~/.bash_profile_local.conf ]; then
  source ~/.bash_profile_local.conf
fi

function swap()
{
  local TMPFILE=tmp.$$
  mv "$1" $TMPFILE
  mv "$2" "$1"
  mv $TMPFILE "$2"
}

# Disable ansible cowsay: https://michaelheap.com/cowsay-and-ansible/
export ANSIBLE_NOCOWS=1
export NODE_TLS_REJECT_UNAUTHORIZED=0;

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
