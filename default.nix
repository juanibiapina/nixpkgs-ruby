self: super:

let
  rubyGenericBuilder = (super.callPackage ./generic-builder.nix {
    inherit (super.darwin) libiconv libobjc libunwind;
    inherit (super.darwin.apple_sdk.frameworks) Foundation;
  });
  rubyVersion = import ./ruby-version.nix { inherit (super) lib; };

  parseRubyVersionFile = import ./parse-ruby-version-file.nix;

  pwd = builtins.getEnv "PWD";
  ruby_version_string = builtins.readFile (pwd + "/.ruby-version");
  ruby_version_parts = builtins.match "([0-9]*)\.([0-9]*)\.([0-9]*).*" ruby_version_string;
  ruby_package = builtins.concatStringsSep "_" (["ruby"] ++ ruby_version_parts);
in {
  parseRubyVersionFile = parseRubyVersionFile;

  ruby_2_7_6 = rubyGenericBuilder {
    version = rubyVersion "2" "7" "6" "";
    sha256 = "042xrdk7hsv4072bayz3f8ffqh61i8zlhvck10nfshllq063n877";
  };

  ruby_3_1_2 = rubyGenericBuilder {
    version = rubyVersion "3" "1" "2" "";
    sha256 = "0gm84ipk6mrfw94852w5h7xxk2lqrxjbnlwb88svf0lz70933131";
  };
}
