{ config, inputs, pkgs, ...}: {

  imports = [
    inputs.disko.nixosModules.disko
    inputs.nur.nixosModules.nur
    ./disks.nix
    ../common
  ];

  host = {
    feature = {
      graphics = {
        enable = true;
        backend = "x";
      };
    };
    filesystem = {
      encryption.enable = true;             # This line can be removed if not needed as it is already default set by the role template
      impermanence.enable = true;           # This line can be removed if not needed as it is already default set by the role template
      swap = {
        partition = "disk/by-partlabel/swap";
      };
    };
    hardware = {
      cpu = "amd-vm";
      gpu = "integrated-amd";
      raid.enable = false;                  # This line can be removed if not needed as it is already default set by the role template
      sound = {
        server = "pulseaudio";
      };
    };
    network = {
      hostname = "desktop-template";
    };
    role = "desktop";
    user = {
      root.enable = true;
      ekan.enable = true;
    };
  };
}
