self: super:

{
  inherit (super.callPackage ./ruby.nix {
    inherit (super.darwin) libiconv libobjc libunwind;
    inherit (super.darwin.apple_sdk.frameworks) Foundation;
  })
    ruby_2_7_6
    ruby_3_1_2;
}
