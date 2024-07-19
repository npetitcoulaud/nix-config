{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../system
    ../../system/users.nix
    ../../system/hyprland.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  networking.hostName = "pc-de-nicolas";

  # AMD Drivers
  services.xserver = {
    enable = true;
    videoDrivers = [ "amdgpu" ];
  };
  boot.initrd.kernelModules = [ "amdgpu" ];
  hardware = {
    cpu.amd.updateMicrocode = true;
    opengl = {
      extraPackages = with pkgs; [ amdvlk rocmPackages.clr.icd ];
      extraPackages32 = [ pkgs.driversi686Linux.amdvlk ];
      driSupport = true;
      driSupport32Bit = true;
    };
  };
  environment.variables.AMD_VULKAN_ICD = "RADV";

  # KeyFile
  boot.initrd.luks.devices."nixos".keyFile = "/dev/sdb";

  system.stateVersion = "24.05";
}
