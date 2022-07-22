#!/bin/bash

modprobe uio
modprobe uio_pci_generic
dpdk-hugepages.py -p 1G --setup 2G
ifconfig enp2s0 down
dpdk-devbind.py -b uio_pci_generic 02:00.0

