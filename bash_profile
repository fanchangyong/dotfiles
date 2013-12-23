# vim: ft=sh
os=`uname -s`

if [[ $os = "Darwin" ]]
then
	ls_color="-G"
elif [[ $os = "Linux" ]]
then
	ls_color="--color"
fi

echo "ls_color:${ls_color}"

alias ls="ls ${ls_color}"
alias grep="grep --color=auto -n"
alias erlm="erl -man"
alias mk=make
alias vi=vim
alias l=ls
alias ll="ls -l ${ls_color}"
alias .=". ~/.bash_profile"
alias tmux="tmux attach"
alias tm=tmux
alias eb="vim ~/.bash_profile" # Edit bash profile

alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"
alias .....="cd ../../../../"
alias -- -="cd -"
alias cd..="cd ../"

alias dot="cd ~/git/dotfiles"


PS1_COLOR="\e[0;35m"
PS1_COLOR_END="\e[m"
PS1=$PS1_COLOR	#setting color
PS1+="[\w ]#"     #setting string
PS1+=$PS1_COLOR_END #end setting color

PATH="/usr/local/bin:$PATH"

export PS1
export PATH
