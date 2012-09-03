#!/bin/sh

    cp $1 $1.tmp
    package="${PWD##${GOPATH}/src/}"
    echo "[+] package $package for $1"
    cat $1.tmp | sed -e "s|github.com/gokyle/rsstotwitter|${package}|g" > $1
    rm $1.tmp
