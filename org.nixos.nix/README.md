# [nix](https://nixos.org)
Works with no issues, but you'll have to use it by running `flatpak run org.nixos.nix <the nix command>`. So for `nix-shell` it'd be `flatpak run org.nixos.nix nix-shell`. If you want to simplify this, you can simply create an alias to it (or, what I do, run `nix-shell` as your default shell).

The first start will always take a couple of seconds depending on your disk rw speeds.
