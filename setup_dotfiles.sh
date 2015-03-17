#!/usr/bin/env bash

set -e

# get the dir of the current script
PWD=$(dirname "${BASH_SOURCE[0]}")
#Platform
PLATFORM=$(uname -s)

if [[ ! -a ~/.bashrc ]]
then
  ln -sv $PWD/bashrc ~/.bashrc
fi

if [[ ! -a ~/.vimrc ]]
then
  ln -sv $PWD/vimrc ~/.vimrc
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

if [ ! -d ~/.lldbinit ]; then
  ln -sv $PWD/lldbinit $HOME/.lldbinit
fi

mkdir -pv $HOME/bin
mkdir -pv $HOME/.go
mkdir -pv $HOME/.gems
mkdir -pv $HOME/.vim

if [ ! -d ~/.vim/syntax ]; then
  ln -sv $PWD/syntax $HOME/.vim/syntax
fi

if [ ! -d ~/.vim/ftdetect ]; then
  ln -sv $PWD/ftdetect $HOME/.vim/ftdetect
fi

. $PWD/gitconfig_setup.sh

if [ "$PLATFORM" = "Darwin" ]; then
  . $PWD/osx_defaults_setup.sh
fi

