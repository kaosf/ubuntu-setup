# ref. http://golang.org/doc/install
VERSION=1.4.2
wget http://golang.org/dl/go${VERSION}.linux-amd64.tar.gz
tar xzf go${VERSION}.linux-amd64.tar.gz
mv go $HOME/.go
echo 'export GOROOT=$HOME/.go' >> $HOME/.zshenv
echo 'export PATH=$PATH:$GOROOT/bin' >> $HOME/.zshenv
echo 'export GOPATH=$HOME/.gocode' >> $HOME/.zshenv
echo 'export PATH=$HOME/.gocode/bin:$PATH' >> $HOME/.zshenv
echo 'export GOROOT=$HOME/.go' >> $HOME/.profile
echo 'export PATH=$PATH:$GOROOT/bin' >> $HOME/.profile
echo 'export GOPATH=$HOME/.gocode' >> $HOME/.profile
echo 'export PATH=$HOME/.gocode/bin:$PATH' >> $HOME/.profile
export GOROOT=$HOME/.go
export PATH=$PATH:$GOROOT/bin
export GOPATH=$HOME/.gocode
export PATH=$HOME/.gocode/bin:$PATH
rm -f go${VERSION}.linux-amd64.tar.gz

# ref. https://github.com/heroku/hk#mac-os-x-linux-bsd
L=$HOME/local/bin/hk && curl -sL -A "`uname -sp`" https://hk.heroku.com/hk.gz | zcat >$L && chmod +x $L

# ref. https://github.com/peco/peco#go-get
go get github.com/peco/peco/cmd/peco
