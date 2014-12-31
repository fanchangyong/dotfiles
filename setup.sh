PWD=`pwd`
ln -f -s "$PWD/bash_profile" ~/.bash_profile
ln -f -s "$PWD/vimrc" ~/.vimrc
ln -f -s "$PWD/tmux.conf" ~/.tmux.conf
ln -f -s "$PWD/lldbinit" ~/.lldbinit
ln -f -s "$PWD/psqlrc" ~/.psqlrc
ln -f -s "$PWD/inputrc" ~/.inputrc
ln -f -s "$PWD/slate" ~/.slate
ln -f -s "$PWD/pentadactylrc" ~/.pentadactylrc
ln -f -s "$PWD/iterms.plist" ~/Library/Preferences/com.googlecode.iterm2.plist

# for sshrc


# setup vundle
if test -d "~/.vim/bundle/Vundle.vim"; then
	echo "Installing Vundle!"
	git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

