{
  nixpkgs-ruby ? import ./default.nix,
  pkgs ? import <nixpkgs> { overlays = [ nixpkgs-ruby ]; },
}:

{
  inherit (pkgs)
    ruby_2_7_6
    ruby_3_1_2
  ;
}
