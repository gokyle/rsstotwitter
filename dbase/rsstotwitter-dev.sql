-- uses default username and database, i.e. kyle@kyle
create table posted (guid text unique not null, 
                     posted boolean default false not null);
create index posted_idx on posted (guid);
