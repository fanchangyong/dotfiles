# vim: ft=sh

os=`uname -s`

# Install HomeBrew
if [[ $os = "Darwin" ]]
then
	echo "*** Welcome to Darwin ***"
	if [[ -z `which brew` ]]
	then
		echo "### Installing HomeBrew..."
		`ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"`
	fi

	cmds=(ack tree ctags sl fortune cowsay colordiff tree)
	for cmd in "${cmds[@]}"
	do
		if [[ -z `which $cmd` ]]
		then
			echo "### Installing $cmd"
			brew install $cmd
		fi
	done
fi

if [[ $os = "Linux" ]]
then
	cmds="grc silversearcher-ag git dstat exuberant-ctags tmux nethogs"
	sudo apt-get install $cmds
fi
