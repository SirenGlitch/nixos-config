{ pkgs, config, ... }:

{
  stylix = {
    autoEnable = false;
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
  };
}
