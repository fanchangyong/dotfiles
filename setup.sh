PWD=`pwd`
echo $PWD
ln -f -s "$PWD/bash_profile" ~/.bash_profile
ln -f -s "$PWD/vimrc" ~/.vimrc
ln -f -s "$PWD/tmux.conf" ~/.tmux.conf
ln -f -s "$PWD/lldbinit" ~/.lldbinit
ln -f -s "$PWD/psqlrc" ~/.psqlrc

# setup vundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

os=`uname -s`
if [[ $os = 'Linux' ]]
then
	#ln -s "$PWD/bashrc" ~/.bashrc
	echo ""
fi

