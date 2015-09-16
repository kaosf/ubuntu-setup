sudo apt-get -y install libevent-dev libncurses-dev
sudo apt-get -y remove tmux
mkdir -p $HOME/local/src
cd $HOME/local/src
rm -rf tmux-*
wget http://downloads.sourceforge.net/tmux/tmux-2.0.tar.gz
tar xzf tmux-2.0.tar.gz
rm -f tmux-2.0.tar.gz
cd tmux-2.0
./configure --prefix=$HOME/local
make
make install
