{ config, pkgs, ... }:

{

  programs.eza = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = false;
    icons = "always";
  };

  programs.zsh.plugins =
    if config.programs.zsh.enable then
      [
        {
          name = "zsh-eza";
          file = "zsh-eza.plugin.zsh";
          src = pkgs.fetchFromGitHub {
            owner = "z-shell";
            repo = "zsh-eza";
            rev = "fe7898e09e6d1f3c3c34570e0950803bf516e179";
            hash = "sha256-sWCLS7srYo6/OyemUSdtU57FrupIxPmxAjU0RIGbs/U=";
          };
        }
      ]
    else
      config.programs.zsh.plugins;

  programs.yazi = {
    enable = true;
    # flavors =
    # plugins =
  };
}
