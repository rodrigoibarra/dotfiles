set -e


BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cd "${BASEDIR}"



# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.bash_profile
ln -s ${BASEDIR}/dotfiles/bash_profile $HOME/.bash_profile

rm -rf $HOME/.bashrc
ln -s ${BASEDIR}/dotfiles/bashrc $HOME/.bashrc

rm -rf $HOME/.gitconfig
ln -s ${BASEDIR}/dotfiles/gitconfig $HOME/.gitconfig

rm -rf $HOME/.gitignore_global
ln -s ${BASEDIR}/dotfiles/gitignore_global $HOME/.gitignore_global

rm -rf $HOME/.profile
ln -s ${BASEDIR}/dotfiles/profile $HOME/.profile

rm -rf $HOME/.zshrc
ln -s ${BASEDIR}/dotfiles/zshrc $HOME/.zshrc

rm -rf $HOME/.hyper.js
ln -s ${BASEDIR}/dotfiles/hyper.js $HOME/.hyper.js