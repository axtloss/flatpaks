#!/usr/bin/bash
if [[ ! -d $HOME/.var/app/org.nixos.nix/data/nix ]]; then
    pushd $HOME
    mkdir nix-tmp
    cp /app/bin/install.sh .
    bash ./install.sh
    cp -r /nix $HOME/.var/app/org.nixos.nix/data/nix
    cp -r $HOME/.nix* $HOME/.var/app/org.nixos.nix/data/.
else
    cp -r $HOME/.var/app/org.nixos.nix/data/nix /nix
    cp -r $HOME/.var/app/org.nixos.nix/data/.nix* $HOME/.
fi

exec "$@"
cp -r /nix $HOME/.var/app/org.nixos.nix/data/nix