#!/bin/sh

if [ -z "$1" ]; then
    echo "[!] please pass the environment setup script on the commandline."
    exit 1
fi

if [ -z "${GOPATH}" ]; then
    echo "[!] GOPATH needs to be set."
    exit 1
fi

echo "[+] creating heroku app"
heroku create
. ./$1

if [ -z "${RSS_FEED}" ]; then
    echo "[!] please run the environment setup script first."
    echo "    the script won't work properly if the environment variables"
    echo "    aren't set."
    exit 1
fi

echo "[+] adding Go buildpack"
heroku config:add BUILDPACK_URL=git://github.com/kr/heroku-buildpack-go.git

echo "[+] adding Heroku-specifc to repository (Procfile and .godir)."
echo "web: $(basename $(pwd))" > Procfile
echo "${PWD##${GOPATH}/src}" > .godir
git add Procfile
git add .godir
git commit -m "Adding Heroku-specific deployment files." Procfile .godir

echo "[+] heroku setup complete. run 'git push heroku master' to deploy."
