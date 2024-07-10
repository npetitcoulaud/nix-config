{ username, ... }:

{
  home = {
    username = username;
    homeDirectory = "/Users/" + username;
    stateVersion = "24.05";
  };

  imports = [
    ../../home/common.nix
    ../../home/programs/kitty
    ../../home/programs/nixvim
    ../../home/programs/starship
    ../../home/programs/vscode
    ../../home/programs/zellij
  ];
}
