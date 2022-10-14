# [OSX-KVM](https://github.com/kholia/OSX-KVM)
This (surprisingly) works
Qemu is compiled without usb passthrough, so passing usb devices to the vm will not work.
Gpu passthrough most likely will not work, but I don't have any way of testing it.

The qemu start command can be edited in `~/.var/app/com.github.kholia.osx-kvm/osx-kvm/OpenCore-Boot.sh`

# Increasing memory
Open `~/.var/app/com.github.kholia.osx-kvm/osx-kvm/OpenCore-Boot.sh` with a text editor and edit the `ALLOCATED_RAM` variable

# Increasing the amount of cpu cores
Open `~/.var/app/com.github.kholia.osx-kvm/osx-kvm/OpenCore-Boot.sh` with a text editor and edit the `CPU_` variables to your liking
