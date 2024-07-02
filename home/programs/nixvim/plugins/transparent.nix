{ ... }:

{
  programs.nixvim.plugins.transparent = {
    enable = true;
    settings = {
      exclude_groups = [ ];
      extra_groups = [ "NvimTreeNormal" "NvimTreeEndOfBuffer" ];
    };
  };
}
