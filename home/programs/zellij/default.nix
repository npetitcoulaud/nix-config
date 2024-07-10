{ ... }:

{
  programs.zellij = {
    enable = true;
    enableFishIntegration = true;
    catppuccin.enable = true;
    settings = {
      on_force_close = "quit";
      ui = { pane_frames = { rounded_corners = true; }; };
    };
  };
}
