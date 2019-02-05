su - postgres -c "psql postgres < /etc/rucio_config/init_scripts/create-rucio-database.sql"
su - postgres -c "psql postgres < /etc/rucio_config/init_scripts/create-publication.sql"
