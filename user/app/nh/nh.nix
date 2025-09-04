{ userSettings, ... }:

{
  programs.nh = {
    enable = true;
    flake = userSettings.dotfilesDir;
  };
}
