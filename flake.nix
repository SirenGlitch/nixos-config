{

  description = "Flake of SirenGlitch";

  outputs =
    inputs@{
      self,
      home-manager,
      impermanence,
      ...
    }:
    let
      # ---- SYSTEM SETTINGS ---- #
      systemSettings = {
        system = "x86_64-linux"; # system arch
        hostname = "Nixbook"; # hostname
        profile = "laptop"; # profile from profiles directory (does nothing right now)
        timezone = "Europe/London"; # select timezone
        locale = "en_GB.UTF-8"; # select locale
      };

      userSettings = rec {
        username = "frazer"; # username
        name = "SirenGlitch"; # name/identifier
        email = "frazerjamesrose@outlook.com"; # email (used for certain configurations)
        dotfilesDir = "~/.dotfiles";
        # theme = ""; # theme from ./themes/
        wm = "hyprland"; # Selected window manager or DE; must be in both ./user/wm/ and ./system/wm/
        wmType = if ((wm == "hyprland") || (wm == "plasma")) then "wayland" else "x11";
        # browser = "" # Default browser; must be in ./user/app/browser/
        term = "konsole"; # Default terminal command
        font = "JetBrainsMono Nerd Font"; # Selected font
        fontPkg = pkgs.nerd-fonts.jetbrains-mono; # Font package
        editor = "nvim"; # Default editor
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
      nixosConfigurations = {
        ${systemSettings.hostname} = lib.nixosSystem {
          modules = [
            impermanence.nixosModules.impermanence
            ./system/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.${userSettings.username} = import ./user/home.nix;
                extraSpecialArgs = {
                  inherit pkgs-stable;
                  inherit systemSettings;
                  inherit userSettings;
                  inherit inputs;
                };
              };
            }
          ];
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
    nixpkgs-stable.url = "nixpkgs/nixos-25.11";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager-stable = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs-stable";
    };

    # plasma-manager.url = "github:pjones/plasma-manager";
    # plasma-manager.inputs.nixpkgs.follows = "nixpkgs";
    # plasma-manager.inputs.home-manager.follows = "home-manager";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    impermanence = {
      url = "github:nix-community/impermanence";
      inputs = {
        nixpkgs.follows = "";
        home-manager.follows = "";
      };
    };
  };
}
