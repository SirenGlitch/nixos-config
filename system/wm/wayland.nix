{ config, pkgs, ... }:

{
  imports = [
    ./pipewire.nix
  ];

  # Configure xwayland
  services.xserver = {
    enable = true;
    xkb = {
      layout = "gb";
      variant = "";
    };
  };

  environment.systemPackages = with pkgs; [
    # Clipboard
    wl-clipboard
  ];
}
