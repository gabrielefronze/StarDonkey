docker exec rucio-db-pool /bin/sh -c "/etc/pgpool2/init_scripts/turnkey.sh"
# docker exec rucio-db /bin/sh -c "/etc/rucio_config/init_scripts/turnkey.sh"
docker exec rucio-db-slave /bin/sh -c "/etc/rucio_config/init_scripts/turnkey.sh"
docker exec rucio-server /setup_database.py
