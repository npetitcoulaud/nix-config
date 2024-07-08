{ username, ... }:

{
  home = {
    username = username;
    homeDirectory = "/home/" + username;    
  };

  imports = [
    ../../home/common-linux.nix
    ../../home/hyprland.nix
    ../../home/programs/nixvim
    ../../home/programs/starship
    ../../home/programs/zellij
  ];
}
