#!/bin/sh

if [ -z "${RSS_FEED}" ]; then
    echo "[!] please run the environment setup script first."
    echo "    the script won't work properly if the environment variables"
    echo "    aren't set."
    exit 1
fi

if [ -z "${GOPATH}" ]; then
    echo "[!] GOPATH needs to set."
    exit 1
fi

echo "[+] creating heroku app"
heroku create

echo "[+] adding Go buildpack"
heroku config:add BUILDPACK_URL=git://github.com/kr/heroku-buildpack-go.git

echo "[+] adding Heroku-specifc to repository (Procfile and .godir)."
echo "web: $(basename $(pwd))" > Procfile
echo "${PWD##${GOPATH}/src}" > .godir
git add Procfile
git add .godir
git commit -m "Adding Heroku-specific deployment files." Procfile .godir

echo "[+] heroku setup complete. run 'git push heroku master' to deploy."
