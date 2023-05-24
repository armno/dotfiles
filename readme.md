# Armno's dotfiles

## setting up

clone this repo

```sh
cd ~/code
git clone git@github.com:armno/dotfiles.git
```

### oh-my-zsh

switch to `zsh` from `bash`: install `oh-my-zsh` and follow the instructions there.

use my customized theme based on "cloud" for [oh-my-zsh](http://ohmyz.sh/). assuming oh-my-zsh is installed:

```sh
ln -s ~/code/dotfiles/cloud-armno.zsh-theme ~/.oh-my-zsh/themes/cloud-armno.zsh-theme
```

then change `ZSH_THEME` option in `~/.zshrc` file to `cloud-armno`

### base16-shell

install it [here](https://github.com/chriskempson/base16-shell)

### kitty

install kitty from [https://sw.kovidgoyal.net/kitty/binary/](https://sw.kovidgoyal.net/kitty/binary/)

then symlink kitty's config file.

```sh
ln -s ~/code/dotfiles/kitty.conf ~/.config/kitty/kitty.conf
```

### Vim

my vim setup requires [ag](https://github.com/ggreer/the_silver_searcher)
and [editorconfig](http://editorconfig.org), which can be installed by

```sh
brew install the_silver_searcher editorconfig
```

then set up Vim and [Plug](https://github.com/junegunn/vim-plug)

```sh
ln -s ~/code/dotfiles/.vim ~/.vim
ln -s ~/code/dotfiles/.vimrc ~/.vimrc
```

Install Plug from [https://github.com/junegunn/vim-plug#unix](https://github.com/junegunn/vim-plug#unix),
then install plugins with

```sh
vim +PlugInstall +qall
```

### VSCode

enable key-repeat for vscode (with vim extenstion)

```sh
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
defaults delete -g ApplePressAndHoldEnabled
```

don't forget to add 'markdown' in the config after installed Prettier:
```json
"prettier.disabledLanguages": [
  "markdown"
]
```

### git

- `git diff` is using [delta](https://dandavison.github.io/delta/)

```sh
brew install git-delta
```

- create symlinks for global config file and commit template

```sh
ln -s ~/code/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/code/dotfiles/.gitmessage ~/.gitmessage
```

### osx

(this doesn't do anything i think. it just creates a symlink without actually run the commands inside.)

```sh
ln -s ~/code/dotfiles/.osx ~/.osx
killall SystemUIServer
```

### aliases, functions

```sh
ln -s ~/code/dotfiles/.aliases ~/.aliases
ln -s ~/code/dotfiles/.functions ~/.functions
```

add in `~/.zshrc` file

```
source ~/.aliases
source ~/.functions
```

### ag

`ag`'s ignored patterns. normally `ag` ignores patterns in `.gitignore` file but still, there are some files in the repo that shouldn't show up in `CtrlP`.

```sh
ln -s ~/code/dotfiles/.agignore ~/.agignore
```

### Remove 'Last Login' message

```sh
touch ~/.hushlogin
```

### zoxide

install [`zoxide`](https://github.com/ajeetdsouza/zoxide)

### bat

[`bat`](https://github.com/sharkdp/bat) another kind of `cat`.

```sh
brew install bat
```

### fzf

shamelessly stole `preview` alias from Remy Sharp's ["CLI: Improved"](https://remysharp.com/2018/08/23/cli-improved) post.

```sh
brew install fzf
```

### exa

use `exa` instead of `ls`

```sh
brew install exa
```

### keyboard

enable key repeats

```sh
defaults write -g ApplePressAndHoldEnabled -bool false
```

make keyboard key repeats faster

```sh
defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)
```

go to **System Preferences > Keyboard**. Set Key Repeat to be `fastest` and Delay Until Report to be `shortest`.
