# Dotfiles

##Init
```
git init --bare $HOME/.cfg

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME' (add this alias to .bashrc)
config config --local status.showUntrackedFiles no
```

##Clone
```
git clone --bare git@github.com:Marrikulus/dotfiles.git $HOME/.cfg

alias cit='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME' (add this alias to .bashrc)
cit config --local status.showUntrackedFiles no
cit checkout
```

Basic usage example:

```
config add /path/to/file
config commit -m "A short message"
config push
```
