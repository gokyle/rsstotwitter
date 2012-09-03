#!/bin/sh

find . -iname \*.go -exec tools/custom.sh '{}' \;
