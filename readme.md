# Armno's dotfiles

## setting up

switch to `zsh` from `bash`

```sh
$ brew install zsh zsh-completions
$ sudo dscl . -create /Users/$USER UserShell /usr/local/bin/zsh
```

(ref: https://rick.cogley.info/post/use-homebrew-zsh-instead-of-the-osx-default/)

or just install `oh-my-zsh` and follow the instructions there.

```sh
$ cd ~/code
$ git clone git@github.com:armno/dotfiles.git
```

### base16-shell

install it [here](https://github.com/chriskempson/base16-shell)

### oh-my-zsh

![modified cloud theme](screenshot.png)

use my customized theme based on "cloud" for [oh-my-zsh](http://ohmyz.sh/). assuming oh-my-zsh is installed:

```sh
$ ln -s ~/code/dotfiles/cloud-armno.zsh-theme ~/.oh-my-zsh/themes/cloud-armno.zsh-theme
```

then change `ZSH_THEME` option in `~/.zshrc` file to `cloud-armno`

### vim

my vim setup requires [ag](https://github.com/ggreer/the_silver_searcher)
and [editorconfig](http://editorconfig.org), which can be installed by

```sh
$ brew install the_silver_searcher editorconfig
```

then set up vim and vundle.

```sh
$ ln -s ~/code/dotfiles/.vim ~/.vim
$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
$ ln -s ~/code/dotfiles/.vimrc ~/.vimrc
$ vim +PluginInstall +qall
```

adding new plugin / updating existing plugins, see [Vundle](https://github.com/gmarik/Vundle.vim)

### vscode

enable key-repeat for vscode insiders (with vim extenstion)

```sh
$ defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false
$ defaults delete -g ApplePressAndHoldEnabled
```

go to **System Preferences > Keyboard**. Set Key Repeat to be `fastest` and Delay Until Report to be `shortest`.

### git

- `git diff` is using [diff-so-fancy](https://github.com/so-fancy/diff-so-fancy)

```sh
$ brew install diff-so-fancy
$ ln -s ~/code/dotfiles/.gitconfig ~/.gitconfig
```

### osx

(this doesn't do anything i think. it just creates a symlink without actually run the commands inside.)

```sh
$ ln -s ~/code/dotfiles/.osx ~/.osx
$ killall SystemUIServer
```

### aliases, functions

```sh
$ ln -s ~/code/dotfiles/.aliases ~/.aliases
$ ln -s ~/code/dotfiles/.functions ~/.functions
```

add in `~/.zshrc` file

```
source ~/.aliases
source ~/.functions
```

### ag

`ag`'s ignored patterns. normally `ag` ignores patterns in `.gitignore` file but still, there are some files in the repo that shouldn't show up in `CtrlP`.

```sh
$ ln -s ~/code/dotfiles/.agignore ~/.agignore
```

### Remove 'Last Login' message

```sh
$ touch ~/.hushlogin
```

### z

1. Clone [z](https://github.com/rupa/z) to `/Users/armno/code/z`.
2. Add z at the top of `~/.zshrc` file.

```bash
. /Users/armno/code/z/z.sh
# ...
```

### bat

[`bat`](https://github.com/sharkdp/bat) another kind of `cat`.

```sh
$ brew install bat
```
