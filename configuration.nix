{ config, pkgs, inputs, ... }:

{
    imports = [
        ./hardware-configuration.nix
    ];

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.loader.systemd-boot.configurationLimit = 5;

    networking.hostName = "nixos";
    networking.networkmanager.enable = true;

    time.timeZone = "America/New_York";

    i18n.defaultLocale = "en_US.UTF-8";

    hardware.bluetooth.enable = true;

    services.xserver.enable = true;
    services.upower.enable = true;
    services.displayManager.gdm.enable = true;
    services.blueman.enable = true;

    programs.hyprland.enable = true;

    users.users.vortex = {
        isNormalUser = true;
        extraGroups = [ "wheel" ];
        initialPassword = "password";
    };

    fonts.packages = with pkgs; [
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-color-emoji
        nerd-fonts.jetbrains-mono
    ];

    environment.systemPackages = with pkgs; [
    	hyprland
        kitty
        git
        psmisc
        neovim
        bluez
        bluez-tools
        blueman
        networkmanagerapplet
        pavucontrol
        nautilus
        btop
        python3
        python3Packages.pip
        inputs.zen-browser.packages.${pkgs.system}.default
        bibata-cursors
    ];

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    system.stateVersion = "25.05";
}
