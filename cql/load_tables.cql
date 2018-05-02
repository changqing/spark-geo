/*
  If you prefer to have the date in UTC format as default, set the TZ env variable to UTC
  TZ=UTC ../../apache-cassandra/bin/cqlsh
*/

TRUNCATE lbsn.events;
copy lbsn.events (uid, ts, lat, lon, vid) from './gowalla_events.nyc.csv' with DELIMITER='\t';

TRUNCATE lbsn.users;
copy lbsn.users (uid, id) from './gowalla_users.nyc.csv' with DELIMITER = '\t';

TRUNCATE lbsn.venues;
COPY lbsn.venues (vid,name,lat,lon) FROM './gowalla_venues.nyc.csv' with DELIMITER = '\t';