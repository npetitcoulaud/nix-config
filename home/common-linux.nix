{ pkgs, ... }:

{
  imports = [ ./common.nix ];

  home.packages = with pkgs; [
    webcord
    teams-for-linux
    inetutils
    libreoffice
    nfs-utils
    gimp
  ];
}
