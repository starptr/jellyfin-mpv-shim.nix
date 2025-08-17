Moved to Everything repo.

# jellyfin-mpv-shim.nix

This is a thin flake for jellyfin-mpv-shim, a client for Jellyfin that uses mpv as a backend.
This flake exists because
1. `nixpkgs#jellyfin-mpv-shim` is broken on darwin
    - The package is marked working, but one of its dependencies is Linux-only.
    - The dependency shouldn't be installed on Darwin.
        - So, the "quick fix" is to make the depedency optional for Darwin, which will make cli-mode work.
        - The "full fix" is to fix pyobjc so that gui-mode will also work.
2. Making a PR to nixpkgs is … actually really hard? I haven't figured out a sane workflow yet.
