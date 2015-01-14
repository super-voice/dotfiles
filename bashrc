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
alias ldd='otool -L'

# Compiler-related
export ARCHFLAGS="-Wno-error=unused-command-line-argument"
export DEVELOPER_DIR="/Applications/Xcode.app/Contents/Developer"
#TOOLCHAIN_DIR="$DEVELOPER_DIR/Toolchains/XcodeDefault.xctoolchain"
TOOLCHAIN_DIR="/Library/Developer/CommandLineTools"
export PATH=/usr/local/bin:$TOOLCHAIN_DIR/usr/bin:/usr/local/sbin:$PATH

# Sanitizer-related
export ASAN_SYMBOLIZER_PATH=/usr/local/bin/llvm-symbolizer-3.5
#export ASAN_OPTIONS="verbosity=3:malloc_context_size=30:log_path=$HOME/.asan/asan:color=never"
export ASAN_OPTIONS="verbosity=0:malloc_context_size=30:abort_on_error=1:color=always"

# Java-related
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_72.jdk/Contents/Home"
export JAVA_OPTS="-Dfile.encoding=UTF-8 -XX:MaxPermSize=256m"
export _JAVA_OPTIONS="-DsocksProxyHost=127.0.0.1 -DsocksProxyPort=1080"
export PATH="$JAVA_HOME/bin:$PATH"

# Python-related
export PYTHONPATH="$HOME/Library/Python/2.7/lib/python2.7/site-packages"
export PATH="$HOME/Library/Python/2.7/bin:$PATH"

# Ruby-related
export GEM_HOME=$HOME/.gems
export PATH="$GEM_HOME/bin:$PATH"

# Go-related
export GOPATH=$HOME/.go
export PATH="$GOPATH/bin:$PATH:/usr/local/opt/go/libexec/bin"

# Haskell-related
CABAL_BASE=$HOME/.cabal/bin
export PATH="$CABAL_BASE:$PATH"

# Homebrew-related
export HOMEBREW_BUILD_FROM_SOURCE=YES

# Other
export PATH="$HOME/arcanist/bin:$PATH"
export PATH="$PATH:$HOME/depot_tools"

. /usr/local/etc/bash_completion.d/git-completion.bash
. /usr/local/etc/bash_completion.d/git-prompt.sh