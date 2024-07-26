set -e


BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cd "${BASEDIR}"


 rm -rf $HOME/.gitconfig
 ln -s ${BASEDIR}/dotfiles/gitconfig $HOME/.gitconfig

 rm -rf $HOME/.gitignore_global
 ln -s ${BASEDIR}/dotfiles/gitignore_global $HOME/.gitignore_global

rm -rf $HOME/.zshrc
ln -s ${BASEDIR}/dotfiles/zshrc $HOME/.zshrc

rm -rf $HOME/.config/alacritty/alacritty.toml
ln -s ${BASEDIR}/dotfiles/alacritty/alacritty.toml $HOME/.config/alacritty/alacritty.toml

rm -rf $HOME/.config/alacritty/catppuccin-mocha.toml
ln -s ${BASEDIR}/dotfiles/alacritty/catppuccin-mocha.toml $HOME/.config/alacritty/catppuccin-mocha.toml

rm -rf $HOME/.config/starship.toml
ln -s ${BASEDIR}/dotfiles/starship.toml $HOME/.config/starship.toml

rm -rf $HOME/.config/bat/config
ln -s ${BASEDIR}/dotfiles/bat/config $HOME/.config/bat/config

rm -rf $HOME/.config/bat/themes/Catppuccin Mocha.tmTheme
ln -s ${BASEDIR}/dotfiles/bat/themes/Catppuccin-Mocha.tmTheme $HOME/.config/bat/themes/Catppuccin-Mocha.tmTheme