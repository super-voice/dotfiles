# Editor-related
set -o vi
export VISUAL=/usr/local/bin/vim
export EDITOR=/usr/local/bin/vim

# Locale-related
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Aliases-related
export LESS=' -R '
alias ls='gls --color=auto'
alias ll='ls -h1'

# Pkg manager-related
export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH
export PKG_CONFIG_PATH=$HOME/lib/pkgconfig:/usr/local/lib/pkgconfig:/usr/lib/pkgconfig
export ACLOCAL_PATH=$HOME/share/aclocal:/usr/local/share/aclocal
export HOMEBREW_BUILD_FROM_SOURCE=YES

# Compiler-related
# Toolchain-related
APPLE_TOOLCHAIN_DIR="/Library/Developer/CommandLineTools/usr/bin"
MACPORTS_TOOLCHAIN_DIR="/usr/local/bin"
CUSTOM_TOOLCHAIN_DIR="$HOME/build-rel/bin"
export CC=clang
export CXX=clang++
export PATH="$CUSTOM_TOOLCHAIN_DIR:$HOME/build-fallback/bin:$MACPORTS_TOOLCHAIN_DIR:$APPLE_TOOLCHAIN_DIR:$PATH"
export ARCHFLAGS="-Wno-error=unused-command-line-argument"

# Sanitizer-related
#export ASAN_OPTIONS="verbosity=3:malloc_context_size=30:log_path=$HOME/.asan/asan:color=never"
export ASAN_OPTIONS="verbosity=0:malloc_context_size=30:abort_on_error=1:color=always"

# Python-related
export PYTHONPATH="$HOME/Library/Python/2.7/lib/python2.7/site-packages:/usr/local/lib/python2.7/site-packages"
export PATH="$HOME/Library/Python/2.7/bin:$PATH"

# Ruby-related
export GEM_HOME=$HOME/.gem
export PATH="$GEM_HOME/bin:$PATH"

# Go-related
export GOPATH=$HOME/.go:/usr/local/go
export PATH="$GOPATH/bin:$PATH"

# Other
export PATH="$HOME/arcanist/bin:$PATH"
export PATH="$PATH:$HOME/depot_tools"
export LESS="-R"

# Completion
if [ -f /usr/local/etc/bash_completion ]; then
  . /usr/local/etc/bash_completion
fi

# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend

# Write bash history after each command
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
