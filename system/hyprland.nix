{ pkgs, ... }:

{
  # Environment
  environment = { sessionVariables.NIXOS_OZONE_WL = "1"; };

  # Programs
  programs = {
    dconf.enable = true;
    hyprland.enable = true;
  };

  # Security
  security.polkit.enable = true;

  # Environment
  environment.systemPackages = with pkgs;
    [
      (catppuccin-sddm.override {
        flavor = "mocha";
        font = "Cascadia Mono";
        fontSize = "11";
        background =
          "${../home/wallpapers/wallpapersden.com_one-piece-zoro-hd-manga-art_2371x1080.jpg}";
      })
    ];

  # Services
  services = {
    xserver = {
      enable = true;
      xkb.layout = "fr";
    };
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      theme = "catppuccin-mocha";
      package = pkgs.kdePackages.sddm;
    };
  };
}
