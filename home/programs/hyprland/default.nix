{ pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = ''
      bind = $mainMod, Z, submap, resize
      submap = resize
      binde = ,right,resizeactive,10 0
      binde = ,left,resizeactive,-10 0
      binde = ,up,resizeactive,0 -10
      binde = ,down,resizeactive,0 10
      bind = ,escape,submap,reset
      submap = reset
    '';
    settings = {
      general = {
        border_size = 2;
        gaps_in = 5;
        gaps_out = 10;
        "col.active_border" = "$mauve $lavender 45deg";
        "col.inactive_border" = "rgba(595959aa)";
        resize_on_border = false;
        allow_tearing = false;
        layout = "dwindle";
      };
      decoration = {
        rounding = 10;
        active_opacity = 1.0;
        inactive_opacity = 1.0;
        drop_shadow = true;
        shadow_range = 4;
        shadow_render_power = 3;
        "col.shadow" = "rgba(1a1a1aee)";
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          vibrancy = 0.1696;
        };
      };
      animations = {
        enabled = true;
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };
      input = {
        kb_layout = "fr";
        numlock_by_default = true;
        sensitivity = -0.5;
      };
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };
      misc = { disable_hyprland_logo = true; };
      master = { new_status = "master"; };
      monitor = [ "DP-1,1920x1080,0x0, 1" "HDMI-A-1,1920x1080,1920x0, 1" ];
      exec-once = [
        "waybar"
        "dunst"
        "copyq --start-server"
        "${pkgs.kdePackages.polkit-kde-agent-1}/libexec/polkit-kde-authentication-agent-1"
      ];
      "$terminal" = "kitty";
      "$fileManager" = "nautilus";
      "$menu" = "rofi -show drun";
      "$mainMod" = "SUPER";
      bind = [
        "$mainMod, Q, exec, $terminal"
        "$mainMod, C, killactive,"
        "$mainMod, M, exit,"
        "$mainMod, E, exec, $fileManager"
        "$mainMod, V, togglefloating,"
        "$mainMod, R, exec, $menu"
        "$mainMod, P, pseudo,"
        "$mainMod, J, togglesplit,"
        "$mainMod, L, exec, hyprlock"
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"
        "$mainMod SHIFT, left, swapwindow, l"
        "$mainMod SHIFT, right, swapwindow, r"
        "$mainMod SHIFT, up, swapwindow, u"
        "$mainMod SHIFT, down, swapwindow, d"
        "$mainMod, code:10, workspace, 1"
        "$mainMod, code:11, workspace, 2"
        "$mainMod, code:12, workspace, 3"
        "$mainMod, code:13, workspace, 4"
        "$mainMod, code:14, workspace, 5"
        "$mainMod, code:15, workspace, 6"
        "$mainMod, code:16, workspace, 7"
        "$mainMod, code:17, workspace, 8"
        "$mainMod, code:18, workspace, 9"
        "$mainMod, code:19, workspace, 10"
        "$mainMod SHIFT, code:10, movetoworkspace, 1"
        "$mainMod SHIFT, code:11, movetoworkspace, 2"
        "$mainMod SHIFT, code:12, movetoworkspace, 3"
        "$mainMod SHIFT, code:13, movetoworkspace, 4"
        "$mainMod SHIFT, code:14, movetoworkspace, 5"
        "$mainMod SHIFT, code:15, movetoworkspace, 6"
        "$mainMod SHIFT, code:16, movetoworkspace, 7"
        "$mainMod SHIFT, code:17, movetoworkspace, 8"
        "$mainMod SHIFT, code:18, movetoworkspace, 9"
        "$mainMod SHIFT, code:19, movetoworkspace, 10"
        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"
        "$mainMod, F, fullscreen"
        ", XF86AudioRaiseVolume, exec, pamixer -i 5"
        ", XF86AudioLowerVolume, exec, pamixer -d 5"
        ", XF86AudioMicMute, exec, pamixer --default-source -m"
        ", XF86AudioMute, exec, pamixer -t"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPrev, exec, playerctl previous"
        "$mainMod, PRINT, exec, hyprshot -m window"
        ", PRINT, exec, hyprshot -m output"
        "$shiftMod, PRINT, exec, hyprshot -m region"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      windowrulev2 = [
        "suppressevent maximize, class:.*"
        "float,class:(pavucontrol|blueberry|org.keepassxc.KeePassXC|org.gnome.Nautilus|eog)"
        "workspace 3,title:^(Outlook)(.*)$"
        "workspace 4,class:(teams-for-linux|Slack|vesktop)"
      ];

      workspace = [
        "1, monitor:DP-1, default:true"
        "2, monitor:HDMI-A-1, default:true"
        "3, monitor:DP-1"
        "4, monitor:HDMI-A-1"
      ];
    };
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
      shellInit = ''
        set -x SSH_AUTH_SOCK $XDG_RUNTIME_DIR/ssh-agent.socket
      '';
    };
  };

  services = {
    hyprpaper = {
      enable = true;
      settings = {
        preload = [ "~/.wallpapers/nix.png" ];
        wallpaper = [ ",~/.wallpapers/nix.png" ];
      };
    };
    hypridle = {
      enable = true;
      settings = {
        general = {
          lock_cmd = "pidof hyprlock || hyprlock";
          before_sleep_cmd = "loginctl lock-session";
          after_sleep_cmd = "hyprctl dispatch dpms on";
        };
        listener = [
          {
            timeout = 300;
            on-timeout = "loginctl lock-session";
          }
          {
            timeout = 1200;
            on-timeout = "systemctl suspend";
          }
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
    kdePackages.qtwayland
    hyprshot
    pamixer
    playerctl
    pavucontrol
    copyq
    gnome.nautilus
    gnome.eog
    gnome.simple-scan
    gnome.evince
  ];
}
