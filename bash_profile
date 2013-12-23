alias "ls=ls -G"
alias "grep=grep --color=auto -n"
alias "erlm='erl -man'"
alias "mk=make"
alias "vi=vim"
alias "l=ls"
alias "ll='ls -lG'"
alias ".=. ~/.bash_profile"
alias "tmux=tmux attach"

alias "..='cd ..'"
alias "...='cd ...'"
alias "....='cd ....'"
alias ".....='cd ....."
alias "--='cd -'"


PS1_COLOR="\e[0;35m"
PS1_COLOR_END="\e[m"
PS1=$PS1_COLOR	#setting color
PS1+="[\w ]#"     #setting string
PS1+=$PS1_COLOR_END #end setting color

PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin

export PS1
export PATH
