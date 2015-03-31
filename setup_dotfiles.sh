#!/usr/bin/env bash

set -e

# get the dir of the current script
SCRITPT_PWD="$(dirname "${BASH_SOURCE[0]}")"
#Platform
PLATFORM=$(uname -s)

pushd "$SCRITPT_PWD"

PWD="$(pwd)"

if [[ ! -a ~/.bashrc ]]
then
  ln -sv $PWD/bashrc ~/.bashrc
fi

if [[ ! -a ~/.vimrc ]]
then
  ln -sv $PWD/vimrc ~/.vimrc
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

if [[ ! -a ~/.lldbinit ]]; then
  ln -sv $PWD/lldbinit ~/.lldbinit
fi

mkdir -pv ~/bin ~/.go ~/.gems ~/.vim ~/tmp

if [[ ! -a ~/.vim/syntax ]]; then
  ln -sv $PWD/syntax ~/.vim/syntax
fi

if [[ ! -a ~/.vim/ftdetect ]]; then
  ln -sv $PWD/ftdetect ~/.vim/ftdetect
fi

. $PWD/gitconfig_setup.sh

if [ "$PLATFORM" = "Darwin" ]; then
  . $PWD/osx_defaults_setup.sh
fi

popd
