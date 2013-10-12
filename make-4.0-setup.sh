# ref. http://www.gnu.org/software/make/

cd $HOME/local/src
wget http://ftp.gnu.org/gnu/make/make-4.0.tar.gz
tar xzf make-4.0.tar.gz
cd make-4.0
./configure --prefix=$HOME/local
make
make install
