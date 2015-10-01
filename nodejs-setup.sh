# install Node.js with nodebrew
# ref. https://github.com/hokaccha/nodebrew

# curl -L git.io/nodebrew | perl - setup
wget git.io/nodebrew -O - | perl - setup
echo 'export PATH=$HOME/.nodebrew/current/bin:$PATH' >> $HOME/.zshenv
export PATH=$HOME/.nodebrew/current/bin:$PATH

# nodebrew help
# nodebrew ls-all
nodebrew install-binary 0.12
nodebrew use latest

## install Node.js manually
#cd $HOME/local/src
#wget http://nodejs.org/dist/v0.10.21/node-v0.10.21.tar.gz
#tar xzf node-v0.10.21.tar.gz
#cd node-v0.10.21
#./configure --prefix=$HOME/local --dest-os=linux
#make
#make install
