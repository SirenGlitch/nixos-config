# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  config,
  pkgs,
  systemSettings,
  userSettings,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    (./wm + ("/" + userSettings.wm) + ".nix")
    # ./hardware/razer.nix
    ./persistence.nix
    ./hardware/chromebook/chromebook.nix
    ./stylix.nix
  ];

  # Bootloader
  # boot.loader.efi.canTouchEfiVariables = true;

  boot.loader = {
    grub = {
      enable = true;
      useOSProber = true;
      copyKernels = true;
      # efiSupport = true;
      fsIdentifier = "uuid";
      device = "/dev/mmcblk1";
      default = "saved";
      extraEntries = ''
        menuentry "Reboot" {
            reboot
        }
        menuentry "Poweroff" {
            halt
        }
      '';
    };
  };

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = systemSettings.hostname; # Define your hostname.

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking with networkmanager
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = systemSettings.timezone;

  # Select internationalisation properties.
  i18n.defaultLocale = systemSettings.locale;

  i18n.extraLocaleSettings = {
    LC_ADDRESS = systemSettings.locale;
    LC_IDENTIFICATION = systemSettings.locale;
    LC_MEASUREMENT = systemSettings.locale;
    LC_MONETARY = systemSettings.locale;
    LC_NAME = systemSettings.locale;
    LC_NUMERIC = systemSettings.locale;
    LC_PAPER = systemSettings.locale;
    LC_TELEPHONE = systemSettings.locale;
    LC_TIME = systemSettings.locale;
  };

  # Enable Plymouth
  boot.plymouth = {
    enable = true;
    theme = "blahaj";
    themePackages = with pkgs; [ plymouth-blahaj-theme ];
  };

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  hardware.cpu.intel.updateMicrocode = true;

  # Nvidia open drivers
  # hardware.graphics.enable = true;
  # services.xserver.videoDrivers = [ "nvidia" ];
  # hardware.nvidia = {
  #   open = true;
  #   powerManagement.enable = true;
  # };

  # Configure console keymap
  console.keyMap = "uk";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable Bluetooth support
  hardware.bluetooth.enable = true;

  # Change power button behaviour
  services.logind.settings.Login = {
    HandlePowerKey = "suspend";
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput = {
    enable = true;

    touchpad = {
      # Enable tap-to-click
      tapping = true;
      # Enable 1/2/3-finger taps for left/right/middle click
      tappingButtonMap = "lrm";
      clickMethod = "clickfinger"; # Should allow the above to work for clicking, not just tapping
    };
  };

  users.mutableUsers = false;

  users.users.root.initialPassword = "hunter2";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${userSettings.username} = {
    isNormalUser = true;
    description = userSettings.name;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    initialPassword = "hunter2";
    packages = with pkgs; [
      kdePackages.kate
      #  thunderbird
    ];
    useDefaultShell = true;
  };

  # Install firefox.
  programs.firefox.enable = true;
  programs.firefox.preferences = {
    "browser.startup.page" = 3;
  };

  # Change shell to zsh
  environment.shells = with pkgs; [ zsh ];
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim
    #  wget
    git
    nil
    mpv
    nixfmt
    userSettings.fontPkg
    nh
    nix-output-monitor
    jq
  ];

  virtualisation.vmVariant = {
    virtualisation = {
      memorySize = 4096;
      cores = 4;
    };
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

}
