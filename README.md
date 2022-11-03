# Nixpkgs Overlay for Ruby

This overlay adds packages for specific ruby versions (including minor).

## Usage

### With Nix Shell

For instance with `shell.nix`:
```nix
{
  nixpkgs-ruby ? import (fetchTarball "https://github.com/juanibiapina/nixpkgs-ruby/archive/main.tar.gz"),
  pkgs ? import <nixpkgs> { overlays = [ nixpkgs-ruby ]; },
}:

let
  ruby_package = pkgs.parseRubyVersionFile ./.ruby-version;
in
pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    pkgs.${ruby_package}
  ];
  shellHook = ''
    # install gems locally
    mkdir -p .local/nix-gems
    export GEM_HOME=$PWD/.local/nix-gems
    export GEM_PATH=$GEM_HOME
    export PATH=$GEM_HOME/bin:$PATH

    # add local bin directory to path (useful for rails)
    export PATH=$PWD/bin:$PATH
  '';
}
```

### As a flake

Use the previous `shell.nix`, but also create `flake.nix`:
```
{
  inputs = {
    flake-utils = {
      url = "github:numtide/flake-utils";
    };
    nixpkgs = {
      url = "nixpkgs";
    };
    nixpkgs-ruby = {
      url = "github:juanibiapina/nixpkgs-ruby";
    };
  };

  outputs = { self, nixpkgs, flake-utils, nixpkgs-ruby }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let
          pkgs = import nixpkgs {
            overlays = [ nixpkgs-ruby.overlays.default ];
            inherit system;
          };
        in
        {
          devShells.default = import ./shell.nix { inherit pkgs; };
        }
      );
}
```
