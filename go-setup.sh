sudo add-apt-repository -y ppa:ubuntu-lxc/lxd-stable
sudo apt-get update
sudo apt-get -y install golang

export GOPATH=$HOME/.go
export PATH=$HOME/.go/bin:$PATH
cat <<'EOS' >> ~/.bashrc
export GOPATH=$HOME/.go
export PATH=$HOME/.go/bin:$PATH
EOS

# ref. https://github.com/peco/peco#go-get
go get github.com/peco/peco/cmd/peco
