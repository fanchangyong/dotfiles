# vim: set ft=sh:

export PROMPT_DIRTRIM=3

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

alias l=ls
alias ls="ls ${ls_color}"
alias ll="ls -l ${ls_color}"
alias s="ssh"
alias vi=nvim
alias vim=nvim
alias tma="tmux attach"
alias tm=tmux
alias eb="vim ~/.bash_profile" # Edit bash profile
alias eg="vim $DOTFILE_DIR/gitconf.sh" # Edit git config file
alias df="df -h"
alias g=git
alias c=clear
alias q=exit
alias e=exit
alias tcpdump='sudo tcpdump'
alias pm='sudo pacman'
alias pn='pnpm'
alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"
alias .....="cd ../../../../"
alias cdtmp='cd `mktemp -d /tmp/fancy-XXXXXX`'
alias dot="cd $DOTFILE_DIR"

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

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'
}

if [[ $(id -u) == "0" ]]
then
	PS1="$On_Red\u$IGreen@$Cyan\h $Yellow\w $Green\$(parse_git_branch)$Purple#"
else
	PS1="$Green\u$IGreen@$Cyan\h $Yellow\w $Green\$(parse_git_branch)$Purple>"
fi
PS1+=$Color_Off #end setting color

export GOPATH=~/go
export PATH+=":$GOPATH/bin"
export PATH+=":$HOME/bin"

export PS1
export DOTFILE_DIR
# 在history中忽略重复的命令
export HISTCONTROL=ignoredups
export HISTSIZE=100000
export HISTTIMEFORMAT='%F %T  '
export EDITOR=vim
shopt -s histappend

export GOROOT=/usr/lib/go


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

# load nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

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

export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles
export LSCOLORS=Exfxcxdxbxegedabagacad

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi
__git_complete g __git_main
# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Added by Windsurf
export PATH="/Users/changyong/.codeium/windsurf/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
