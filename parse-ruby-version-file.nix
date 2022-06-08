# Generates the name of a ruby package for a version specified in .ruby-version
{ }:

let
  pwd = builtins.getEnv "PWD";
  ruby_version_string = builtins.readFile (pwd + "/.ruby-version");
  ruby_version_parts = builtins.match "([0-9]*)\.([0-9]*)\.([0-9]*).*" ruby_version_string;
  ruby_package = builtins.concatStringsSep "_" (["ruby"] ++ ruby_version_parts);
in
  ruby_package
