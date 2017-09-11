# Dotfiles

After cloning this repo, run './install' to automatically set up dotfiles for your Mac. Note that the install script is idempotent: it can safely be run multiple times. Also... this is pretty opinionated since it comes straight from my computer.

Puntos uses [dotbot](https://github.com/anishathalye/dotbot) for installation.

## What's in this?

Right now, i'ts got configuration for:
- Atom
- Oh-my-git (this is a oh-my-zsh thing with git...)
- git
- iTerm2

Configuration for Mac defaults and an install folder with a script to initialize a new mac and set it up for web dev


## Notes

for Oh my git after a clean installation... go to

https://github.com/arialdomartini/oh-my-git


## Install

On fresh installation of MacOS:

```
sudo softwareupdate -i -a
xcode-select --install
```

Clone and install dotfiles:

```
git clone https://github.com/rodrigoibarra/puntos.git
cd ~/puntos
chmod +wx fresh.sh
./fresh.sh
```
To update a system...

run ´sh install.sh´
