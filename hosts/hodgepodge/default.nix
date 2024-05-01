{ config, inputs, pkgs, ...}: {

  imports = [
    inputs.disko.nixosModules.disko
    inputs.nur.nixosModules.nur
    ./disks.nix
    ./hardware-configuration.nix
    ../common
  ];

  boot = {
    kernelParams = [
      "quiet"
      "video=DP-3:2560x1440@120"
      "video=DP-2:2560x1440@120"
      "video=HDMI-1:2560x1440@120"
      "amdgpu.sg_display=0"
    ];
  };

  host = {
    container = {
      restic = {
        enable = true;
        logship = "false";
        monitor = "false";
      };
      socket-proxy = {
        enable = true;
        logship = "false";
        monitor = "false";
      };
      tinc = {
        enable = true;
        logship = "false";
        monitor = "false";
      };
      traefik = {
        enable = true;
        logship = "false";
        monitor = "false";
      };
    };
    feature = {
      gaming = {
        gamemode.enable = false;
        gamescope.enable = false;
        heroic.enable = false;
        steam = {
          enable = false;
          protonGE = false;
        };
      };
      graphics = {
        enable = true;
        backend = "wayland";
        displayManager.manager = "sddm";
        windowManager.manager = "hyprland";
      };
      virtualization = {
        flatpak.enable = true;
        waydroid.enable = true;
      };
    };
    filesystem = {
      bcachefs.enable = true;
      encryption.enable = false;
      exfat.enable = true;
      ntfs.enable = true;
      swap = {
        partition = "disk/by-label/disk-main-swap";
      };
      tmp.tmpfs.enable = true;
    };
    hardware = {
      cpu = "amd";
      gpu = "integrated-amd";
      keyboard.enable = true;
      raid.enable = false;
      sound = {
        server = "pipewire";
      };
    };
    network = {
      hostname = "hodgepodge";
      vpn = {
        zerotier = {
          enable = true;
          networks = [
            "/var/run/secrets/zerotier/networks"
          ];
          port = 9994;
        };
      };
    };
    role = "desktop";
    user = {
      ekan.enable = true;
      root.enable = true;
    };
  };
}
