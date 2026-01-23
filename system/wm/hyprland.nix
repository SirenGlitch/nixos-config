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

  services.displayManager.sddm.enable = true;
  # services.displayManager.sddm.wayland.enable = true;

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
