# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish
set fish_greeting "Welcome back"

# Theme
set fish_theme numist

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-fish/plugins/*)
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Example format: set fish_plugins autojump bundler
set fish_plugins rbenv node python rake

# Path to your custom folder (default path is $FISH/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish
set -x PATH $HOME/bin /usr/local/bin /usr/local/sbin $PATH $HOME/depot_tools
set LESSPIPE /usr/local/bin/src-hilite-lesspipe.sh
set -x LESS '-R'
set -x EDITOR /usr/local/bin/vim
set -x CC clang
#set -x CXX "clang++ -std=c++1y -stdlib=libc++"
set -x CXX "clang++ -std=c++1y"
set -x GOPATH $HOME/.local/go
set -x GEM_HOME $HOME/.local/gems
set -x PATH $GEM_HOME/bin $GOPATH/bin $PATH
set -x HOMEBREW_BUILD_FROM_SOURCE YES
set -x PATH ~/.cabal/bin $PATH
set -x PKG_CONFIG_PATH /opt/X11/lib/pkgconfig
set -x ARCHFLAGS -Wno-error=unused-command-line-argument-hard-error-in-future
set -x DOCKER_HOST "tcp://localhost:4243"
