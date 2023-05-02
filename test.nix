{
  nixpkgs-ruby ? import ./default.nix,
  pkgs ? import <nixpkgs> { overlays = [ nixpkgs-ruby ]; },
}:

{
  inherit (pkgs)
    ruby_2_7_6
    ruby_3_0_4
    ruby_3_1_2
    ruby_3_1_4
    ruby_3_2_2
  ;
}
