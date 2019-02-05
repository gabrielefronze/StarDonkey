FROM conda/miniconda3-centos7:latest

USER root

RUN yum -y update 

RUN yum -y groupinstall "Development Tools" "Development Libraries" 
RUN yum -y install epel-release && yum -y update && yum -y install python-pip python-setuptools python-wheel python-devel atlas atlas-devel lapack-devel blas-devel
RUN conda config --add channels conda-forge && conda install lalsuite
RUN conda install pycbc