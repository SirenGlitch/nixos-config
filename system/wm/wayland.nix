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
}
