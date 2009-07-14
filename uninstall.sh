#!/bin/bash

if [[ $UID -ne 0 ]]; then
    echo "ossvol uninstaller must be run as root!"
    exit 1
fi

PREFIX=/usr/bin
if [[ "$1" =~ ^--prefix=.+ ]]; then
    PREFIX=$(echo $1 | cut -d = -f 2)
    PREFIX=${PREFIX:-/usr/bin}
fi

if [ ! -f $PREFIX/ossvol ]; then

    echo "ossvol does not seem to be installed in $PREFIX. If you have
previously installed bashrun under a prefix other than $PREFIX,
please use the --prefix option to specify it.
"
    exit 1
fi

rm -v $PREFIX/ossvol

echo
echo "ossvol 0.22 has been uninstalled from $PREFIX"
