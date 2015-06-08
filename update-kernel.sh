# http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.0-vivid/
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.0.4-wily/linux-headers-4.0.4-040004-generic_4.0.4-040004.201505171336_amd64.deb
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.0.4-wily/linux-headers-4.0.4-040004_4.0.4-040004.201505171336_all.deb
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.0.4-wily/linux-image-4.0.4-040004-generic_4.0.4-040004.201505171336_amd64.deb

sudo dpkg -i *.deb

# How to remove
dpkg -l | grep "linux\-[a-z]*\-"
#sudo apt-get remove KERNEL_PACKAGES_TO_REMOVE
sudo aptitude purge KERNEL_PACKAGES_TO_REMOVE

# ref.
#   https://wiki.ubuntu.com/Kernel/MainlineBuilds?action=show&redirect=KernelMainlineBuilds
