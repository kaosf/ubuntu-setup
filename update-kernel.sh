# http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.19.3-vivid/
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.19.3-vivid/linux-headers-3.19.3-031903_3.19.3-031903.201503261036_all.deb
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.19.3-vivid/linux-headers-3.19.3-031903-generic_3.19.3-031903.201503261036_amd64.deb
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.19.3-vivid/linux-image-3.19.3-031903-generic_3.19.3-031903.201503261036_amd64.deb

# http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.0-vivid/
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.0-vivid/linux-headers-4.0.0-040000-generic_4.0.0-040000.201504121935_amd64.deb
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.0-vivid/linux-headers-4.0.0-040000_4.0.0-040000.201504121935_all.deb
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.0-vivid/linux-image-4.0.0-040000-generic_4.0.0-040000.201504121935_amd64.deb

sudo dpkg -i *.deb

# ref.
#   https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1417263
#   https://wiki.ubuntu.com/Kernel/MainlineBuilds?action=show&redirect=KernelMainlineBuilds
