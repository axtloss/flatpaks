#!/usr/bin/bash
sudo modprobe binder_linux devices="binder,hwbinder,vndbinder"
sudo mkdir -p /dev/binderfs
sudo mount -t binder binder /dev/binderfs
sudo ln -s /dev/binderfs/binder /dev/binder
sudo ln -s /dev/binderfs/hwbinder /dev/hwbinder
sudo ln -s /dev/binderfs/vndbinder /dev/vndbinder
sudo ln -s /dev/binderfs/binder-control /dev/binder-control
