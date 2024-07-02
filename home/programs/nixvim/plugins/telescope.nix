{ ... }:

{
  programs.nixvim.plugins.telescope = {
    enable = true;
    keymaps = {
      "<leader>ff" = "find_files";
      "<leader>fg" = "live_grep";
    };
    settings = {
      defaults = {
        sorting_strategy = "ascending";
        layout_config = { prompt_position = "top"; };
      };
    };
  };
}
