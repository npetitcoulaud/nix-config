{ pkgs, ... }:

{
  programs.nixvim = {
    plugins = {
      cmp = {
        enable = true;
        settings = {
          mapping = {
            "<C-Space>" = "cmp.mapping.complete()";
            "<C-d>" = "cmp.mapping.scroll_docs(-4)";
            "<C-e>" = "cmp.mapping.close()";
            "<C-f>" = "cmp.mapping.scroll_docs(4)";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<S-Tab>" =
              "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
            "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
          };
          snippet = {
            expand =
              ''function(args) vim.fn["vsnip#anonymous"](args.body) end'';
          };
          sources = [
            { name = "nvim_lsp"; }
            { name = "vsnip"; }
            { name = "path"; }
            { name = "buffer"; }
          ];
        };
      };
      cmp-nvim-lsp.enable = true;
      cmp-buffer.enable = true;
      cmp-path.enable = true;
      cmp-cmdline.enable = true;
      cmp-vsnip.enable = true;
    };
    extraPlugins = with pkgs.vimPlugins; [ vim-vsnip ];
  };
}
