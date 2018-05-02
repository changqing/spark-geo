#!/bin/sh

/usr/bin/cqlsh --debug -f create_keyspace.cql
/usr/bin/cqlsh --debug -f load_tables.cql

