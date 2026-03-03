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
    shellWrapperName = "y";
    enableZshIntegration = true;
  };

  stylix.targets.yazi.enable = true;
}
