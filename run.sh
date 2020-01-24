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

# Always run in virtual environment. Create it if needed
if [ -z "$VIRTUAL_ENV" ]; then
    [ -d "$(dirname "$0")/venv" ] || (cd "$(dirname "$0")" && ./venv.sh) 
fi

"$(dirname "$0")"/venv/bin/python3 "$(dirname "$0")"/digamos_counter.py "$@"
