# install Node.js with nodebrew
# ref. https://github.com/hokaccha/nodebrew

cat <<EOS >> $HOME/.zshenv
export PATH=\$HOME/.nodebrew/current/bin:\$PATH
export NODEBREW_ROOT=\$HOME/.linuxbrew/var/nodebrew
EOS

# nodebrew help
# nodebrew ls-all
nodebrew install-binary 0.10
nodebrew use latest

## install Node.js manually
#cd $HOME/local/src
#wget http://nodejs.org/dist/v0.10.21/node-v0.10.21.tar.gz
#tar xzf node-v0.10.21.tar.gz
#cd node-v0.10.21
#./configure --prefix=$HOME/local --dest-os=linux
#make
#make install
