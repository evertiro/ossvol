#!/bin/bash

if [[ $UID -ne 0 ]]; then
    echo "ossvol installer must be run as root!"
    exit 1
fi

PREFIX=/usr/bin
if [[ "$1" =~ ^--prefix=.+ ]]; then
    PREFIX=$(echo $1 | cut -d = -f 2)
    PREFIX=${PREFIX:-/usr/bin}
fi

install -v -d $PREFIX/
install -v -m 755 ossvol $PREFIX/

echo
echo "ossvol 0.22 has been installed in $PREFIX"
