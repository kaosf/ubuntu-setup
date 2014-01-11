# ref. http://golang.org/doc/install
wget http://go.googlecode.com/files/go1.1.2.linux-amd64.tar.gz
tar xzf go1.1.2.linux-amd64.tar.gz
mv go $HOME/.go
echo 'export GOROOT=$HOME/.go' >> .zshenv
echo 'export PATH=$PATH:$GOROOT/bin' >> .zshenv
echo 'export GOPATH=$HOME/.gocode' >> .zshenv
echo 'export PATH=$HOME/.gocode/bin:$PATH' >> $HOME/.zshenv
source $HOME/.zshrc

# ref. https://github.com/heroku/hk
# Mercurial ("hg" command) is required
sudo aptitude install mercurial
go get github.com/heroku/hk
echo 'machine api.heroku.com login <email> password <password>' > $HOME/.netrc
chmod 600 $HOME/.netrc
