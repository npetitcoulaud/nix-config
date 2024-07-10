{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../system
    ../../system/users.nix
    ../../system/hyprland.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.initrd.kernelModules = [ "amdgpu" ];
  hardware.opengl.extraPackages = with pkgs; [ amdvlk ];
  hardware.cpu.amd.updateMicrocode = true;

  networking.hostName = "pc-de-nicolas";

  system.stateVersion = "24.05";
}
