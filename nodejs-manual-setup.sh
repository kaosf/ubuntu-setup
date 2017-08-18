if [ -z $1 ]; then
  VERSION=8.4.0
else
  VERSION=$1
fi
mkdir -p $HOME/local/src
cd $HOME/local/src
wget http://nodejs.org/dist/v${VERSION}/node-v${VERSION}.tar.gz || exit 1
tar xf node-v${VERSION}.tar.gz
rm node-v${VERSION}.tar.gz
cd node-v${VERSION}
./configure --prefix=$HOME/local --dest-os=linux
make
make install
