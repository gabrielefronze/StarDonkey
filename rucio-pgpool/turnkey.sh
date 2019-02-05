PGPASSWORD=pippo123 psql -U postgres postgres < /etc/pgpool2/init_scripts/create-rucio-database.sql
PGPASSWORD=pippo123 psql -U postgres postgres < /etc/pgpool2/init_scripts/create-publication.sql
