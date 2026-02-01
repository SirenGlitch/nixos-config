{
  pkgs,
  config,
  lib,
  inputs,
  userSettings,
  ...
}:

{
  programs.kitty = lib.mkForce {
    enable = true;
    font = {
      name = userSettings.font;
      package = userSettings.fontPkg;
    };
  };

  stylix.targets.kitty.enable = true;
}
