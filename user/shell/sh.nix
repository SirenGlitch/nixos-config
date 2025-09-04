{ config, pkgs, ... }:

let
  myAliases = { };
in
{
  # zsh configuration
  programs.zsh = {
    enable = true;
    shellAliases = myAliases;
  };

  # bash configuration
  programs.bash = {
    enable = true;
    shellAliases = myAliases;
  };
}
