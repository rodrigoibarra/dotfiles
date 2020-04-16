# This script installs homebrew for app installation

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

nvm install node
nvm use node
nvm run node --version

brew tap Goles/battery
brew tap mongodb/brew
brew update
brew upgrade

# Wait a bit before moving on...
sleep 1

echo "Let's go get some beans to grind."
for i in $(cat beans/bensaKokosa);
    do brew install "$i";
done

echo "besaKokosa brought all the brews from the homebrew"

location=--appdir="/Applications"
for i in $(cat beans/gesha);
    do brew cask install "$i";
done

echo "Gesha brought all the apps from the web"

for i in $(cat beans/typica);
    do mas install "$i";
done

echo "Typica brought all the apps AppStore"

sleep 1

for i in $(cat beans/estelar);
    do gem install "$i";
done

for i in $(cat beans/laGruta);
    do npm install "$i";
done

echo "Estelar and laGruta brought all the gems and npm packages"


# Make zsh default shell
sudo chsh -s $(which zsh)

