#!/bin/bash

# get the dir of the current script
script_dir="$( cd "$( dirname "$0" )" && pwd )"

if [[ ! -a ~/.zshrc ]]
then
  ln -s $script_dir/zshrc ~/.zshrc
fi

if [[ ! -a ~/.oh-my-zsh ]]
then
  git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi

if [[ ! -a ~/.vimrc ]]
then
  ln -s $script_dir/vimrc ~/.vimrc
fi

#if [[ ! -a ~/.nvimrc ]]
#then
#  ln -s $script_dir/nvimrc ~/.nvimrc
#fi

if [[ ! -a ~/.ycm_extra_conf.py ]]
then
  ln -s $script_dir/ycm_extra_conf.py ~/.ycm_extra_conf.py
fi

if [[ ! -a ~/.gitignore_global ]]
then
  ln -s $script_dir/gitignore_global ~/.gitignore_global
fi

if [[ ! -a ~/.tmux.conf ]]
then
  ln -s $script_dir/tmux.conf ~/.tmux.conf
fi

if [[ ! -a ~/.gdbrc ]]
then
  ln -s $script_dir/gdbrc ~/.gdbrc
fi

if [[ ! -a ~/.cgdbrc ]]
then
  ln -s $script_dir/cgdbrc ~/.cgdbrc
fi

mkdir -p $HOME/bin
mkdir -p $HOME/.go
mkdir -p $HOME/.gems
mkdir -p $HOME/.asan

platform=$(uname)

source $script_dir/gitconfig_setup.sh
source $script_dir/osx_defaults_setup.sh

