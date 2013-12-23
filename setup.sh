PWD=`pwd`
echo $PWD
ln -f -s "$PWD/bash_profile" ~/.bash_profile
ln -f -s "$PWD/vimrc" ~/.vimrc
ln -f -s "$PWD/tmux.conf" ~/.tmux.conf

os=`uname -s`
if [[ os=="Linux" ]]
then
	cat $PWD/bashrc >> ~/.bashrc
fi

