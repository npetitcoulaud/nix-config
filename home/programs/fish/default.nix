{ ... }:

{
  programs.fish = {
    enable = true;
    shellInit = ''
      fish_config theme choose "dracula"
    '';
  };

  home.file."fish_dracula_theme" = {
    source = ./themes/dracula.theme;
    target = ".config/fish/themes/dracula.theme";
  };
}
