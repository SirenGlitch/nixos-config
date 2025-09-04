{ userSettings, ... }:

{
  hardware.openrazer = {
    enable = true;
    users = [
      userSettings.username
    ];
  };
}
