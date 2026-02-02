{
  config,
  pkgs,
  lib,
  ...
}:

{
  programs.yazi = lib.mkForce {
    enable = true;
    # flavors =
    # plugins =
    settings = {
      mgr = {
        show_hidden = true;
      };
    };
  };

  stylix.targets.yazi.enable = true;
}
