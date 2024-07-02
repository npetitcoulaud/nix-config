{ ... }:

{
  programs.nixvim.plugins.lsp = {
    enable = true;
    servers = {
      nil-ls.enable = true;
      terraformls = {
        enable = true;
        cmd = [
          "/home/npetitcoulaud/.local/share/nvim/mason/bin/terraform-ls"
          "serve"
        ];
      };
      gopls.enable = true;
      yamlls.enable = true;
      #rust-analyzer.enable = true;
      jsonls.enable = true;
      helm-ls.enable = true;
      dockerls.enable = true;
      cssls.enable = true;
      bashls.enable = true;
      ansiblels.enable = true;
      html.enable = true;
      lua-ls.enable = true;
      nginx-language-server.enable = true;
      phpactor.enable = true;
      pyright.enable = true;
      #tflint.enable = true;
      tsserver.enable = true;
    };
  };
}
