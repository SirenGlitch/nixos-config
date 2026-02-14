{
  config,
  userSettings,
  pkgs,
  ...
}:

{
  imports = [
    ./wayland.nix
    ./pipewire.nix
  ];

  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };

  environment.systemPackages = [
    pkgs.kitty
  ];

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
