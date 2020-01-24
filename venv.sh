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


if [ ! -d "venv" ]; then
    uname_out="$(uname -s)"
    is_linux=
    case "$uname_out" in
        Linux*)     sudo apt update -y
                    sudo apt install -y python3 python3-pip virtualenv curl libcap-dev shellcheck
                    is_linux=1
                    ;;
        Darwin*)    brew install python3 || true
                    brew install curl || true
                    brew install shellcheck || true
                    pip3 install virtualenv || true
                    curl -O https://bootstrap.pypa.io/get-pip.py
                    sudo python3 get-pip.py
                    ;;
        *)          echo "OS not supported"
                    exit 1
    esac

    python3 -m virtualenv -p python3 venv
fi	

venv/bin/pip install -r "$(dirname "$0")"/requirements.txt
