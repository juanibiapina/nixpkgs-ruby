self: super:

let
  parseRubyVersionFile = import ./lib/parse-ruby-version-file.nix;
in {
  inherit parseRubyVersionFile;

  ruby_2_7_6 = super.mkRuby {
    version = super.mkRubyVersion "2" "7" "6" "";
    sha256 = "042xrdk7hsv4072bayz3f8ffqh61i8zlhvck10nfshllq063n877";
  };

  ruby_3_0_4 = super.mkRuby {
    version = super.mkRubyVersion "3" "0" "4" "";
    sha256 = "0avj4g3s2839b2y4m6pk8kid74r8nj7k0qm2rsdcwjzhg8h7rd3h";
  };

  ruby_3_1_2 = super.mkRuby {
    version = super.mkRubyVersion "3" "1" "2" "";
    sha256 = "0gm84ipk6mrfw94852w5h7xxk2lqrxjbnlwb88svf0lz70933131";
  };
}
