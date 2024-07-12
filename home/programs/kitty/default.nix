{ ... }:

{
  programs = {
    fish = { shellAliases = { s = "kitten ssh"; }; };
    kitty = {
      enable = true;
      extraConfig = builtins.readFile ./kitty.conf;
      catppuccin.enable = false;
    };
  };
}
