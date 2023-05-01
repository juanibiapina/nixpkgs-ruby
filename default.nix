self: super:

let
  parseRubyVersionFile = import ./lib/parseRubyVersionFile.nix;
  mkRubyVersion = import ./lib/mkRubyVersion.nix { lib = super.lib; };
  mkRuby = super.callPackage ./lib/mkRuby.nix {
    inherit (super.darwin) libobjc libunwind;
    inherit (super.darwin.apple_sdk.frameworks) Foundation;
  };
in {
  inherit parseRubyVersionFile;

  ruby_2_7_6 = mkRuby {
    version = mkRubyVersion "2" "7" "6" "";
    sha256 = "042xrdk7hsv4072bayz3f8ffqh61i8zlhvck10nfshllq063n877";
  };

  ruby_3_0_4 = mkRuby {
    version = mkRubyVersion "3" "0" "4" "";
    sha256 = "0avj4g3s2839b2y4m6pk8kid74r8nj7k0qm2rsdcwjzhg8h7rd3h";
  };

  ruby_3_1_4 = mkRuby {
    version = mkRubyVersion "3" "1" "4" "";
    sha256 = "sha256-o9VYeaDfqx1xQf3xDSKgfb+OXNxEFdob3gYSfVzDx7Y=";
  };
}
