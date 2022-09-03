# [nix](https://nixos.org)
works with no issues, but you'll have to use them by running `flatpak run org.nixos.nix <the nix command>`, so for `nix-shell` it'd be `flatapk run org.nixos.nix nix-shell`
if you want to simplify this you can simply create an alias to it (or, what I do run `nix-shell` as your default shell)

the first start will always take a couple of seconds depending on your disk rw speeds.


