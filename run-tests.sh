#!/usr/bin/env bash

if [ -z "$FIO_TEST_PATH" ]
then
    FIO_TEST_PATH="/fio-data"
fi

if [ -z "$FIO_CONF_FILE" ]
then
    FIO_CONF_FILE="/config.fio"
fi

sed -i s@___FIO_DATA_DIR___@"$FIO_TEST_PATH"@ $FIO_CONF_FILE

fio $FIO_CONF_FILE | tee $FIO_TEST_PATH/fio-results.txt