{
  description = "A very basic flake";

  outputs = { self }: {
    overlays.default = import ./default.nix;
  };
}
