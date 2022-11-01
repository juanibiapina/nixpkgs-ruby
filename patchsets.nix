{ version, rvmPatchsets }:

let
  directory = "${rvmPatchsets}/patches/ruby/${version}/railsexpress";
  files = builtins.attrNames (builtins.readDir directory);
  patches = map (file: "${directory}/${file}") files;
in
  patches
