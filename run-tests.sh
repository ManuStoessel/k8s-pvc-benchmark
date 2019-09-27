#!/usr/bin/env bash

if [ -z "$1" ]; then
    echo "First parameter needs to specify fio config file!"
    exit 1
fi

if [ -z "$2" ]; then
    echo "Second parameter must specify mode: rbd or file"
    exit 1
elif [ "$2" == "file" ]
    fio $1
elif [ "$2" == "rbd" ]
    /opt/fio/toolbox.sh
    fio $1
fi

/opt/fio/sources/tools/plot/fio2gnuplot -t $NODENAME-$PODNAME.iops -i -g -p '*_iops*.log'
/opt/fio/sources/tools/plot/fio2gnuplot -t $NODENAME-$PODNAME.bandwidth -b -g -p '*_bw*.log'

python -m SimpleHTTPServer 8000