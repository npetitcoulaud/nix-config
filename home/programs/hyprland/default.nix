{ pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = builtins.readFile ./hyprland.conf;
    catppuccin.enable = true;
  };

  catppuccin.flavor = "mocha";

  gtk = {
    enable = true;
    theme = {
      package = pkgs.sweet;
      name = "Sweet-Ambar-Blue-v40";
    };
    iconTheme = {
      package = pkgs.candy-icons;
      name = "candy-icons";
    };
  };

  programs = {
    hyprlock = {
      enable = true;
      settings = {
        general = {
          disable_loading_bar = true;
          grace = 5;
          hide_cursor = true;
        };

        background = [{
          path = "${pkgs.hyprland}/share/hyprland/wall0.png";
          blur_passes = 0;
        }];

        input-field = [{
          size = "200, 50";
          position = "0, -200";
          monitor = "";
          dots_center = true;
          fade_on_empty = false;
          front_color = "rgba(158, 158, 158)";
          inner_color = "rgb(255, 255, 255)";
          outer_color = "rgb(24, 25, 38)";
          outline_thickness = 5;
          placeholder_text = "<i>Password...</i>";
          shadow_passes = 2;
        }];

        label = [
          {
            monitor = "";
            text = "$TIME";
            font_size = 30;
            halign = "center";
            valign = "center";
            position = "0, 200";
          }
          {
            monitor = "";
            text = "$USER";
            font_size = 20;
            halign = "center";
            valign = "center";
            position = "0, -150";
          }

        ];
      };
    };
    fish = {
      shellAliases = { ssh = "kitten ssh"; };
      shellInit = ''
        set -x SSH_AUTH_SOCK $XDG_RUNTIME_DIR/ssh-agent.socket
      '';
    };
  };

  services = {
    hyprpaper = {
      enable = true;
      settings = {
        preload = [
          "~/.wallpapers/anime-girl-dj-4k-wallpaper-uhdpaper.com-905@0@i.jpg"
        ];
        wallpaper = [
          ",~/.wallpapers/anime-girl-dj-4k-wallpaper-uhdpaper.com-905@0@i.jpg"
        ];
      };
    };
  };

  systemd.user.services.ssh-agent = {
    Unit.Description = "SSH Agent";
    Service = {
      Type = "simple";
      Environment = [ "SSH_AUTH_SOCK=%t/ssh-agent.socket" ];
      ExecStart = "${pkgs.openssh}/bin/ssh-agent -D -a $SSH_AUTH_SOCK";
    };
    Install.WantedBy = [ "default.target" ];
  };

  home.packages = with pkgs; [
    blueberry
    hyprcursor
    kdePackages.polkit-kde-agent-1
    pamixer
    playerctl
    pavucontrol
    xfce.thunar
    gnome.nautilus
    gnome.eog
    gnome.simple-scan
    gnome.evince
    copyq
  ];
}
