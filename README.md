# StarDonkey

## Concept
This repository contains a turnkey version of the Rucio-based infrastructure that will be proposed as storage managing solution for the Virgo Gravitational Interferometer.

The infrastructure is implemented as a set of Docker containers and every configuration file needed for the deployement is (and will be) contained in this repository.

Each subfolder describes one of the provided containers, while at top level the `docker-compose.yml` and `docker-turnkey.sh` files fully describe the startup process to be executed in the host system.

The conceptual structure of the proposed infrastructure, without high availability and relibility solutions, is depicted in the following figure.

![StarDonkey concept](Concept.png?raw=true "StarDonkey concept")

## Database structure
The infrastructure implemented in this setup foresees several peculiar solutions concerning database handling, represented by the light blue box in previous figure.
The databases are implemented using `postgresql`.
A setup with an high throughput central database and many satellite replicas is put in place, thanks to a `pgpool` instance and the `postgresql`'s logical replication streamed by a container which is member of the `pgpool`.

The addition of new data (**write**) will be performed solely on the central HA database.
Concerning **reading** data, the  the central database will handle data queries executed by external agents and by small datacenters (DNS tunneling), while the biggest computing centers should be able to keep a local cache to reduce the pressure on the central database.

This approach will grant good database performance, while coherency will be relaxed since the propagation of data addition and deletion will be immediate only at the central database level.

The representation of this setup is reported in the following figure.

![Database structure](HADB.png?raw=true "Database structure")