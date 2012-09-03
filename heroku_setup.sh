#!/bin/sh

if [ -z "${RSS_FEED}" ]; then
    echo "[!] please run the environment setup script first."
    echo "    the script won't work properly if the environment variables"
    echo "    aren't set."
fi

heroku create


