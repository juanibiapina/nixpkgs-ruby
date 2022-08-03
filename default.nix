self: super:

let
  parseRubyVersionFile = import ./parse-ruby-version-file.nix;
in {
  inherit parseRubyVersionFile;

  ruby_2_7_6 = super.mkRuby {
    version = super.mkRubyVersion "2" "7" "6" "";
    sha256 = "042xrdk7hsv4072bayz3f8ffqh61i8zlhvck10nfshllq063n877";
  };

  ruby_3_1_2 = super.mkRuby {
    version = super.mkRubyVersion "3" "1" "2" "";
    sha256 = "0gm84ipk6mrfw94852w5h7xxk2lqrxjbnlwb88svf0lz70933131";
  };
}
