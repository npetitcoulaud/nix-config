{ pkgs, ... }:

{
  imports = [ ./common.nix ];

  programs.firefox.enable = true;

  home.packages = with pkgs; [
    webcord
    teams-for-linux
    inetutils
    libreoffice
    nfs-utils
    gimp
    google-chrome
    vlc
  ];
}
