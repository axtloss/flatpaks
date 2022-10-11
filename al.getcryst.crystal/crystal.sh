#!/bin/bash
mkdir -p ~/.var/app/al.getcryst.crystal/rootfs
DESTDIR=$(realpath ~/.var/app/al.getcryst.crystal/rootfs)
if [[ ! -f ${DESTDIR}/etc/os-release ]]; then
    rm -rf  ${DESTDIR} || true
    mkdir -p ${DESTDIR}/{dev,sys,proc}
    cd ${DESTDIR}
    tar --exclude dev --exclude sys --exclude proc -xf /app/crystal.tar.gz
    chown ${USER} -R ${DESTDIR}/root.x86_64
    chmod 755 -R ${DESTDIR}/root.x86_64
    mv ${DESTDIR}/root.x86_64/* ${DESTDIR}
    rm -rf ${DESTDIR}root.x86_64
    cat /etc/resolv.conf > ${DESTDIR}/etc/resolv.conf
    echo "crystal" > ${DESTDIR}/etc/hostname
fi
if [[ $1 == "" ]]; then
    cmd="/bin/bash"
fi
exec env -i /app/bin/proot -r ${DESTDIR}/ -w / -0 -b /dev -b /sys -b /proc -b /run /bin/sh -c "
	export PULSE_SERVER=127.0.0.1
	export USER=root 
	. /etc/profile
	exec $cmd $@"
