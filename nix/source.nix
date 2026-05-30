{ lib, ... }:
with lib;
{
  miso-lynx = cleanSourceWith {
    src = ../.;
    filter = name: type:
      let baseName = baseNameOf (toString name); in
      (type == "regular" && (hasSuffix ".idr" baseName ||
       hasSuffix ".ipkg" baseName ||
       hasSuffix ".js" baseName ||
       hasSuffix ".ts" baseName ||
       hasSuffix ".json" baseName ||
       hasSuffix ".md" baseName)) ||
      (type == "directory" && baseName != ".git" && baseName != "build" && baseName != "node_modules");
  };
}
