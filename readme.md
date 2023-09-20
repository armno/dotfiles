# Armno's dotfiles

## setting up

Clone this repo

```sh
cd ~/code
git clone git@github.com:armno/dotfiles.git
```

### Homebrew

[Install Homebrew](https://brew.sh/), then install all packages needed for the set up mentioned in this readme.

```sh
brew install eza zoxide coreutils editorconfig git-delta bat fzf starship fnm
```

### iTerm

1. Download iTerm3
2. Symlink `.zshrc` config

```sh
ln -s ~/code/dotfiles/.zshrc ~/.zshrc
```

zsh plugins

```sh
brew install zsh-autosuggestion zsh-syntax-highlighting
```
check `brew info zsh-autosuggestions` and `brew info zsh-autosuggestions` and update paths in `.zshrc` if needed.

### Aliases and Functions

```sh
ln -s ~/code/dotfiles/.aliases ~/.aliases
ln -s ~/code/dotfiles/.functions ~/.functions
```

### Starship

1. Install Nerd Fonts from [https://ohmyposh.dev/docs/installation/fonts](https://ohmyposh.dev/docs/installation/fonts)
2. symlink the config file

```sh
ln -s ~/code/dotfiles/.config/starship.toml ~/.config/starship.toml
```

### Base16-shell

Install it [here](https://github.com/chriskempson/base16-shell) and activate the theme

```sh
base16_material-darker
```

### Vim

My Vim setup requires [ag](https://github.com/ggreer/the_silver_searcher)
and [editorconfig](http://editorconfig.org), which are already installed by the brew command above.

Install Plug from [https://github.com/junegunn/vim-plug#unix](https://github.com/junegunn/vim-plug#unix),
then install plugins with

```sh
vim +PlugInstall +qall
```

and symlink Vim's config file

```sh
ln -s ~/code/dotfiles/.vimrc ~/.vimrc
```

### Keyboard Tweaks

TODO: macOS 13.x doesn't need these settings anymore i think

Enable key repeats

```sh
defaults write -g ApplePressAndHoldEnabled -bool false
```

Make keyboard key repeats faster

```sh
defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)
```

Go to **System Preferences > Keyboard**. Set Key Repeat to be `fastest` and Delay Until Report to be `shortest`.

### VSCode

Enable key-repeat for VScode when using it with Vim extenstion.
To be honest, I don't know which one works.

```sh
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
defaults delete -g ApplePressAndHoldEnabled
```

Don't forget to add 'markdown' in the config after installed Prettier:

```json
"prettier.disabledLanguages": [
  "markdown"
]
```

### Git

Create a local .gitconfig file that extends the one in this repo

```sh
touch ~/.gitconfig
```

And put custom Git config there. For example:

```
[include]
  path = ~/code/dotfiles/.gitconfig

[user]
  name = Another Armno
  email = anotheremail
```

### osx

TODO: This doesn't do anything i think. it just creates a symlink without actually run the commands inside.

```sh
ln -s ~/code/dotfiles/.osx ~/.osx
killall SystemUIServer
```

### Remove 'Last Login' message

```sh
touch ~/.hushlogin
```

### bat

[`bat`](https://github.com/sharkdp/bat) another kind of `cat`.

```sh
mkdir -p ~/.config/bat
ln -s .config/bat/config ~/.config/bat/config
```

