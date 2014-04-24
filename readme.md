# Armno's dotfiles

## setting up

```sh
$ cd ~/code
$ git clone git@github.com:armno/dotfiles.git
```

### vim

```sh
$ cd dotfiles
$ git clone https://github.com/gmarik/vundle.git .vim/bundle/vundle
$ vim +PluginInstall +qall
$ ln -s ~/code/dotfiles/.vimrc ~/.vimrc
$ ln -s ~/code/dotfiles/.vim ~/.vim
```

my vim setup requires [ag](https://github.com/ggreer/the_silver_searcher) which can be installed by

```sh
$ brew install the_silver_searcher
```

### git

```sh
$ ln -s ~/code/dotfiles/.gitconfig ~/.gitconfig
```

### osx

```sh
$ ln -s ~/code/dotfiles/.osx ~/.osx
```

## adding new plugin / updating existing plugins

see [Vundle](https://github.com/gmarik/Vundle.vim)

