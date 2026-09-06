{ pkgs, inputs, ... }:

{
  time.timeZone = "America/New_York";

  i18n.defaultLocale = "en_US.UTF-8";

  services.xserver.enable = true;
  services.upower.enable = true;
  services.displayManager.gdm.enable = true;

  # Hyprland
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };

  # Display Manager
  services.displayManager.regreet.enable = true;
  services.greetd.enable = true;

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    nerd-fonts.jetbrains-mono
    source-han-sans
    source-han-serif
  ];

  environment.systemPackages = with pkgs; [
    kitty
    git
    neovim
    vim
    chromium
    btop
    psmisc
    nautilus
    python3
    python3Packages.pip
    bibata-cursors
    vscodium
    nixfmt
  ];
}
