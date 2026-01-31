{
  config,
  pkgs,
  userSettings,
  ...
}:

{

  imports = [

    ./shell/sh.nix # Shell configuration
    ./app/discord/vesktop.nix
    ./app/git/git.nix # git configuration
    ./shell/cli.nix # Various CLI/TUI apps
    (./wm + ("/" + userSettings.wm) + ".nix") # window manager selected in flake
    # ./app/razer/polychromatic.nix
    ./app/nh/nh.nix # Nix helper script
    ./app/nvim/nvim.nix # Neovim configuration
    ./app/kitty/kitty.nix # Kitty configuration
    ./persistence.nix # Persistent storage configuration
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = userSettings.username;
  home.homeDirectory = "/home/" + userSettings.username;

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [ ];

  home.pointerCursor = {
    enable = true;
    size = 24;
    gtk.enable = true;
    hyprcursor.enable = true;
    x11.enable = true;
    package = pkgs.phinger-cursors;
    name = "phinger-cursors-dark";
  };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = { };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  # or
  #  /etc/profiles/per-user/frazer/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.
}
