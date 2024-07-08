{ pkgs, ... }:

{

  imports = [ ./programs/fish ./programs/btop ./programs/k9s ];

  programs = {
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
    git = {
      enable = true;
      userName = "Nicolas Petitcoulaud";
      userEmail = "nicolas.petitcoulaud@aqr8.fr";
    };
  };

  fonts.fontconfig.enable = true;

  home = {
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
      wireshark
      drawio
      spotify
      slack
    ];

    file.".wallpapers" = {
      source = ./wallpapers;
      recursive = true;
    };
  };
}
