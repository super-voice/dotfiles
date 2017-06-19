# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Editors
set -o vi
export VISUAL=/usr/bin/vim
export EDITOR=/usr/bin/vim
export PAGER=/usr/bin/less

# Compiler-related
export ARCHFLAGS="-Wno-error=unused-command-line-argument"
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:/usr/lib64/pkgconfig:/usr/share/pkgconfig

# Ruby-related
export GEM_HOME=$HOME/.gems
export PATH="$GEM_HOME/bin:$PATH"

# Go-related
export GOPATH=$HOME/.go
export GOBIN=$GOPATH/bin
export PATH="$GOBIN:$PATH"

# Haskell-related
CABAL_BASE=$HOME/.cabal/bin
export PATH="$CABAL_BASE:$PATH"

# Sanitizer-related
export ASAN_OPTIONS="disable_core=0:detect_leaks=1:abort_on_error=1:color=always:malloc_context_size=100:max_leaks=100:report_objects=1"
export TSAN_OPTIONS="disable_core=0:abort_on_error=1:color=always"
export MSAN_OPTIONS="disable_core=0:abort_on_error=1:color=always"
export UBSAN_OPTIONS="disable_core=0:abort_on_error=1:color=always"

# Java-related
unset JAVA_HOME
export JAVA_OPTS="-Dfile.encoding=UTF-8 -XX:MaxPermSize=256m"
#export _JAVA_OPTIONS="-DsocksProxyHost=127.0.0.1 -DsocksProxyPort=1080"
#export PATH="$JAVA_HOME/bin:$PATH"

# Other
export PATH="$HOME/arcanist/bin:$HOME/.local/bin:$PATH"
export PATH="$PATH:$HOME/depot_tools"
export LESS="-R"

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend
export HISTSIZE=1000000
export HISTFILESIZE=1000000

# Write bash history after each command
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
