# vim: ft=sh
# aliases,for abbreviation
git config --global alias.co checkout
git config --global alias.cl clone
git config --global alias.br branch
git config --global alias.df diff
git config --global alias.st status
git config --global alias.cm commit
git config --global alias.pl pull
git config --global alias.ps push
git config --global alias.sm submodule
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

git config --global core.editor `which nvim`
git config --global color.ui true
git config --global user.name "fanchangyong"
git config --global user.email "fanchangyong@gmail.com"
