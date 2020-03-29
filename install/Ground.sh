# This script installs homebrew for app installation

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap Goles/battery
brew tap mongodb/brew
brew update
brew upgrade

# Install packages

brew install openssl
brew install mongodb-community
brew install git
brew install node
brew install ruby
brew install thefuck
brew install zsh
brew install zsh-completions
brew install antigen
brew install unrar
brew install wifi-password

# Wait a bit before moving on...
sleep 1

# ...and then.
echo "Yassss! Basic brew packages are installed."

# Cask
brew tap caskroom/cask
brew install brew-cask
brew tap caskroom/versions
brew install mas

# Install cask packages

echo "Let's go get some more stuff."

brew cask install --appdir="/Applications" google-chrome
brew cask install --appdir="/Applications" dropbox
brew cask install --appdir="/Applications" visual-studio-code
brew cask install --appdir="/Applications" sequel-pro
brew cask install --appdir="/Applications" the-unarchiver
brew cask install --appdir="/Applications" hyper
brew cask install --appdir="/Applications" sketch
brew cask install --appdir="/Applications" openemu
brew cask install --appdir="/Applications" firefox

# Wait a bit before moving on...
sleep 1

# ...and then.
echo "well... more stuff got installed"

echo "now some gems..."

# All gems
gem install bundler
gem install jekyll
npm install vue

echo "now some grunt... why do we still use grunt????"
# Now Grunt
npm install -g grunt-cli

echo "I'm not ashamed of using grunt... and neither sould you, use what works"

# Make zsh default shell
sudo chsh -s $(which zsh)
