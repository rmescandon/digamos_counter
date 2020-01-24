#!/bin/sh -e
#
# Copyright (C) 2020 Roberto Mier Escandon <rmescandon@gmail.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 3 as
# published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

if [ -z "$VIRTUAL_ENV" ]; then
    [ -d "$(dirname "$0")/venv" ] || (cd "$(dirname "$0")" && ./venv.sh) 
    . venv/bin/activate
fi

workdir="$(pwd)"
tmpdir="$(mktemp -d)"

# Install requirements
sudo apt-get install python-pyaudio python3-pyaudio sox libpcre3 libpcre3-dev libatlas-base-dev
pip install pyaudio

# Download swig and compile
cd "$tmpdir"
wget -O swig-3.0.10.tar.gz https://sourceforge.net/projects/swig/files/swig/swig-3.0.10/swig-3.0.10.tar.gz/download?use_mirror=netix
tar -xvzf swig-3.0.10.tar.gz
cd swig-3.0.10/
./configure --prefix=/usr --without-clisp --without-maximum-compile-warnings
make
sudo make install
sudo install -v -m755 -d /usr/share/doc/swig-3.0.10
sudo cp -v -R Doc/* /usr/share/doc/swig-3.0.10
cd ..

# Download and compile snowboy
git clone https://github.com/Kitt-AI/snowboy
cd snowboy/swig/Python3
make

# # Fix snowboydecoder
# cd "$tmpdir"
# sed -i 's/from . import snowboydetect/import snowboydetect/' snowboy/examples/Python3/snowboydecoder.py

# Copy files to project
cp -rf "$tmpdir"/snowboy/swig/Python3/* "$workdir"
cp -rf "$tmpdir"/snowboy/resources "$workdir"
# cp -rf snowboy/examples/Python3/snowboydecoder.py "$workdir"

