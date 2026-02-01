{
  pkgs,
  config,
  inputs,
  ...
}:

{
  programs.kitty = {
    enable = true;
  };

  stylix.targets.kitty.enable = true;
}
