# vim: ft=sh

os=`uname -s`

# Install HomeBrew
if [[ os="Darwin" ]]
then
	if [[ -z `which brew` ]]
	then
		echo "### Installing HomeBrew..."
		`ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"`
	fi
fi
