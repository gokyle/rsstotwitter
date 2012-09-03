package frontend

import (
	"fmt"
	"github.com/gokyle/rsstotwitter/bot"
	"github.com/gokyle/rsstotwitter/dbase"
	"net/http"
)

func rootPage(w http.ResponseWriter, req *http.Request) {
        db, err := dbase.ConnectFromEnv()
        stats := ""
        page := ""

        if err == nil {
                stats += "stats\n=====\n"
                stats += "last tweet: " + bot.LastUpdate()
	        stats += fmt.Sprintf("\nstories posted: %d\n", dbase.CountStories(db))
        } else {
                stats += "couldn't connect to database: " + err.Error()
        }

        page += stats
	fmt.Fprintln(w, page)
}
