# [Entrusted](https://github.com/rimerosolutions/entrusted)

this works, but it uses qemu and the live iso to host the webserver and then uses [nativefier](https://github.com/nativefier/nativefier) to create a window that connects to the webserver.

The start will take very long since the grub timeout in the iso is 30 seconds long and can't be skipped due to the qemu vm running headless with no way to control it.
