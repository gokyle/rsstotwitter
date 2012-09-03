package frontend

import (
	"fmt"
	"github.com/gokyle/rsstotwitter/bot"
	"github.com/gokyle/rsstotwitter/dbase"
	"net/http"
)

func rootPage(w http.ResponseWriter, req *http.Request) {
        db, err := lobsterdb.ConnectFromEnv()
        stats := ""

        if err == nil {
                stats += "stats\n=====\n"
                stats += "last tweet: " + bot.LastUpdate()
	        stats += fmt.Sprintf("\nstories posted: %d\n", lobsterdb.CountStories(db))
        } else {
                stats += "couldn't connect to database: " + err.Error()
        }

	page := "twitter account: @lobsternews\n"
	page += "git repo: git clone git://github.com/gokyle/rsstotwitter.git\n"
	page += "github page: http://gokyle.github.com/rsstotwitter/\n\n"
        page += stats
	fmt.Fprintln(w, page)
}
