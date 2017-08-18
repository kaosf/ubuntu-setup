# install Node.js with nodebrew
# ref. https://github.com/hokaccha/nodebrew

# curl -L git.io/nodebrew | perl - setup
wget git.io/nodebrew -O - | perl - setup
echo 'export PATH=$HOME/.nodebrew/current/bin:$PATH' >> $HOME/.zshenv
echo 'export PATH=$HOME/.nodebrew/current/bin:$PATH' >> $HOME/.profile
export PATH=$HOME/.nodebrew/current/bin:$PATH

# nodebrew help
# nodebrew ls-all
nodebrew install-binary 8.4.0
nodebrew use latest
