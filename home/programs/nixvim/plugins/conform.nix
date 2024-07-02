{ pkgs, ... }:

{
  programs.nixvim.plugins.conform-nvim = {
    enable = true;
    formatOnSave = {
      timeoutMs = 500;
      lspFallback = true;
    };
    formatters = {
      nixfmt = { command = "${pkgs.nixfmt-classic}/bin/nixfmt"; };
    };
    formattersByFt = { nix = [ "nixfmt" ]; };
  };
}
