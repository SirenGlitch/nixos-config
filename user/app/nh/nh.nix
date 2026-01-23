{ config, ... }:

{
  programs.nh = {
    enable = true;
    flake = config.home.homeDirectory + "/nixstuff/nixos-config";
  };
}
