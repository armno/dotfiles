# Armno's dotfiles

> note to self: `sync.sh` is not used.

## setting up

```sh
$ cd ~/code
$ git clone --recursive git@github.com:armno/dotfiles.git
```
this will clone all submodules too (for plugins and colors).

### vim

```sh
$ ln -s ~/code/dotfiles/.vimrc ~/.vimrc
$ ln -s ~/code/dotfiles/.vim ~/.vim
```

### git

```sh
$ ln -s ~/code/dotfiles/.gitconfig ~/.gitconfig
```

### osx

```sh
$ ln -s ~/code/dotfiles/.osx ~/.osx
```

## adding new plugin

using [git submodules](http://git-scm.com/book/en/Git-Tools-Submodules)

```sh
$ git submodule add <repo_url> .vim/bundle/<directory_name>
```
