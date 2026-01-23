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
    # Clipboard/screen-cap stuff
    wl-clipboard
    clipse
    grim
    slurp
    wayfreeze
    satty
  ];
}
