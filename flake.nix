{

  description = "Flake of SirenGlitch";

  outputs =
    inputs@{
      self,
      home-manager,
      ...
    }:
    let
      # ---- SYSTEM SETTINGS ---- #
      systemSettings = {
        system = "x86_64-linux"; # system arch
        hostname = "WHITELIGHTNING"; # hostname
        profile = "desktop"; # profile from profiles directory (does nothing right now)
        timezone = "Europe/London"; # select timezone
        locale = "en_GB.UTF-8"; # select locale
      };

      userSettings = rec {
        username = "frazer"; # username
        name = "SirenGlitch"; # name/identifier
        email = "frazerjamesrose@outlook.com"; # email (used for certain configurations)
        dotfilesDir = "~/.dotfiles";
        # theme = ""; # theme from ./themes/
        wm = "plasma"; # Selected window manager or DE; must be in both ./user/wm/ and ./system/wm/
        wmType = if ((wm == "hyprland") || (wm == "plasma")) then "wayland" else "x11";
        # browser = "" # Default browser; must be in ./user/app/browser/
        term = "konsole"; # Default terminal command
        font = "JetBrainsMono Nerd Font"; # Selected font
        fontPkg = pkgs.nerd-fonts.jetbrains-mono; # Font package
        editor = "kate"; # Default editor
      };

      lib = inputs.nixpkgs.lib;

      # create patched nixpkgs
      nixpkgs-patched =
        (import inputs.nixpkgs {
          system = systemSettings.system;
        }).applyPatches
          {
            name = "nixpkgs-patched";
            src = inputs.nixpkgs;
            patches = [
              #./patches/...
            ];
          };

      pkgs = import nixpkgs-patched {
        system = systemSettings.system;
        config = {
          allowUnfree = true;
          allowUnfreePredicate = (_: true);
        };
        overlays = [ ];
      };

      pkgs-stable = import inputs.nixpkgs-stable {
        system = systemSettings.system;
        config = {
          allowUnfree = true;
          allowUnfreePredicate = (_: true);
        };
        overlays = [ ];
      };

    in
    {
      homeConfigurations = {
        user = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./user/home.nix ];
          extraSpecialArgs = {
            # pass config varibles from above
            inherit pkgs-stable;
            inherit systemSettings;
            inherit userSettings;
            inherit inputs;
          };
        };
      };
      nixosConfigurations = {
        system = lib.nixosSystem {
          modules = [ ./system/configuration.nix ];
          specialArgs = {
            inherit pkgs-stable;
            inherit systemSettings;
            inherit userSettings;
            inherit inputs;
          };
        };
      };
    };

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "nixpkgs/nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager-stable = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs-stable";
    };

    plasma-manager.url = "github:pjones/plasma-manager";
    plasma-manager.inputs.nixpkgs.follows = "nixpkgs";
    plasma-manager.inputs.home-manager.follows = "home-manager";
  };

}
