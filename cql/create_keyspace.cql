/*
  If you prefer to have the date in UTC format as default, set the TZ env variable to UTC
  TZ=UTC ../../apache-cassandra-2.1.7/bin/cqlsh
*/

DROP KEYSPACE IF EXISTS lbsn;

CREATE KEYSPACE IF NOT EXISTS lbsn 
WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 1};

USE lbsn;

CREATE TABLE lbsn.events (
  uid     bigint,
  ts      timestamp,
  lat     double,
  lon     double,
  vid     bigint,
  PRIMARY KEY (uid, ts)
) WITH CLUSTERING ORDER BY (ts DESC);

CREATE TABLE lbsn.users (
  uid     bigint,
  id      bigint,
  PRIMARY KEY (uid, id)
);

CREATE TABLE lbsn.venues (
  vid   bigint, 
  name  text,
  lat   double,
  lon   double,
  PRIMARY KEY (vid)
);
