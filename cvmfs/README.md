# CVMFS layer for Virgo
This folder contains a working containerized installation of CVMFS aimed at providing a software distribution layer for the Virgo collaboration.

This work is based on several previous efforts, even if running the CVMFS server (stratum0 and stratum1) in a container was found to be poorly documented.

The setup is well described by the `docker-compose.yml` file, and includes a stratum-0 container (meant to be the place to push new data), a stratum-1 container (a replica, meant to be installed in satellite data centers) and a client container.

Every layer of the setup can be "hidden" behind a squid proxy with ease, granting HA and load balancing capabilities.

## Common settings
The procedure described below spawns three containers whose environment will be set up using the `cvmfs-variables.env` environtment file. Each container is provided of an init script placed in `/etc/cvmfs-init-scripts` that sets up the local cvmfs server/client according to the settings propagated via the `cvmfs-variables.env` file.

## Running the containers
### **Using docker-compose (single host)**
To run the three containers locally on a single host (for testing and development purposes) is it enough to run the following command:

```docker-compose --file docker-compose.yml up -d```

### **Using docker run (multi host)**
Three `Dockerrun.sh` scripts are provided, one for each container.
Their aim is to encapsulate a docker run command equivalent to the one triggered by docker-compose.
Running each command on a different host (given the `cvmfs-variables.env` file is edited accordingly) allows to deploy the infrastructure in a production setup.

## Networking requirements
In a multi-host setup the stratum-0 instance and the stratum-1 instances require the hosting machines to have a mutually reachable IP address on which two TCP ports are opened: 80 and 8000.

This means that if the machines are inside a LAN it should be enough to make their IP address static (or covered by a DDNS, while if the interconnection happens via internet a public IP address should be foreseen.

Note that additional ports might be opened, for example to provide ssh access.

## Technical recommendations
The block device the stratum-0 `/cvmfs` directory should physically reside has to be enabled with redoundancy and fault resilience.
At least a RAID1 volume is highly recommended.

In order to better protect the whole setup against (hardware) failures it is recommended to place the physical volume on a device which is external to the stratum-0 host and mounted on the stratum-0 host in order to be passed to the stratum-0 container itself.

While the stratum-0 storage requires some fault tolerance and recovery capabilities the stratum-1 one is less critical, since in the event of a catastrophical failure the whole stratum-1 can be re-synchronized with the stratum-0 from scratch.

## Public keys distribution
The access rights both to the stratum-0 from the stratum-1, and from the clients to the stratum-1 itself, are granted via a public key exchange. The set of private+public keys is generated at the repository creation.

The previous setup works if and only if the public keys generated at the creation of the repository on the stratum-0 get distributed towards the stratum-1 and client containers.

After the execution of the stratum-0 init script, the public keys will be found at the path `/etc/cvmfs/keys/<repo_name>.pub`.
This file has to be copied to the stratum-1 and client (in the same path, according to the `cvmfs-variables.env` file) in order to allow acces to the stratum-0 repository.

The `propagate-keys.sh` script is able to handle such task in the **single host** setup.
To propagate the same procedure in a multi-host setup, omologous commands have to be executed on different machines.