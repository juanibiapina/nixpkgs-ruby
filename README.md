# Nixpkgs Overlay for Ruby

This overlay adds packages for specific ruby versions (including minor).

## Usage

For instance with `shell.nix`:
```nix
{
  nixpkgs-ruby ? import (fetchTarball "https://github.com/juanibiapina/nixpkgs-ruby/archive/main.tar.gz"),
  pkgs ? import <nixpkgs> { overlays = [ nixpkgs-ruby ]; },
}:

let
  ruby_package = pkgs.parseRubyVersionFile {};
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
