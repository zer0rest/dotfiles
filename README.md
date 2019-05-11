# Dotfiles

These are the dotfiles I use to customise various applications I use daily.

## tmux/

**This is the folder where all tmux configuration files and scripts are kept.**

`.tmux.conf` is symlinked to my `~/` directory and contains configuration options that control the appearance, functionalty and keyboard shortcuts of tmux.

`tmuxdeploy.sh` is the script I use everytime I reboot my computer to redeploy my
tmux layout.
It is symlinked to my home directory and aliased to shortcuts to make it's use easier:

```
alias td="./tmuxdeploy"
alias tdf="./tmuxdeploy f"
```
## bash/

`bash_aliases` is symlinked to my `~/` directory and contains aliases for my bash terminal. It is sourced from `.bashrc` using the `source .bash_aliases` command.

```
ln -s /home/zer0rest/dotfiles/bash/bash_aliases /home/zer0rest/.bash_aliases
```

Then, add the following if statement to `.bashrc`

```
if [ -f .bash_aliases ]; then
  source .bash_aliases
fi
```
