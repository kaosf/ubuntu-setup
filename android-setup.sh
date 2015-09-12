# Prerequesite
# Install OpenJDK 7
# ref. java-setup.sh

# Download android-sdk
[ -d $HOME/local ] || mkdir $HOME/local
cd $HOME/local
wget http://dl.google.com/android/android-sdk_r24.2-linux.tgz
tar xf android-sdk_r24.2-linux.tgz
rm -f android-sdk_r24.2-linux.tgz

echo 'export ANDROID_HOME=$HOME/local/android-sdk-linux' >> $HOME/.zshenv
echo 'export PATH=$HOME/local/android-sdk-linux/tools:$PATH' >> $HOME/.zshenv
echo 'export PATH=$HOME/local/android-sdk-linux/platform-tools:$PATH' >> $HOME/.zshenv
echo 'export PATH=$HOME/local/android-sdk-linux/build-tools/22.0.1:$PATH' >> $HOME/.zshenv
export PATH=$HOME/local/android-sdk-linux/tools:$PATH
export PATH=$HOME/local/android-sdk-linux/platform-tools:$PATH
export PATH=$HOME/local/android-sdk-linux/build-tools/22.0.1:$PATH

# Install all Android SDKs
android update sdk --no-ui

# Install specified version Android Build tool
# ref. http://stackoverflow.com/questions/17963508/how-to-install-android-sdk-build-tools-on-the-command-line/19416222#19416222
android update sdk --no-ui --all --filter X
#android update sdk -u -a -t X
#android update sdk -u -a -t X,Y,Z

# Search "X" with following command;
android list sdk --no-ui --all

# Install all tools (CAUTION: It takes too long time for this)
android update sdk --no-ui --all

# Install dependent packages for 64bit
# ref.
#   http://qiita.com/nichijo/items/773403a4bac7180a26ab
#   http://kokufu.blogspot.jp/2014/09/aapt-no-such-file-or-directory.html
sudo apt-get -y install lib32stdc++6 lib32z1

## My minimal requirements for Android app building
#
# Android SDK Tools, revision x.y.z
# Android SDK Platform-tools, revision x.y.z
# Android SDK Build-tools, revision x.y.z
# SDK Platform Android x.y.z, API ww, revision v
# Android Support Repository, revision x
# Android Support Library, revision x.y.z
# Google Play services, revision x.y.z
