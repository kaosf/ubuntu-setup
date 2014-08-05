sudo aptitude install libwxgtk2.8-dev libexpat-dev libsndfile-dev
wget http://audacity.googlecode.com/files/audacity-minsrc-2.0.5.tar.xz
tar xf audacity-minsrc-2.0.5.tar.xz
cd audacity-src-2.0.5
./configure --prefix=$HOME/local
make
make install
