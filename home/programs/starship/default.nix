{ ... }:

{
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      aws = {
        symbol = "  ";
        style = "bold #ffb86c";
      };
      cmd_duration.style = "bold #f1fa8c";
      directory = {
        read_only = " 󰌾";
        style = "bold #50fa7b";
      };
      docker_context.symbol = " ";
      git_branch = {
        symbol = " ";
        style = "bold #ff79c6";
      };
      git_status.style = "bold #ff5555";
      username = {
        format = "[$user]($style) on ";
        style_user = "bold #bd93f9";
      };
      character = {
        success_symbol = "[λ](bold #50fa7b)";
        error_symbol = "[λ](bold #ff5555)";
      };
      golang.symbol = " ";
      kubernetes = {
        disabled = false;
        style = "bold #bd93f9";
      };
      nix_shell.symbol = " ";
      nodejs.symbol = " ";
      package.symbol = "󰏗 ";
      php.symbol = " ";
      python.symbol = " ";
      rust.symbol = " ";
      terraform.symbol = "󱁢 ";
    };
  };
}
