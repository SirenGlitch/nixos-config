{
  pkgs,
  userSettings,
  systemSettings,
  config,
  lib,
  inputs,
  ...
}:

{
  stylix.targets.firefox = {
    enable = true;

    colorTheme.enable = true;

    profileNames = [ "default" ];
  };

  programs.firefox = {
    enable = true;

    languagePacks = [ "en-GB" ];

    policies = {
      DisableTelemetry = true;
      DontCheckDefaultBrowser = true;
      GenerativeAI = {
        Enabled = false;
	Chatbot = false;
	LinkPreviews = false;
	TabGroups = false;
	Locked = true;
      };
    };

    profiles = {
      default = {
        extensions = {
          force = true;

          packages = with inputs.firefox-addons.packages.${systemSettings.system}; [
            ublock-origin
            vimium
            firefox-color
          ];

          settings = {
            "uBlock0@raymondhill.net".settings = {

              selectedFilterLists = [
                "CZE-0"
                "adguard-generic"
                "adguard-annoyance"
                "adguard-social"
                "adguard-spyware-url"
                "easylist"
                "easyprivacy"
                "plowe-0"
                "ublock-abuse"
                "ublock-badware"
                "ublock-filters"
                "ublock-privacy"
                "ublock-quick-fixes"
                "ublock-unbreak"
                "urlhaus-1"
              ];
            };
          };
        };

        bookmarks = {
          force = true;
          settings = [
            {
              name = "MyNixOS";
              tags = [ "NixOS" ];
              keyword = "mynixos";
              url = "https://mynixos.com";
            }
          ];
        };

        search = {
          force = true;
          default = "google";
          privateDefault = "ddg";

          engines = {
            "Nix Packages" = {
              urls = [
                {
                  template = "https://search.nixos.org/packages";
                  params = [
                    {
                      name = "channel";
                      value = "unstable";
                    }
                    {
                      name = "query";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ "@np" ];
            };

            "Nix Options" = {
              urls = [
                {
                  template = "https://search.nixos.org/options";
                  params = [
                    {
                      name = "channel";
                      value = "unstable";
                    }
                    {
                      name = "query";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ "@no" ];
            };

            "NixOS Wiki" = {
              urls = [
                {
                  template = "https://wiki.nixos.org/w/index.php";
                  params = [
                    {
                      name = "search";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ "@nw" ];
            };
          };
        };
      };
    };
  };
}
