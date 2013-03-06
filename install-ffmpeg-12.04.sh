# ref. http://ffmpeg.org/trac/ffmpeg/wiki/UbuntuCompilationGuide

### Preparation

sudo aptitude purge ffmpeg x264 libav-tools libvpx-dev libx264-dev yasm
sudo aptitude update
sudo aptitude install autoconf automake build-essential checkinstall git libass-dev libfaac-dev \
  libgpac-dev libmp3lame-dev libopencore-amrnb-dev libopencore-amrwb-dev librtmp-dev libspeex-dev \
    libtheora-dev libtool libvorbis-dev pkg-config texi2html zlib1g-dev

### Installation

## Yasm

cd $HOME/local/src
wget http://www.tortall.net/projects/yasm/releases/yasm-1.2.0.tar.gz
tar xzvf yasm-1.2.0.tar.gz
cd yasm-1.2.0
./configure
make
sudo checkinstall --pkgname=yasm --pkgversion="1.2.0" --backup=no \
  --deldoc=yes --fstrans=no --default
# sudo dpkg -r yasm # to uninstall

## x264

cd $HOME/local/src
git clone --depth 1 git://git.videolan.org/x264.git
cd x264
./configure --enable-static
make
sudo checkinstall --pkgname=x264 --pkgversion="3:$(./version.sh | \
  awk -F'[" ]' '/POINT/{print $4"+git"$5}')" --backup=no --deldoc=yes \
  --fstrans=no --default
# sudo dpkg -r x264 # to uninstall

## fdk-aac

cd $HOME/local/src
git clone --depth 1 git://github.com/mstorsjo/fdk-aac.git
cd fdk-aac
autoreconf -fiv
./configure --disable-shared
make
sudo checkinstall --pkgname=fdk-aac --pkgversion="$(date +%Y%m%d%H%M)-git" --backup=no \
  --deldoc=yes --fstrans=no --default
# sudo dpkg -r fdk-aac # to uninstall

## libvpx

cd $HOME/local/src
git clone --depth 1 http://git.chromium.org/webm/libvpx.git
cd libvpx
./configure --disable-examples --disable-unit-tests
make
sudo checkinstall --pkgname=libvpx --pkgversion="1:$(date +%Y%m%d%H%M)-git" --backup=no \
  --deldoc=yes --fstrans=no --default
# sudo dpkg -r libvpx # to uninstall

## opus (optional)

cd $HOME/local/src
git clone --depth 1 git://git.xiph.org/opus.git
cd opus
./autogen.sh
./configure --disable-shared
make
sudo checkinstall --pkgname=libopus --pkgversion="$(date +%Y%m%d%H%M)-git" --backup=no \
  --deldoc=yes --fstrans=no --default
# sudo dpkg -r libopus # to uninstall

## FFmpeg

cd $HOME/local/src
git clone --depth 1 git://source.ffmpeg.org/ffmpeg
cd ffmpeg
# omit --enable-x11grab
# add --enable-libopus
./configure --enable-gpl --enable-libass --enable-libfaac --enable-libfdk-aac --enable-libmp3lame \
  --enable-libopencore-amrnb --enable-libopencore-amrwb --enable-libspeex --enable-librtmp --enable-libtheora \
  --enable-libvorbis --enable-libvpx --enable-libx264 --enable-nonfree --enable-version3 \
  --enable-libopus
make
sudo checkinstall --pkgname=ffmpeg --pkgversion="7:$(date +%Y%m%d%H%M)-git" --backup=no \
  --deldoc=yes --fstrans=no --default
hash -r
# sudo dpkg -r ffmpeg # to uninstall

### Optional Installation

## qt-faststart

cd $HOME/local/src/ffmpeg
make tools/qt-faststart
sudo checkinstall --pkgname=qt-faststart --pkgversion="$(date +%Y%m%d%H%M)-git" --backup=no \
  --deldoc=yes --fstrans=no --default install -Dm755 tools/qt-faststart \
  /usr/local/bin/qt-faststart
# sudo dpkg -r qt-faststart # to uninstall
