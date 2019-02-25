FROM slidspitfire/cvmfs-stratum1-latest:latest
MAINTAINER Gabriele Gaetano Fronzé "gfronze@cern.ch"

USER root
ENV USER root
ENV HOME /root

RUN cvmfs_server add-replica cvmfs-stratum0
RUN cvmfs_server snapshot
