{ ... }:

{
  programs.nixvim = {
    keymaps = [
      {
        action = "<cmd>BufferLineCycleNext<cr>";
        mode = [ "n" ];
        key = "<tab>";
        options.silent = true;
      }
      {
        action = "<cmd>BufferLineCyclePrev<cr>";
        mode = [ "n" ];
        key = "<S-tab>";
        options.silent = true;
      }
    ];
    plugins.bufferline = {
      enable = true;
      offsets = [{
        filetype = "NvimTree";
        text = "File Explorer";
        highlight = "Directory";
        separator = true;
      }];
    };
  };
}
