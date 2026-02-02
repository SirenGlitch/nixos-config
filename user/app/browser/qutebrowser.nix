{
  pkgs,
  userSettings,
  config,
  lib,
  ...
}:

{
  programs.qutebrowser = {
    enable = true;
    keyBindings = {
      normal = {
        ",m" = "spawn umpv {url}";
        ",M" = "hint links spawn umpv {hint-url}";
        ";M" = "hint --rapid links spawn umpv {hint-url}";
        "sd" = "spawn --userscript open_download";
        "gc" = "spawn --userscript gitclone";
        ";c" = "hint code userscript code_select.py";
      };
    };
    searchEngines = {
      DEFAULT = "https://duckduckgo.com?q={}";
      aw = "https://wiki.archlinux.org/?search={}";
      gh = "https://github.com/{}";
      ghs = "https://github.com/search?o=desc&q={}&s=stars";
      nsi = "https://nyaa.si/?q={}";
      yt = "https://www.youtube.com/results?search_query={}";
      nw = "https://wiki.nixos.org/index.php/?search={}";
    };

    settings = {
      tabs = {
        title.format = "{audio}{current_title}";
        show = "multiple";
        indicator.width = 0; # No tab indicators
        width = "7%";
      };
      fonts = {
        default_family = [ "${userSettings.font}" ];
        default_size = "10pt";
        web = {
          family = {
            fixed = "monospace";
            sans_serif = "monospace";
            serif = "monospace";
            standard = "monospace";
          };
          size.default = 16;
        };
      };
      content = {
        blocking = {
          enabled = true;
          method = "adblock";
          adblock.lists = [
            "https://github.com/ewpratten/youtube_ad_blocklist/blob/master/blocklist.txt"
            "https://github.com/uBlockOrigin/uAssets/raw/master/filters/legacy.txt"
            "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters.txt"
            "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2020.txt"
            "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2021.txt"
            "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2022.txt"
            "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2023.txt"
            "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2024.txt"
            "https://github.com/uBlockOrigin/uAssets/raw/master/filters/badware.txt"
            "https://github.com/uBlockOrigin/uAssets/raw/master/filters/privacy.txt"
            "https://github.com/uBlockOrigin/uAssets/raw/master/filters/badlists.txt"
            "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances.txt"
            "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances-cookies.txt"
            "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances-others.txt"
            "https://github.com/uBlockOrigin/uAssets/raw/master/filters/badlists.txt"
            "https://github.com/uBlockOrigin/uAssets/raw/master/filters/quick-fixes.txt"
            "https://github.com/uBlockOrigin/uAssets/raw/master/filters/resource-abuse.txt"
            "https://github.com/uBlockOrigin/uAssets/raw/master/filters/unbreak.txt"
          ];
        };
        geolocation = false;
        cookies = {
          accept = "all";
          store = true;
        };
      };
      colors = {
        webpage = {
          darkmode = {
            enabled = true;
            algorithm = "lightness-cielab";
            policy.images = "never";
          };
        };
      };
      scrolling.smooth = true;
    };
    extraConfig = ''
      c.tabs.padding = {"top": 5, "bottom": 5, "left": 9, "right": 9}
    '';
    perDomainSettings = {
      "file://*".colors.webpage.darkmode.enabled = false;

      "*.sparx-learning.com/*".colors.webpage.darkmode.enabled = false;

      "qute://*".fonts.web.family.serif = "${userSettings.font}";
    };
    quickmarks = {
      Caelestia-dots = "https://github.com/caelestia-dots/shell";
      Awesome = "https://github.com/sindresorhus/awesome#contents";
      desmos = "https://www.desmos.com/scientific";
      catppuccin = "https://catppuccin.com/ports";
      mynixos = "https://mynixos.com";
    };
  };
}
