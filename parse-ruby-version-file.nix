# Generates the name of a ruby package for a version specified in a
# .ruby-version file
rubyVersionFile:

let
  rubyVersionString = builtins.readFile rubyVersionFile;
  rubyVersionParts = builtins.match "([0-9]*)\.([0-9]*)\.([0-9]*).*" rubyVersionString;
  rubyPackage = builtins.concatStringsSep "_" (["ruby"] ++ rubyVersionParts);
in
  rubyPackage
