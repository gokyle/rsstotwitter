create role rsstotwitter
        login 
        password '';
create database rsstotwitter 
                ENCODING = 'UTF8' 
                LC_COLLATE = 'en_US.UTF-8' 
                LC_CTYPE = 'en_US.UTF-8' 
                template = template0;
ALTER DATABASE rsstotwitter OWNER TO rsstotwitter ;
\connect rsstotwitter 
create table posted (guid text unique not null, 
                     posted boolean default false not null);
create index posted_idx on posted (guid);
