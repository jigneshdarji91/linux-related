#!/bin/bash

OLDIFS=$IFS
IFS='\\n'
X="$((find . -name '*.cpp' && find . -name '*.h') | grep -ri "$1")"
Y="$X"
echo -e $X | nl
IFS=$OLDIFS

read -p "Enter file number:" yn
re='^[0-9]+$'
if ! [[ $yn =~ $re ]] ; then
        echo "error: Not a number" >&2; exit 1
fi
file="$(echo -e $Y | cut -d ' ' -f $yn)"
echo $file
vi $file;
