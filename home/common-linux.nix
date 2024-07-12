{ pkgs, openfortivpn-webview-qt, system, ... }:

{
  imports = [ ./common.nix ];

  programs.firefox.enable = true;

  home.packages = with pkgs; [
    vesktop
    teams-for-linux
    inetutils
    libreoffice
    nfs-utils
    gimp
    google-chrome
    vlc
    openfortivpn-webview-qt.packages.${system}.default
  ];
}
