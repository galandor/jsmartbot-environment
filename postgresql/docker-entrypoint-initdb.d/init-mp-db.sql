ALTER SYSTEM SET max_connections = 24;
-- ALTER SYSTEM SET log_statement = 'all';
ALTER SYSTEM SET synchronous_commit = 'off'; -- https://postgrespro.ru/docs/postgrespro/9.5/runtime-config-wal.html#GUC-SYNCHRONOUS-COMMIT
-- ALTER SYSTEM SET shared_buffers='512MB';
ALTER SYSTEM SET fsync=FALSE;
ALTER SYSTEM SET full_page_writes=FALSE;
ALTER SYSTEM SET commit_delay=100000;
ALTER SYSTEM SET commit_siblings=10;
-- ALTER SYSTEM SET work_mem='50MB';

create user galandor with password 'qwerty';
create database jsmartbot with owner galandor;
\connect jsmartbot;

create extension if not exists "uuid-ossp" schema pg_catalog;
create extension if not exists "hstore" schema pg_catalog;

-- connect as user galandor -- it makes mp owner all created tables, sequiences, ...etc
\connect jsmartbot;

create schema bot;
grant all privileges on                  schema bot to galandor;
grant all privileges on all tables    in schema bot to galandor;
grant all privileges on all sequences in schema bot to galandor;
