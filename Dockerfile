FROM ubuntu:18.04

RUN apt-get update -y && \
    apt-get install -y fio && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ADD run-tests.sh /run-tests.sh
ADD config.fio /config.fio

ENTRYPOINT [ "run-tests.sh" ]