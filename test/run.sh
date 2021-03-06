#!/bin/bash

set -euxo pipefail


cd `dirname "$0"`

# Start vi in the cleanest possible way and only load the tests and the
# plugin directory.
#
# The `-e -s` and `2>&1` trickery is required for the output to be displayed
# correctly in environments without interactive tty, such as Travis CI.
vim -n -e -s -N -U NONE -i NONE -u <(cat << VIMRC
set rtp+=../
source ./vim-gh-line_test.vim
VIMRC) -c 'RunAllTests' 2>&1

