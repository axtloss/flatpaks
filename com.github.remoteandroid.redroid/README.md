# [redroid/remote-android](https://github.com/remote-android)
**This flatpak requires `org.freedesktop.Platform.ffmpeg-full` to be installed**

Works fine, but requires [podman](https://podman.io/) installed on the host.

If the `binder` module doesn't seem to be loaded it will be automatically loaded, requires the `binder` modules, expect a lot of password prompts.

GPU acceleration *should* work, but I can't test it properly (nvidia moment).

Ashmem is **not** needed.
