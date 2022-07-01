# flatpaks
random stuff i packaged as flatpak

# Building & installing flatpaks
just move into the directory of the flatpak you want to install and run `flatpak-builder --user --install --force-clean build-dir <filename>.yml`

if an application needs some extra work before being aple to install/build it, it will have a readme in it describing the process in more detail
