# vim: ft=sh

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
elif [[ $os = "Linux" ]]
then
	ls_color="--color"
fi


alias ls="ls ${ls_color}"
alias grep="grep --color=auto -n"
alias erlm="erl -man"
alias mk=make
alias m=make
alias vi=vim
alias l=ls
alias ll="ls -l ${ls_color}"
alias .="source ~/.bash_profile"
alias .g="source $DOTFILE_DIR/gitconf.sh"
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
alias top='top -o cpu'

alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"
alias .....="cd ../../../../"
alias -- -="cd -"
alias cd..="cd ../"

alias dot="cd $DOTFILE_DIR"


PS1_COLOR="\e[0;35m"
PS1_COLOR_END="\e[m"
PS1=$PS1_COLOR	#setting color
PS1+="[\w ]#"     #setting string
PS1+=$PS1_COLOR_END #end setting color

PATH="/usr/local/bin:$PATH"

export PS1
export PATH
export DOTFILE_DIR
