#!/bin/sh

# This script installs the Nix package manager on your system by
# downloading a binary distribution and running its installer script
# (which in turn creates and populates /nix).

{ # Prevent execution if this script was only partially downloaded
oops() {
    echo "$0:" "$@" >&2
    exit 1
}

umask 0022

tmpDir="./nix-tmp"
cleanup() {
    rm -rf "$tmpDir"
}
trap cleanup EXIT INT QUIT TERM

require_util() {
    command -v "$1" > /dev/null 2>&1 ||
        oops "you do not have '$1' installed, which I need to $2"
}

case "$(uname -s).$(uname -m)" in
    Linux.x86_64)
        hash=4624ad2cbbc1a42dfaa1d018bdba4dfba7ca63d81cd37d05c5221ff6c59ce304
        path=4an81y7vbqzrzhw9x6ph34gnpr5fwp62/nix-2.11.0-x86_64-linux.tar.xz
        system=x86_64-linux
        ;;
    Linux.i?86)
        hash=2f26db8ce3587def903410bd072911d3581eb9ca184c06b71d6b3668df0831ce
        path=v12wcrxhymy5hv1izwfrv8l4x70jb2fd/nix-2.11.0-i686-linux.tar.xz
        system=i686-linux
        ;;
    Linux.aarch64)
        hash=dd7b3b0d0e6cc909a322c1bb50aa6b1dcb12def45b65bd4e0306050f9393329d
        path=ppbjlxpayiqh04mnimikk1c8jjizzi76/nix-2.11.0-aarch64-linux.tar.xz
        system=aarch64-linux
        ;;
    Linux.armv6l_linux)
        hash=5b68ed4a63221cfdeb36f22ab5b91adb798b2d5f480fea544abb80d3de4796c9
        path=v82sf3pr3cxmw1phmw3vb7mm7jyjh8j8/nix-2.11.0-armv6l-linux.tar.xz
        system=armv6l-linux
        ;;
    Linux.armv7l_linux)
        hash=fc0336a8204d778c73b6f722dbbbe17de11822f1e62adb2b6d594f5bf68e5fdf
        path=3499idl1xdjznad9m0pj280f7pl4rgx2/nix-2.11.0-armv7l-linux.tar.xz
        system=armv7l-linux
        ;;
    Darwin.x86_64)
        hash=ff9f7eed26d1168feb5346aecf0fcad4fd7c183a4138c626f8b56ec608213aa7
        path=bpwcf76a6cyf4zsrrx9j3z9q7qjmzmwc/nix-2.11.0-x86_64-darwin.tar.xz
        system=x86_64-darwin
        ;;
    Darwin.arm64|Darwin.aarch64)
        hash=c911e097ced4e2f606018c182118a0a446520cb1c1f2a48e847c09596e8cf52d
        path=v9lq31hzf46k2wlsqg1pr67m3sqfnll1/nix-2.11.0-aarch64-darwin.tar.xz
        system=aarch64-darwin
        ;;
    *) oops "sorry, there is no binary distribution of Nix for your platform";;
esac

# Use this command-line option to fetch the tarballs using nar-serve or Cachix
if [ "${1:-}" = "--tarball-url-prefix" ]; then
    if [ -z "${2:-}" ]; then
        oops "missing argument for --tarball-url-prefix"
    fi
    url=${2}/${path}
    shift 2
else
    url=https://releases.nixos.org/nix/nix-2.11.0/nix-2.11.0-$system.tar.xz
fi

tarball=$tmpDir/nix-2.11.0-$system.tar.xz

require_util tar "unpack the binary tarball"
if [ "$(uname -s)" != "Darwin" ]; then
    require_util xz "unpack the binary tarball"
fi

if command -v curl > /dev/null 2>&1; then
    fetch() { curl --fail -L "$1" -o "$2"; }
elif command -v wget > /dev/null 2>&1; then
    fetch() { wget "$1" -O "$2"; }
else
    oops "you don't have wget or curl installed, which I need to download the binary tarball"
fi

echo "downloading Nix 2.11.0 binary tarball for $system from '$url' to '$tmpDir'..."
fetch "$url" "$tarball" || oops "failed to download '$url'"

if command -v sha256sum > /dev/null 2>&1; then
    hash2="$(sha256sum -b "$tarball" | cut -c1-64)"
elif command -v shasum > /dev/null 2>&1; then
    hash2="$(shasum -a 256 -b "$tarball" | cut -c1-64)"
elif command -v openssl > /dev/null 2>&1; then
    hash2="$(openssl dgst -r -sha256 "$tarball" | cut -c1-64)"
else
    oops "cannot verify the SHA-256 hash of '$url'; you need one of 'shasum', 'sha256sum', or 'openssl'"
fi

if [ "$hash" != "$hash2" ]; then
    oops "SHA-256 hash mismatch in '$url'; expected $hash, got $hash2"
fi

unpack=$tmpDir/unpack
mkdir -p "$unpack"
tar -xJf "$tarball" -C "$unpack" || oops "failed to unpack '$url'"

script=$(echo "$unpack"/*/install)

[ -e "$script" ] || oops "installation script is missing from the binary tarball!"
export INVOKED_FROM_INSTALL_IN=1
"$script" "$@"

} # End of wrapping
