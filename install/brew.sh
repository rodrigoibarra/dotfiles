# This script installs homebrew for app installation

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap homebrew/versions
brew tap homebrew/dupes
brew tap Goles/battery
brew tap homebrew/php
brew update
brew upgrade

# Install packages
brew install dockutil #this handles dock icons
brew install openssl
brew install nmap
brew install git
brew install node
brew install python3
brew install thefuck
brew install wget
brew install zsh
brew install zsh-completions
brew install unrar
brew install wifi-password

# Wait a bit before moving on...
sleep 1

# ...and then.
echo "Success! Basic brew packages are installed."

# Cask
brew tap caskroom/cask
brew install brew-cask
brew tap caskroom/versions
brew cask install caskroom/fonts/font-symbola
brew install mas

# Install cask packages

brew cask install --appdir="/Applications" google-chrome
brew cask install --appdir="/Applications" dropbox
brew cask install --appdir="/Applications" google-drive
brew cask install --appdir="/Applications" slack
brew cask install --appdir="/Applications" atom
brew cask install --appdir="/Applications" phpstorm
brew cask install --appdir="/Applications" sequel-pro
brew cask install --appdir="/Applications" appcleaner
brew cask install --appdir="/Applications" skype
brew cask install --appdir="/Applications" the-unarchiver
brew cask install --appdir="/Applications" iterm2
brew cask install --appdir="/Applications" fork
brew cask install --appdir="/Applications" sketch
brew cask install iina

# Quick Look Plugins (https://github.com/sindresorhus/quick-look-plugins)
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql qlimagesize webpquicklook qlvideo

# Wait a bit before moving on...
sleep 1

# ...and then.
echo "Success! Brew additional applications are installed."
