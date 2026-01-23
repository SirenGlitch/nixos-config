{ config, pkgs, ... }:

{

  imports = [
    ./wayland.nix
    ./pipewire.nix
  ];

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    elisa
    okular
    khelpcenter
    krdp
  ];

  environment.systemPackages = with pkgs; [
    kdePackages.sddm-kcm
  ];

  # Configure X11
  services.xserver = {
    enable = true;
    xkb = {
      layout = "gb";
      variant = "";
    };
    excludePackages = [ pkgs.xterm ];
  };
}
