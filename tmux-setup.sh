sudo aptitude install libevent-dev libncurses-dev
#sudo aptitude install libevent-dev libncurses5-dev

mkdir -p $HOME/local/src
cd $HOME/local/src
wget http://downloads.sourceforge.net/tmux/tmux-1.9a.tar.gz
tar xzf tmux-1.9a.tar.gz
rm -f tmux-1.9a.tar.gz
cd tmux-1.9a
./configure --prefix=$HOME/local
make
make install
