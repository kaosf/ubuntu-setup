if [[ $1 = local ]]; then
  echo 'Build "libevent-dev" and "libncurses-dev".' >&2
else
  sudo apt-get -y install libevent-dev libncurses-dev
  sudo apt-get -y remove tmux
fi
wget https://github.com/tmux/tmux/releases/download/2.0/tmux-2.0.tar.gz
tar xzf tmux-2.0.tar.gz
rm -f tmux-2.0.tar.gz
cd tmux-2.0
if [[ $1 = local ]]; then
  ./configure --prefix=$HOME/local
  make
  make install
  mkdir -p $HOME/local/src
  cd -
  rm -rf $HOME/local/src/tmux-*
  mv tmux-2.0 $HOME/local/src
else
  ./configure
  make
  sudo make install
  cd -
  sudo rm -rf /usr/local/src/tmux-*
  sudo mv tmux-2.0 /usr/local/src
fi
