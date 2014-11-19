# Prerequesite
# Install OpenJDK 7
# ref. java-setup.sh

# Download android-sdk
if [ ! -d $HOME/local/opt ]
then
  mkdir $HOME/local/opt
fi
cd $HOME/local
wget http://dl.google.com/android/android-sdk_r23.0.2-linux.tgz
tar xf android-sdk_r23.0.2-linux.tgz

echo 'export ANDROID_HOME=$HOME/local/android-sdk-linux' >> $HOME/.zshenv
echo 'export PATH=$HOME/local/android-sdk-linux/tools:$PATH' >> $HOME/.zshenv
echo 'export PATH=$HOME/local/android-sdk-linux/platform-tools:$PATH' >> $HOME/.zshenv
echo 'export PATH=$HOME/local/android-sdk-linux/build-tools/19.1.0:$PATH' >> $HOME/.zshenv
export PATH=$HOME/local/android-sdk-linux/tools:$PATH
export PATH=$HOME/local/android-sdk-linux/platform-tools:$PATH
export PATH=$HOME/local/android-sdk-linux/build-tools/19.1.0:$PATH

# Install all Android SDKs
android update sdk --no-ui

# Install dependent packages for 64bit
# ref. http://qiita.com/nichijo/items/773403a4bac7180a26ab
sudo apt-get install lib32stdc++6 lib32z1
