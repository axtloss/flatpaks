# [distrobox](https://github.com/89luca89/distrobox)

this flatpak needs some more setup, the host also needs podman installed.

When creating the distrobox you'll have to do it from inside the flatpak, meaning you first have to run `flatpk run --command=bash io.github.luca.distrobox` and then the usual distrobox create command, which will create the container, however once that's done you can enter the container by just running `flatpak run io.github.luca.distrobox enter ...`

---

There isn't really any point in using this anymore since distrobox has experimental flatpak support in the [experimental/flatpak](https://github.com/89luca89/distrobox/tree/experiment/flatpak) branch.
