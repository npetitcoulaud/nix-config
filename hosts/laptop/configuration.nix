{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../system
    ../../system/users.nix
    ../../system/hyprland.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  networking.hostName = "laptop-de-nicolas";

  system.stateVersion = "24.05";
}
