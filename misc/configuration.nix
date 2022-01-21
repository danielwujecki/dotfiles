# Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  system.stateVersion = "21.11";

  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader.grub.enable                 = true;
  boot.loader.grub.device                 = "nodev";
  boot.loader.grub.efiSupport             = true;
  boot.loader.grub.efiInstallAsRemovable  = true;

  networking.hostName = "NixOSVM";
  time.timeZone       = "Europe/Berlin";
  i18n.defaultLocale  = "en_US.UTF-8";
  console = {
    font    = "Lat2-Terminus16";
    keyMap  = "us";
  };
  
  networking.interfaces.enp1s0.useDHCP  = true;
  networking.firewall.enable            = false;

  services.openssh.enable = true;

  users.users.daniel = {
    isNormalUser  = true;
    extraGroups   = [ "wheel" ];
  };

  environment.systemPackages = with pkgs; [
    neovim
    wget
  ];
}
