# Armno's dotfiles

## setting up

Clone this repo

```sh
cd ~/code
git clone git@github.com:armno/dotfiles.git
```

### macOS

[Install Homebrew](https://brew.sh/), then install the macOS dependencies:

```sh
brew install eza zoxide coreutils editorconfig git-delta bat fzf starship fnm
```

### Ghostty

1. [Download Ghostty](https://ghostty.org/)
2. Symlink Ghostty config file

```sh
mkdir -p ~/.config/ghostty
ln -s ~/code/dotfiles/.config/ghostty/config ~/.config/ghostty/config
```

### macOS Zsh

Install the Zsh plugins with Homebrew:

```sh
brew install zsh-autosuggestions zsh-syntax-highlighting
```

Symlink the Zsh configuration:

```sh
ln -sfn ~/code/dotfiles/.zshrc ~/.zshrc
```

### Omarchy Zsh

On Omarchy/Arch, install Zsh and its plugins:

```sh
omarchy pkg add zsh zsh-autosuggestions zsh-syntax-highlighting
omarchy pkg aur add fzf-tab
```

Symlink the Zsh configuration:

```sh
ln -sfn ~/code/dotfiles/.zshrc ~/.zshrc
```

Make Zsh the default login shell:

```sh
chsh -s "$(command -v zsh)"
```

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

### tmux

Symlink tmux config file

```sh
ln -s ~/code/dotfiles/.tmux.conf ~/.tmux.conf
```

### Herdr

Symlink Herdr config file

```sh
mkdir -p ~/.config/herdr
ln -s ~/code/dotfiles/.config/herdr/config.toml ~/.config/herdr/config.toml
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

### Omarchy

These files customize Omarchy without modifying its package-managed files in
`/usr/share/omarchy/`.

```sh
DOTFILES="$HOME/code/dotfiles"
mkdir -p ~/.config/hypr ~/.config/omarchy

for file in autostart.lua bindings.lua hyprland.conf hyprland.lua \
  hyprsunset.conf input.lua looknfeel.lua monitors.lua xdph.conf; do
  ln -sfn "$DOTFILES/.config/hypr/$file" "$HOME/.config/hypr/$file"
done

ln -sfn "$DOTFILES/.config/omarchy/shell.json" \
  "$HOME/.config/omarchy/shell.json"
```

`monitors.lua` contains local display scaling and may need to be adjusted on a
different machine. After changing Hyprland files, validate the configuration:

```sh
hyprctl reload
hyprctl configerrors
```
