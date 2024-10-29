{
  description = "jellyfin-mpv-shim as a flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    jellyfin-mpv-shim = {
      url = "github:jellyfin/jellyfin-mpv-shim";
      flake = false;
    };
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, jellyfin-mpv-shim, ... } @ inputs:
      let
        system = "aarch64-darwin";
      in let
        pkgs = import nixpkgs {
          inherit system;
        };
      in let
        name = "jellyfin-mpv-shim";
        version = "2.8.0";
      in
      {
        packages.${system} = {
          jellyfin-mpv-shim = pkgs.python312Packages.buildPythonPackage {
            inherit name version;
            src = pkgs.fetchPypi {
              inherit version;
              pname = name;
              hash = "sha256-EANaNmvD8hcdGB2aoGemKvA9syS1VvIqGsP1jk0b+lE=";
            };
          };
          default = self.packages.${system}.jellyfin-mpv-shim;
        };
      };
}
