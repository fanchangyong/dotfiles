# vim: ft=sh
# aliases,for abbreviation
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.df diff
git config --global alias.st status
git config --global alias.cm commit
git config --global alias.unstage 'reset HEAD --'
git config --global alias.last 'log -1 HEAD'
git config --global alias.pl pull
git config --global alias.ps push

git config --global core.editor `which vim`
