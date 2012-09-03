#!/bin/sh

add_env () {
        export $1=$2
        heroku config:add $1="$2"
}

echo "[+] configuring database"
add_env PG_DBNAME ""
add_env PG_USER ""
add_env PG_PASS ""
add_env PG_HOST ""
add_env PG_PORT ""
add_env PG_SSLMODE ""

echo "[+] configuring twitter"
add_env TW_CKEY ""
add_env TW_CSEC ""
add_env TW_ATOK ""
add_env TW_ASEC ""

echo "[+] configuring email"
add_env MAIL_SERVER ""
add_env MAIL_USER ""
add_env MAIL_PASS ""
add_env MAIL_ADDRESS ""
add_env MAIL_PORT ""
add_env MAIL_TO ""

echo "[+] configuring RSS feed"
add_env RSS_FEED ""

echo "[+] configuring pushover"
add_env PO_APIKEY ""
add_env PO_USER ""

