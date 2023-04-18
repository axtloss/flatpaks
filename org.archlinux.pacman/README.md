# [Pacman](https://archlinux.org/)

Arch Linux's pacman running directly in a flatpak, no chroot or extra container involved.

Runs fine, everything gets stored in `~/.var/app/org.archlinux.pacman/.pacroot/root`.

Issues:
 - pacman will give some warnings about being able to change ownership, that can be ignored
 - due to errors with gpg, any form of package verification had to be disabled
