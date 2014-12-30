#!/usr/bin/env /bash

set -e

# get the dir of the current script
PWD=$(dirname "${BASH_SOURCE[0]}")
#Platform
PLATFORM=$(uname -s)

if [[ ! -a ~/.zshrc ]]
then
  ln -sv $PWD/zshrc ~/.zshrc
fi

if [[ ! -a ~/.oh-my-zsh ]]
then
  git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi

if [[ ! -a ~/.vimrc ]]
then
  ln -sv $PWD/vimrc ~/.vimrc
fi

if [[ ! -a ~/envs.sh ]]
then
  ln -sv $PWD/envs.sh ~/envs.sh
fi

if [[ ! -a ~/.ycm_extra_conf.py ]]
then
  ln -sv $PWD/ycm_extra_conf.py ~/.ycm_extra_conf.py
fi

if [[ ! -a ~/.gitignore_global ]]
then
  ln -sv $PWD/gitignore_global ~/.gitignore_global
fi

if [[ ! -a ~/.tmux.conf ]]
then
  ln -sv $PWD/tmux.conf ~/.tmux.conf
fi

if [[ ! -a ~/.gdbrc ]]
then
  ln -sv $PWD/gdbrc ~/.gdbrc
fi

if [[ ! -a ~/.cgdbrc ]]
then
  ln -sv $PWD/cgdbrc ~/.cgdbrc
fi

mkdir -pv $HOME/bin
mkdir -pv $HOME/.go
mkdir -pv $HOME/.gems
mkdir -pv $HOME/.vim/syntax

cp -fv $PWD/vim/*.vim $HOME/.vim/syntax/

. $PWD/gitconfig_setup.sh

if [ "$PLATFORM" = "Darwin" ]; then
  . $PWD/osx_defaults_setup.sh
fi

