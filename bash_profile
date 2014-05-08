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
alias .="source ~/.bash_profile"
alias .g="source $DOTFILE_DIR/gitconf.sh"
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

PS1_COLOR="\e[0;35m"
PS1_COLOR_END="\e[m"
PS1=$PS1_COLOR	#setting color
if [[ $os = "Darwin" ]]
then
	PS1+="[\t \w]#"
elif [[ $os = "Linux" ]]
then
	PS1+="[\u@\H ($os) \w ]#"
fi
PS1+=$PS1_COLOR_END #end setting color

PATH="/usr/local/mysql/bin:/usr/local/bin:/usr/bin:/bin/:/sbin:/usr/sbin:/usr/local/sbin"

export PS1
export PATH
export DOTFILE_DIR

#export GOROOT=/usr/local/go
#export GOPATH=~/go/

export DYLD_LIBRARY_PATH="/usr/local/mysql/lib"

if [ -e "~/.git-completion.bash" ]; then
	echo "sourcing git completion"
	source "~/.git-completion.bash"
fi

# mini wiki
# inspied by http://www.commandlinefu.com/commands/view/5187/query-wikipedia-via-console-over-dns
mwiki() { dig +short txt "$*".wp.dg.cx; }

# qingyun cloud
qingyun_ip="121.201.8.37"
alias qingyun_root="ssh root@$qingyun_ip"
alias qingyun="ssh ubuntu@$qingyun_ip"
