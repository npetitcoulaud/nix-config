{ ... }:

{
  programs.kitty = {
    enable = true;
    extraConfig = builtins.readFile ./kitty.conf;
    catppuccin.enable = false;
  };
}