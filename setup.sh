PWD=`pwd`

os=`uname -s`

ln -f -s "$PWD/bash_profile" ~/.bash_profile
ln -f -s "$PWD/bashrc" ~/.bashrc
if [[ $os = "Darwin" ]]
then
	ln -f -s "$PWD/bash_profile_local_osx.conf" ~/.bash_profile_local.conf
elif [[ $os = "Linux" ]]
then
	ln -f -s "$PWD/bash_profile_local_linux.conf" ~/.bash_profile_local.conf
fi

ln -f -s "$PWD/vimrc" ~/.vimrc
ln -f -s "$PWD/ideavimrc" ~/.ideavimrc
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
ln -f -s "$PWD/tmuxp" ~/.tmuxp
ln -f -s "$PWD/ssh_config" ~/.ssh/config
ln -f -s "$PWD/git-completion.bash" ~/.git-completion.bash

mkdir -p ~/.config/nvim
ln -f -s "$PWD/init.vim" ~/.config/nvim/init.vim

mkdir -p ~/.config/herdr
ln -f -s "$PWD/herdr/config.toml" ~/.config/herdr/config.toml

# Claude Code — shared settings and status line. Machine-specific overrides stay
# in ~/.claude/settings.local.json, which is deliberately not tracked here.
mkdir -p ~/.claude
ln -f -s "$PWD/claude/settings.json" ~/.claude/settings.json
ln -f -s "$PWD/claude/statusline-context.sh" ~/.claude/statusline-context.sh

if [[ $os = "Darwin" ]]
then
	mkdir -p ~/.config/karabiner
	ln -f -s "$PWD/karabiner.json" ~/.config/karabiner/karabiner.json
fi

# Obsidian vimrc — one shared file across every vault under ~/Documents/Obsidian/.
# Each vault's .obsidian.vimrc is symlinked to ~/dotfiles/obsidian.vimrc.
# Re-run safely after creating a new vault; community plugins still need to be
# installed and toggled on inside each vault for the remaps to take effect.
if [ -d "$HOME/Documents/Obsidian" ]; then
	for vault in "$HOME"/Documents/Obsidian/*/; do
		[ -d "${vault}.obsidian" ] || continue
		ln -f -s "$PWD/obsidian.vimrc" "${vault}.obsidian.vimrc"
	done
fi

# for sshrc


# vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install tools
# . install_tools.sh

# git conf
. gitconf.sh
