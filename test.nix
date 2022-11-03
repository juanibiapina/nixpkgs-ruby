{
  nixpkgs-ruby ? import ./default.nix,
  pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/d220d88533e95eb7aa31fdc0f4cf216e5dbc5221.tar.gz") { overlays = [ nixpkgs-ruby ]; },
}:

{
  inherit (pkgs)
    ruby_2_7_5
    ruby_2_7_6
    ruby_3_0_2
    ruby_3_0_3
    ruby_3_0_4
    ruby_3_1_1
    ruby_3_1_2
  ;
}
