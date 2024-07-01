{ pkgs, config, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../system
    ../../system/users.nix
    ../../system/hyprland.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware = {
    nvidia = {
      modesetting.enable = true;
      nvidiaSettings = false;
    };
    opengl.driSupport32Bit = true;
  };

  system.stateVersion = "23.11";
}
