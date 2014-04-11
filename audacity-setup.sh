wget http://audacity.googlecode.com/files/audacity-minsrc-2.0.5.tar.xz
tar xf audacity-minsrc-2.0.5.tar.xz
cd audacity-src-2.0.5
./configure --prefix=$HOME/local
#=> configure: error: "Could not find wx-config: is wxWidgets installed? is wx-config in your path?"
# ref. http://wiki.wxwidgets.org/Installing_and_configuring_under_Ubuntu
sudo aptitude install libwxgtk2.8-dev
./configure --prefix=$HOME/local
#=> configure: error: Audacity requires libsndfile to be enabled
sudo aptitude install libsndfile-dev
./configure --prefix=$HOME/local
#=> configure: error: Audacity requires expat to be enabled
sudo aptitude install libexpat-dev
./configure --prefix=$HOME/local
make
make install
