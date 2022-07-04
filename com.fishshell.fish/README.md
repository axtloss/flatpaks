# [fish](https://fishshell.com/)
this mostly works with no issues, just sometimes the shell gets a bit messed up (though that may also be an issue with my prompt config)

I'd recommend making an alias to `flatpak-spawn --host` so that you are able to directly execute stuff on the host.

When a command isn't found inside the flatpak it will try to launch the program in the host using `flatpak-spawn --host`
