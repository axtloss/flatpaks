#!/usr/bin/bash
if [[ ! -d /dev/binderfs ]]; then
    /app/bin/setup-binder
fi
sudo podman run -itd --rm --privileged -v ~/data:/data -p 5555:5555 docker.io/redroid/redroid:13.0.0-amd64 androidboot.use_memfd=true
adb connect localhost:5555 2>&1 && adb connect localhost:5555
scrcpy -s localhost:5555 2>&1 && scrcpy -s localhost:5555

