FROM ubuntu:18.04

RUN apt-get update -y && \
    apt-get install -y fio git gnuplot python-six && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /opt/fio && \
    git clone https://github.com/axboe/fio.git /opt/fio/sources && \
    chmod +x -R /opt/fio/sources/tools

WORKDIR /opt/fio

ADD run-tests.sh /opt/fio/run-tests
RUN chmod +x /opt/fio/run-tests

ADD config.fio /opt/fio/config.fio

ENTRYPOINT [ "./run-tests" ]
CMD [ "config.fio" ]