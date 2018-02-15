#!/usr/bin/env bash
set -e

# get the dir of the current script
SCRIPT_PWD="$(dirname "${BASH_SOURCE[0]}")"
cd "$SCRIPT_PWD"
PWD="$(pwd)"

# create default directories
mkdir -pv ~/bin ~/.go ~/.gems ~/.vim ~/tmp

# bashrc script
[[ ! -a ~/.bashrc ]] && ln -sv $PWD/bashrc ~/.bashrc

# gitignore
[[ ! -a ~/.gitignore_global ]] && ln -sv $PWD/gitignore_global ~/.gitignore_global

# tmux configuration
[[ ! -a ~/.tmux.conf ]] && ln -sv $PWD/tmux.conf ~/.tmux.conf

# gdb configuration
[[ ! -a ~/.gdbinit ]] && ln -sv $PWD/gdbinit ~/.gdbinit

# cgdb configuration
[[ ! -a ~/.cgdbrc ]] && ln -sv $PWD/cgdbrc ~/.cgdbrc

# lldb configuration
[[ ! -a ~/.lldbinit ]] && ln -sv $PWD/lldbinit ~/.lldbinit

# vimrc configuration
[[ ! -a ~/.vimrc ]] && ln -sv $PWD/vimrc ~/.vimrc
[[ ! -a ~/.vim/syntax ]] && ln -sv $PWD/syntax ~/.vim/syntax
[[ ! -a ~/.vim/ftdetect ]] && ln -sv $PWD/ftdetect ~/.vim/ftdetect

# ctags configuration
[[ ! -a ~/.ctags ]] && ln -sv $PWD/ctags ~/.ctags

# Setup Git
echo "Setup Git global config"
. ./gitconfig_setup.sh

# OS-specific
OS_SYSNAME=$(uname -s)

echo "Install Platform-specific modules"
if [ "$OS_SYSNAME" = "Darwin" ]; then
  . ./osx_defaults_setup.sh
  [[ ! -z "$INSTALL_HOMEBREW" ]] && . ./osx_brew_setup.sh
elif [ "$OS_SYSNAME" = "Linux" ]; then
  [[ ! -a ~/.Xresources ]] && ln -sv $PWD/Xresources ~/.Xresources
  . ./gnome_defaults_setup.sh
fi

# vim's PostInstall
# install vim plugin manager
echo "Install vim plugins"
if [ ! -d ~/.vim/bundle/vundle.vim ]; then
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/vundle.vim
fi

# install all vim plugins
vim +PluginInstall +qall

# install vimproc
echo "Build vimproc module"
pushd ~/.vim/bundle/vimproc.vim/
make clean
make
popd

# psutil module check
python -c "import psutil" || echo "failed to find psutil"

echo "dotfiles is set up"
