{ ... }:

{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    globals.mapleader = " ";
    opts = {
      tabstop = 2;
      shiftwidth = 2;
      expandtab = false;
    };
    colorschemes.catppuccin = {
      enable = true;
      settings = {
        color_overrides = { mocha = { base = "#1e1e2f"; }; };
        disable_underline = true;
        flavour = "mocha";
        integrations = {
          cmp = true;
          gitsigns = true;
          notify = false;
          nvimtree = true;
          treesitter = true;
          telescope.enabled = true;
          dashboard = true;
        };
        styles = {
          booleans = [ "bold" "italic" ];
          conditionals = [ "bold" ];
        };
        term_colors = true;
      };
    };
  };

  imports = [
    ./plugins/telescope.nix
    ./plugins/treesitter.nix
    ./plugins/lualine.nix
    ./plugins/nvim-tree.nix
    ./plugins/cmp.nix
    ./plugins/conform.nix
    ./plugins/lsp.nix
    ./plugins/comment.nix
    ./plugins/gitsigns.nix
    ./plugins/bufferline.nix
    ./plugins/nvim-colorizer.nix
    ./plugins/transparent.nix
    ./plugins/dashboard.nix
  ];
}
