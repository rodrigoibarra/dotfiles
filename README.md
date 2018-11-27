# DRIPR

.Dripr is the recipe for my MacOS environment, what I mean by that is, I can take a new Mac computer, run brew.sh and it will install most of the stuff I need, like npm and git and node, along with a bunch of apps that I use daily. After the brew is done, It will link all my .dotfiles to the new instances so I’ll have all my personal configuratións with minimal effort.


## What's in this?

Brew.sh is a three script task, and you can run each on its own:
- Ground.sh - Will check and install the entire environment, you can check the list of apps and frameworks it will install here.
- Pour.sh - Will run a bunch of scripts that will reset and change some defaults on your MacOS to make it a bit better ( this is pretty much a slightly altered version of what Mathias Bynens did, this is basically the standard).
- Cleanup.sh - Will symlink all my current .dotfiles with my personal configuration and settings for the apps that I use.

**Note:  Do not run any script without understanding what it does and if you do chose to run this one, it is in no way perfect, this is just what works for me, but you can still use it to build your own.**



## Notes

for Oh my git after a clean installation... go to

https://github.com/arialdomartini/oh-my-git


## Install

On fresh installation of MacOS:

```shell
 git clone https://github.com/rodrigoibarra/brwr.git && cd brwr
```
Once that's done **please read the script and understand what it does**
```shell
 nano freshBrew.sh
```
Now you are ready to brew some hot hot new env.
```shell
 sh freshBrew.sh
```

