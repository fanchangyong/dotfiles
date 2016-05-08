PWD=`pwd`

os=`uname -s`

ln -f -s "$PWD/bash_profile" ~/.bash_profile
if [[ $os = "Darwin" ]]
then
	ln -f -s "$PWD/bash_profile_local_osx.conf" ~/.bash_profile_local.conf
elif [[ $os = "Linux" ]]
then
	ln -f -s "$PWD/bash_profile_local_linux.conf" ~/.bash_profile_local.conf
fi

ln -f -s "$PWD/vimrc" ~/.vimrc
ln -f -s "$PWD/tmux.conf" ~/.tmux.conf
ln -f -s "$PWD/lldbinit" ~/.lldbinit
ln -f -s "$PWD/psqlrc" ~/.psqlrc
ln -f -s "$PWD/inputrc" ~/.inputrc
ln -f -s "$PWD/slate" ~/.slate
ln -f -s "$PWD/pentadactylrc" ~/.pentadactylrc
ln -f -s "$PWD/agignore" ~/.agignore
ln -f -s "$PWD/my.cnf" ~/.my.cnf
ln -f -s "$PWD/grcat" ~/.grcat
ln -f -s "$PWD/toprc" ~/.toprc

# for sshrc


# vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install tools
. install_tools.sh

# git conf
. gitconf.sh
