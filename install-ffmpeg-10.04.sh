# ref. http://ubuntuforums.org/showpost.php?p=9868359&postcount=1289
# step 1. remove current packages
sudo aptitude purge ffmpeg x264 libx264-dev yasm
# step 2. install packages
sudo aptitude install build-essential git-core checkinstall texi2html libfaac-dev libopencore-amrnb-dev libopencore-amrwb-dev libsdl1.2-dev libtheora-dev libvorbis-dev libx11-dev libxfixes-dev zlib1g-dev

# step 3. install Yasm
cd $HOME/local/src
wget http://www.tortall.net/projects/yasm/releases/yasm-1.2.0.tar.gz
tar xzf yasm-1.2.0.tar.gz
cd yasm-1.2.0
./configure
make
sudo checkinstall --pkgname=yasm --pkgversion="1.2.0" --backup=no --deldoc=yes --default

# step 4. install x264
cd $HOME/local/src
git clone git://git.videolan.org/x264
cd x264
./configure --enable-static
make
sudo checkinstall --pkgname=x264 --default --pkgversion="3:$(./version.sh | awk -F'[" ]' '/POINT/{print $4"+git"$5}')" --backup=no --deldoc=yes

# step 5. install LAME
sudo aptitude purge libmp3lame-dev
sudo aptitude install nasm
cd $HOME/local/src
wget http://downloads.sourceforge.net/project/lame/lame/3.99/lame-3.99.5.tar.gz
tar xzvf lame-3.99.5.tar.gz
cd lame-3.99.5
./configure --enable-nasm --disable-shared
make
sudo checkinstall --pkgname=lame-ffmpeg --pkgversion="3.99.5" --backup=no --default --deldoc=yes

# step 6. install libvpx
cd $HOME/local/src
git clone http://git.chromium.org/webm/libvpx.git
cd libvpx
./configure
make
sudo checkinstall --pkgname=libvpx --pkgversion="$(date +%Y%m%d%H%M)-git" --backup=no --default --deldoc=yes

# step 7. install FFmpeg
cd $HOME/local/src
git clone --depth 1 git://source.ffmpeg.org/ffmpeg
cd ffmpeg
./configure --enable-gpl --enable-libfaac --enable-libmp3lame --enable-libopencore-amrnb --enable-libopencore-amrwb --enable-libtheora --enable-libvorbis --enable-libvpx --enable-libx264 --enable-nonfree --enable-version3 --enable-x11grab
make
sudo checkinstall --pkgname=ffmpeg --pkgversion="5:$(./version.sh)" --backup=no --deldoc=yes --default
hash x264 ffmpeg ffplay ffprobe

# optional. install qt-faststart
cd $HOME/local/src/ffmpeg
make tools/qt-faststart
sudo checkinstall --pkgname=qt-faststart --pkgversion="$(./version.sh)" --backup=no --deldoc=yes --default install -Dm755 tools/qt-faststart /usr/local/bin/qt-faststart
