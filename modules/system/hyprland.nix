{ pkgs, inputs, ... }:

{
    time.timeZone = "America/New_York";

    i18n.defaultLocale = "en_US.UTF-8";

    services.xserver.enable = true;
    services.upower.enable = true;
    services.displayManager.gdm.enable = true;

    programs.hyprland.enable = true;

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
        neovim
        inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
        btop
        psmisc
        nautilus
        python3
        python3Packages.pip
        bibata-cursors
    ];
}
