#!/usr/bin/bash
DESTDIR=$(realpath ~/.var/app/com.github.kholia.osx-kvm/)
if [[ ! -f ${DESTDIR}/osx-kvm/mac_hdd_ng.img ]]; then
    rm ${DESTDIR}/osx-kvm
    cp -r /app/osx-kvm ${DESTDIR}/osx-kvm
    cd ${DESTDIR}/osx-kvm
    echo "4" | ${DESTDIR}/osx-kvm/fetch-macOS-v2.py
    qemu-img convert BaseSystem.dmg -O raw BaseSystem.img
    qemu-img create -f qcow2 mac_hdd_ng.img 128G
fi
cd ${DESTDIR}/osx-kvm
./OpenCore-Boot.sh
