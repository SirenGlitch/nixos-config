# Chromebook specific tweaks
{ pkgs, ... }:
{
  imports = [
    ./chromebook-audio.nix
  ];
  environment.systemPackages = with pkgs; [
    # Framework ectool works just as well, ChromeOS one isn't packaged
    fw-ectool
    # For running MrChromebox firmware script
    dmidecode
  ];
  # For flashing firmware
  boot.kernelParams = [ "iomem=relaxed" ];
}
