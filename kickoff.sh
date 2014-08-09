
# Check program has been installed
function has(){
	if type $1 1>/dev/null 2>&1; then
		return 0;
	fi
	return 1;
}

# If program has not been installed,then installed it use brew
function brew_install(){
	if ! `has $1`; then
		brew install $1
	fi
}

# Install program using brew cask
function cask_install(){
	if ! `has $1`; then
		brew cask install $1
	fi
}

# Read file and do something against every line
function line_do(){
	filename=$1
	shift 1
	while read prg
	do
		$@ $prg
	done < $filename
}

# Install homebrew
if ! `has brew`; then
	ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
fi

# Install cask
brew install caskroom/cask/brew-cask

# CLI program using brew
line_do brewlist.txt brew install

# Install program using node(npm)
line_do npmlist.txt npm install -g

#Install program using gem
line_do gemlist.txt gem install

# GUI
line_do cask_install casklist.txt

