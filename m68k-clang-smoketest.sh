#!/bin/sh

# ./usr/lib/m68k-linux-gnu/libc.so
# ./usr/lib/m68k-linux-gnu/libc.so.6
# ./usr/share/gdb/auto-load/lib/m68k-linux-gnu/libc.so.6-gdb.py

export PATH="/usr/lib/m68k-linux-gnu:${PATH}"
ln -s /usr/lib/m68k-linux-gnu/libc.so.6 /usr/lib/libc.so.1
./zero
EXITCODE=$? 
if [ $EXITCODE -ne 0 ]; 
then
    echo "Exit code was ${EXITCODE}, expected 0";
fi

./one
EXITCODE=$? 
if [ $EXITCODE -ne 1 ]; 
then
    echo "Exit code was ${EXITCODE}, expected 1";
fi

exit