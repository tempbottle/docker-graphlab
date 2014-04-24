FROM ubuntu:precise
MAINTAINER joshjdevl < joshjdevl [at] gmail {dot} com>

RUN apt-get update && apt-get -y install python-software-properties software-properties-common

RUN apt-get -y install wget
RUN apt-get update
RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN /usr/sbin/sshd
RUN echo "root:josh" | chpasswd

RUN apt-get -y install gcc g++ build-essential libopenmpi-dev openmpi-bin default-jdk cmake zlib1g-dev git

RUN mkdir /graphlab && git clone https://github.com/graphlab-code/graphlab.git
RUN cd /graphlab && ./configure
RUN cd /graphlab/release && make -j 2
RUN cd /graphlab/release && make install
RUN apt-get -y install python-dev python-pip
RUN pip install GraphLab-Create
