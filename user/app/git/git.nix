{ userSettings, ... }:

{

  imports = [
    ./lazygit.nix # Enables lazygit
  ];

  programs.git = {
    enable = true;
    userEmail = userSettings.email;
    userName = userSettings.username;
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
