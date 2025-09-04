{ ... }:

{
  programs.vesktop = {
    enable = true;
    settings = {
      discordBranch = "canary";
      minimizeToTray = true;
      arRPC = true;
      splashColor = "#EFEFF0";
      enableMenu = true;
      customTitleBar = true;
    };
  };
}
