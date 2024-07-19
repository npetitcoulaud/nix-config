{ pkgs, ... }:

{
  imports = [ ./users.nix ];

  # Boot
  boot = {
    tmp.cleanOnBoot = true;
    kernelPackages = pkgs.linuxPackages_6_8;
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    initrd = {
      kernelModules = [ "usb_storage" ];
      luks.devices."nixos" = {
        allowDiscards = true;
        keyFileSize = 4096;
        fallbackToPassword = true;
      };
    };
  };

  # Environment
  environment = { systemPackages = with pkgs; [ vim ]; };

  # FileSystems
  fileSystems = {
    "/".options = [ "compress=zstd" ];
    "/home".options = [ "compress=zstd" ];
  };
  zramSwap.enable = true;

  # Hardware
  hardware = {
    opengl = {
      enable = true;
      driSupport = true;
    };

    # bluetooth
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };

    # Scanner
    sane = {
      enable = true;
      extraBackends = [ pkgs.hplipWithPlugin ];
    };
  };

  # Networking
  networking = {
    networkmanager = {
      enable = true;
      dns = "systemd-resolved";
    };
  };

  # Programs
  programs = {
    fish.enable = true;
    bash = {
      interactiveShellInit = ''
        if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
        then
          shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
          exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
        fi
      '';
    };
  };

  # Services
  services = {
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
    printing = {
      enable = true;
      drivers = with pkgs; [ hplipWithPlugin ];
    };
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
      wireplumber.extraConfig = {
        "monitor.bluez.properties" = {
          "bluez5.enable-sbc-xq" = true;
          "bluez5.enable-msbc" = true;
          "bluez5.enable-hw-volume" = true;
          "bluez5.roles" = [ "hsp_hs" "hsp_ag" "hfp_hf" "hfp_ag" ];
        };
      };

    };
    resolved = {
      enable = true;
      extraConfig = ''
        [Resolve]
        DNS=10.30.0.73 10.30.0.74 10.30.0.75
        Domains=~oodrive.group
      '';
    };
    rpcbind.enable = true;
  };

  # Security
  security.rtkit.enable = true;

  # TimeZone and Language
  time.timeZone = "Europe/Paris";
  i18n.defaultLocale = "fr_FR.UTF-8";
  console.keyMap = "fr";

  # Virtualisation
  virtualisation = {
    docker = {
      enable = true;
      storageDriver = "btrfs";
    };

    virtualbox.host = {
      enable = true;
      enableExtensionPack = true;
    };
  };
}
