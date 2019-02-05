CREATE SUBSCRIPTION rucio_subscription CONNECTION 'host=rucio-db-streamer port=5432 password=rucio777 user=rucioreplicant dbname=postgres' PUBLICATION rucio_publication;
