# Nixpkgs Overlay for Ruby

This overlay adds packages for specific ruby versions (including minor).

## Usage

For instance with `shell.nix`:
```nix
{
  nixpkgs-ruby ? import (fetchTarball "https://github.com/juanibiapina/nixpkgs-ruby/archive/main.tar.gz"),
  pkgs ? import <nixpkgs> { overlays = [ nixpkgs-ruby ]; },
}:

pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    ruby_3_1_2
  ];
}
```
