{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    withNodeJs = true;
    extraPackages = with pkgs; [
      gcc
      gnumake
      cargo
      ripgrep
      fd
      tree-sitter
      nixfmt-classic
    ];
    extraLuaConfig = builtins.readFile ./config/config.lua;
    plugins = with pkgs.vimPlugins; [
      {
        plugin = telescope-nvim;
        type = "lua";
        config = builtins.readFile ./config/telescope.lua;
      }
      {
        plugin = nvim-tree-lua;
        type = "lua";
        config = builtins.readFile ./config/nvim-tree.lua;
      }
      {
        plugin = lualine-nvim;
        type = "lua";
        config = builtins.readFile ./config/lualine.lua;
      }
      {
        plugin = mason-nvim;
        type = "lua";
        config = builtins.readFile ./config/mason.lua;
      }
      {
        plugin = nvim-treesitter.withAllGrammars;
        type = "lua";
        config = builtins.readFile ./config/nvim-treesitter.lua;
      }
      {
        plugin = mason-lspconfig-nvim;
        type = "lua";
        config = builtins.readFile ./config/mason-lspconfig.lua;
      }
      {
        plugin = nvim-cmp;
        type = "lua";
        config = builtins.readFile ./config/nvim-cmp.lua;
      }
      {
        plugin = cmp-nvim-lsp;
        type = "lua";
        config = builtins.readFile ./config/cmp-nvim-lsp.lua;
      }
      {
        plugin = conform-nvim;
        type = "lua";
        config = ''
          require("conform").setup({
             format_on_save = {
                 timeout_ms = 500,
                 lsp_fallback = true,
             },
             formatters_by_ft = {
             	nix = {"nixfmt"},
                 jsonc = {"jq"},
             },
             formatters = {
          	nixfmt = {
          		command = "${pkgs.nixfmt-classic}/bin/nixfmt";
          	}
             }
          })
          	 '';
      }
      {
        plugin = catppuccin-nvim;
        type = "lua";
        config = builtins.readFile ./config/catppuccin-nvim.lua;
      }
      {
        plugin = barbar-nvim;
        type = "lua";
        config = builtins.readFile ./config/barbar-nvim.lua;
      }
      nvim-lspconfig
      cmp-buffer
      cmp-path
      cmp-cmdline
      cmp-vsnip
      vim-vsnip
      nvim-web-devicons
    ];
    viAlias = true;
    vimAlias = true;
  };
}
