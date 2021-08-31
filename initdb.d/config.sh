#!/bin/bash

psql -v ON_ERROR_STOP=1 --username postgres --dbname postgres <<-EOSQL
    ALTER SYSTEM SET wal_level = logical;
    ALTER SYSTEM SET log_line_prefix = '%m [%p] %q[user=%u,db=%d,app=%a] ';
    ALTER SYSTEM SET log_statement = 'all';
    CREATE DATABASE destination;
EOSQL

