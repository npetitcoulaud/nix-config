{ pkgs, username, ... }:

{

  imports = [ ./programs/fish ./programs/btop ./programs/k9s ];

  programs = {
    direnv.enable = true;
    git = {
      enable = true;
      userName = "Nicolas Petitcoulaud";
      userEmail = "nicolas.petitcoulaud@aqr8.fr";
    };
    firefox.enable = true;
  };

  fonts.fontconfig.enable = true;

  home = {
    username = username;
    homeDirectory = "/home/" + username;
    stateVersion = "23.11";
    packages = with pkgs; [
      # Tools
      keepassxc
      wget
      jq
      unzip
      lens
      bat
      yq-go
      ldns
      ipcalc
      openssl

      # Fonts
      nerdfonts
      cascadia-code

      # Soft
      openfortivpn
      google-chrome
      wireshark
      drawio
      spotify
      vlc
      slack
    ];

    file.".wallpapers" = {
      source = ./wallpapers;
      recursive = true;
    };
  };
}
