# dotfiles

```
git init --bare $HOME/.cfg

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME' (add this alias to .bashrc)
config config --local status.showUntrackedFiles no
```

Basic usage example:

```
config add /path/to/file
config commit -m "A short message"
config push
```
