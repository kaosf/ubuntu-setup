# ref. https://github.com/Homebrew/linuxbrew#installation

sudo apt-get install build-essential curl git m4 ruby texinfo libbz2-dev libcurl4-openssl-dev libexpat-dev libncurses-dev zlib1g-dev

ruby -e "$(wget -O- https://raw.github.com/Homebrew/linuxbrew/go/install)"
echo 'export PATH="$HOME/.linuxbrew/bin:$PATH"'                >> $HOME/.zshenv
echo 'export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"'    >> $HOME/.zshenv
echo 'export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"' >> $HOME/.zshenv
source $HOME/.zshenv
brew install pkg-config
brew install makedepend
brew install libevent
brew install openssl
brew install tmux
brew install tig
