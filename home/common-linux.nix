{ pkgs, npepkgs, system, ... }:

{
  imports = [ ./common.nix ];

  programs.firefox.enable = true;

  home.packages = with pkgs; [
    vesktop
    zoom-us
    teams-for-linux
    inetutils
    libreoffice
    nfs-utils
    gimp
    google-chrome
    vlc
    npepkgs.packages.${system}.openfortivpn-webview-qt
    corefonts
    vistafonts
    #openfortivpn-webview-qt.packages.${system}.default

  ];
}
