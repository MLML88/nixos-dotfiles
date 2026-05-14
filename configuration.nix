{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "America/New_York";

  i18n.defaultLocale = "en_US.UTF-8";

  services.xserver.enable = true;

  services.displayManager.gdm.enable = true;

  programs.hyprland.enable = true;

  users.users.vortex = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    initialPassword = "password";
  };

  environment.systemPackages = with pkgs; [
    kitty
    waybar
    dmenu
    git
    neovim
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "25.05";
}
