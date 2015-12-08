# install Node.js with nodebrew
# ref. https://github.com/hokaccha/nodebrew

# curl -L git.io/nodebrew | perl - setup
wget git.io/nodebrew -O - | perl - setup
echo 'export PATH=$HOME/.nodebrew/current/bin:$PATH' >> $HOME/.zshenv
echo 'export PATH=$HOME/.nodebrew/current/bin:$PATH' >> $HOME/.profile
export PATH=$HOME/.nodebrew/current/bin:$PATH

# nodebrew help
# nodebrew ls-all
nodebrew install-binary 5.1.1
nodebrew use latest

## install Node.js manually
#cd $HOME/local/src
#wget http://nodejs.org/dist/v5.5.1/node-v5.1.1.tar.gz
#tar xzf node-v5.1.1.tar.gz
#cd node-v5.1.1
#./configure --prefix=$HOME/local --dest-os=linux
#make
#make install
