#!/usr/bin/env bash

set -e

# get the dir of the current script
SCRITPT_PWD="$(dirname "${BASH_SOURCE[0]}")"

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

if [[ ! -a ~/.gdbinit ]]
then
  ln -sv $PWD/gdbinit ~/.gdbinit
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

if [[ ! -a ~/.ctags ]]; then
  ln -sv $PWD/ctags ~/.ctags
fi

if [[ ! -a ~/.Xresources ]]; then
  ln -sv $PWD/Xresources ~/.Xresources
fi

# Setup Git
. $PWD/gitconfig_setup.sh

# Platform-specified
PLATFORM=$(uname -s)

if [ "$PLATFORM" = "Darwin" ]; then
  . $PWD/osx_defaults_setup.sh
elif [ "$PLATFORM" = "Linux" ]; then
  . $PWD/gnome_defaults_setup.sh
fi

# PostInstall
# install vim plugin manager
if [ ! -d ~/.vim/bundle/vundle.vim ]; then
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/vundle.vim
fi

# install vim plugins
vim +PluginInstall +qall

# install vimproc
pushd ~/.vim/bundle/vimproc.vim/
make clean
make
popd

# test psutil
python -c "import psutil" || echo "failed to find psutil"

popd
