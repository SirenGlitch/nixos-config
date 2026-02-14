{
  config,
  pkgs,
  userSettings,
  ...
}:

{
  imports = [
    ./pipewire.nix
  ];

  services.displayManager = {
    defaultSession = "hyprland-uwsm";

    sddm = {
      enable = true;
      # wayland.enable = true;
    };

    autoLogin = {
      enable = true;
      user = userSettings.username;
    };
  };

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
