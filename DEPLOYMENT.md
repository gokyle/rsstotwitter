# Deployment Instructions

## Environment Variables
The `environ.sh` file contains a template for the relevant environment 
variables. You should copy it to a new file to ensure secrets don't leak
into your Git repository.

These variables are:

### Database
* `PG_DBNAME`
* `PG_USER`
* `PG_PASS`
* `PG_HOST`
* `PG_PORT`
* `PG_SSLMODE`

### Twitter
Create an application on [Twitter](https://dev.twitter.com) and generate the
OAuth keys from the web interface. Copy those keys into the config script.
These correspond to the consumer key, consumer secret, access token, and
access secret.
* `TW_CKEY`
* `TW_CSEC`
* `TW_ATOK`
* `TW_ASEC`

### Feed
* `RSS_FEED` should specify the RSS feed to follow.

### Optional: Mail
* `MAIL_SERVER`
* `MAIL_USER`
* `MAIL_PASS`
* `MAIL_ADDRESS`
* `MAIL_PORT`
* `MAIL_TO`

### Optional: Pushover
See the [Pushover](https://www.pushover.net) to register an application and
get a user key.
* `PO_APIKEY`
* `PO_USER`

## Heroku
`rsstotwitter` uses the Heroku Go buildpack, which so far runs pretty smoothly;
setting up the deployment to Heroku was pretty easy and very
[straightforward](https://gist.github.com/299535bbf56bf3016cba).

You'll need the [Heroku toolbelt](https://toolbelt.heroku.com/), particularly
if you want to use the environment setup shell script. There is an included
`heroku_setup.sh` script to automate the process.

## Database
The database expects a table `posted` with two columns: `guid` and `posted`.

Example database setup code:
```sql
create role ${PG_USER}
        login 
        password '${PG_PASS}';
create database ${PG_DBNAME} 
                ENCODING = 'UTF8' 
                LC_COLLATE = 'en_US.UTF-8' 
                LC_CTYPE = 'en_US.UTF-8' 
                template = template0;
ALTER DATABASE ${PG_DBNAME} OWNER TO ${PG_USER} ;
\connect ${PG_DBNAME}
create table posted (guid text unique not null, 
                     posted boolean default false not null);
create index posted_idx on posted;
```


