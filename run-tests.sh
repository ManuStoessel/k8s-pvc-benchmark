#!/usr/bin/env bash

if [ -z "$1" ]; then
    echo "First parameter needs to specify fio config file!"
    exit 1
fi

fio $1 --output=fio.output

/fio/tools/fio2gnuplot -t $NODENAME-$PODNAME.iops -i -g -p '*_iops*.log'
/fio/tools/fio2gnuplot -t $NODENAME-$PODNAME.bandwidth -b -g -p '*_bw*.log'

python -m SimpleHTTPServer 8000