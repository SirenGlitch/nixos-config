{ config, inputs, ... }:

{
  home.persistence."/persist" = {
    directories = [
      "Pictures"
      {
        directory = ".gnupg";
        mode = "0700";
      }
      {
        directory = ".ssh";
        mode = "0700";
      }
      "nixstuff"
    ];
  };
}
