# Prerequesite
# Install OpenJDK 7
# ref. java-setup.sh

# Download android-sdk
if [ ! -d $HOME/local ]
then
  mkdir $HOME/local
fi
cd $HOME/local
wget http://dl.google.com/android/android-sdk_r22.6.2-linux.tgz
tar xf android-sdk_r22.6.2-linux.tgz

echo 'export PATH=$HOME/local/android-sdk-linux/tools:$PATH' >> $HOME/.zshenv
echo 'export PATH=$HOME/local/android-sdk-linux/build-tools/19.0.3:$PATH' >> $HOME/.zshenv
export PATH=$HOME/local/android-sdk-linux/tools:$PATH
export PATH=$HOME/local/android-sdk-linux/build-tools/19.0.3:$PATH

# Install all Android SDKs
android update sdk --no-ui

# Install dependent packages
# ref. http://blog.sola-dolphin-1.net/archives/4633272.html
sudo apt-get install git-core gnupg flex bison gperf build-essential zip curl zlib1g-dev libc6-dev lib32ncurses5-dev lib32z1 x11proto-core-dev libx11-dev lib32readline-gplv2-dev lib32z-dev libgl1-mesa-dev g++-multilib mingw32 tofrodos python-markdown libxml2-utils python-software-properties xsltproc libx11-dev:i386
