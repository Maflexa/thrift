#
# isocket-thrift Dockerfile
#
# https://github.com/isocket/thrift
#

FROM dockerfile/ubuntu

# install dependencies
RUN apt-get update
RUN apt-get install build-essential libboost-dev libboost-test-dev libboost-program-options-dev libevent-dev automake libtool flex bison pkg-config g++ libssl-dev curl -y

# install thrift
ADD . /src
RUN cd /src && ./bootstrap.sh && ./configure --without-ruby --without-python
RUN cd /src && make && make install
