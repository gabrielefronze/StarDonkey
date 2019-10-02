#! /bin/bash
echo "=================================================================================="
# Propagate common rucio config files
echo -n "Propagating rucio configuration files... "
./rucio-common-cfg/propagate-config.sh
echo "done"
echo "----------------------------------------------------------------------------------"

# Propagate custom CA certificates for self signed FTS3 server connectivity
echo -n "Propagating self signed certificates... "
cp -f ./CA-stuff/rucio-fts3.crt.pem ./rucio-fts3
cp -f ./CA-stuff/rucio-fts3.key.pem ./rucio-fts3
cp -f ./CA-stuff/stardonkey-CA.crt ./rucio-fts3
echo "done"
echo "----------------------------------------------------------------------------------"

# Build the (missing) containers
echo -n "Building missing containers... "
docker-compose build
echo "done"
echo "----------------------------------------------------------------------------------"

# Run everything in background mode
echo -n "Running containers... "
docker-compose up -d
echo "done"
echo "----------------------------------------------------------------------------------"

# Create the database structure from the rucio-server container
echo -n "Setting up database... "
docker exec rucio-server python /rucio-scripts/setup_database.py
echo "done"
echo "----------------------------------------------------------------------------------"

# Create basic set of rucio accounts
echo -n "Creating standard accounts... "
docker exec rucio-server python /rucio-scripts/setup_accounts.py
echo "done"
echo "----------------------------------------------------------------------------------"

# Renew FTS proxy delegation
echo -n "Renewing FTS delegation... "
docker exec rucio-fts-proxy-delegator python /delegatorchron.py
echo "done"
echo "----------------------------------------------------------------------------------"

# Propagate x509 proxy
echo -n "propagating FTS proxy certificate... "
docker exec rucio-fts-proxy-delegator cp /tmp/x509_u0 /tmp/fts-voms-proxy
docker exec rucio-client cp /tmp/fts-voms-proxy/x509_u0 /tmp
docker exec rucio-server cp /tmp/fts-voms-proxy/x509_u0 /tmp
echo "done"
echo "----------------------------------------------------------------------------------"

# Run rucio-conveyor-submitter daemon on rucio-server
echo -n "Running rucio conveyor daemon... "
docker exec rucio-server touch /var/logs/rucio/daemons/conveyor.log
docker exec --detach rucio-server rucio-conveyor-submitter --total-threads 2 > /var/logs/rucio/daemons/conveyor.log &
echo "done"
echo "=================================================================================="