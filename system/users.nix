{ ... }:

{
  users.users.npetitcoulaud = {
    isNormalUser = true;
    home = "/home/npetitcoulaud";
    description = "Nicolas Petitcoulaud";
    extraGroups = [ "wheel" "audio" "docker" "scanner" "lp" "vboxusers" ];
    createHome = true;
  };
}
