{ pkgs, inputs, ... }:

{

  imports = [
    inputs.nixvim.homeModules.nixvim
    ./plugins
    ./keymaps.nix
    ./options.nix
  ];

  home.packages = with pkgs; [
    neovide
  ];

  programs.nixvim = {
    enable = true;
    colorschemes = {
      # Enabled colorschemes
      catppuccin.enable = true;
    };
  };
}
