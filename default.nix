self: super:

let
  parseRubyVersionFile = import ./parse-ruby-version-file.nix;
  rvmPatchsets = import ./rvm-patchsets.nix { inherit (super) fetchFromGitHub; };
  patchsets = version: import ./patchsets.nix { inherit rvmPatchsets version; };
in {
  inherit parseRubyVersionFile;

  ruby_2_7_5 = super.mkRuby rec {
    version = super.mkRubyVersion "2" "7" "5" "";
    sha256 = "1wc1hwmz4m6iqlmqag8liyld917p6a8dvnhnpd1v8d8jl80bjm97";
    railsExpressPatches = patchsets version.majMinTiny;
  };

  ruby_2_7_6 = super.mkRuby rec {
    version = super.mkRubyVersion "2" "7" "6" "";
    sha256 = "042xrdk7hsv4072bayz3f8ffqh61i8zlhvck10nfshllq063n877";
    railsExpressPatches = patchsets version.majMinTiny;
  };

  ruby_3_0_3 = super.mkRuby rec {
    version = super.mkRubyVersion "3" "0" "3" "";
    sha256 = "1b4j39zyyvdkf1ax2c6qfa40b4mxfkr87zghhw19fmnzn8f8d1im";
    railsExpressPatches = patchsets version.majMinTiny;
  };

  ruby_3_0_4 = super.mkRuby rec {
    version = super.mkRubyVersion "3" "0" "4" "";
    sha256 = "0avj4g3s2839b2y4m6pk8kid74r8nj7k0qm2rsdcwjzhg8h7rd3h";
    railsExpressPatches = patchsets version.majMinTiny;
  };

  ruby_3_1_1 = super.mkRuby rec {
    version = super.mkRubyVersion "3" "1" "1" "";
    sha256 = "sha256-/m5Hgt6XRDl43bqLpL440iKqJNw+PwKmqOdwHA7rYZ0=";
    railsExpressPatches = patchsets version.majMinTiny;
  };

  ruby_3_1_2 = super.mkRuby rec {
    version = super.mkRubyVersion "3" "1" "2" "";
    sha256 = "0gm84ipk6mrfw94852w5h7xxk2lqrxjbnlwb88svf0lz70933131";
    railsExpressPatches = patchsets version.majMinTiny;
  };
}
