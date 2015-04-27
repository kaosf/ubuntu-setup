sudo add-apt-repository ppa:klaus-vormweg/awesome
sudo apt-get update
sudo apt-get install awesome

# Default configuration files
mkdir -p $HOME/.config/awesome
cp /etc/xdg/awesome/rc.lua $HOME/.config/awesome
# Default theme: /usr/share/awesome/themes/default/theme.lua

# ref.
#   http://tanitta.hatenablog.com/entry/2014/11/25/010006
#   http://projects.tsuntsun.net/~nabeken/diary/Awesome/tutorial-1.html
#   http://awesome.naquadah.org/wiki/Awesome_3_configuration
#   http://zentoo.hatenablog.com/entry/20100223/1266951112
