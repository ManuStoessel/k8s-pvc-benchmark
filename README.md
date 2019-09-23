# k8s-pvc-benchmark

Uses the [fio](https://github.com/axboe/fio) block device benchmarking tool to benchmark a container attached storage volume.

There are two env variables used to configure the test script:

- FIO_CONF_FILE: Path to the fio configuration in which the tests themselves are specified in fio config format (default: /config.fio). The default points to a file included in the image that runs a test with four simultanious threads, two random reads, a random write and a random readwrite.
- FIO_TEST_PATH: The path in which the volume that is to be tested is mounted inside the container (default: /fio-data)