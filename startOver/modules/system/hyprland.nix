{ pkgs, inputs, ... }:

{
  time.timeZone = "America/New_York";

  # Hyprland 
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };

  # Display Manager
  programs.regreet.enable = true;
  services.greetd.enable = true;

  environment.systemPackages = with pkgs; [
    kitty
    git
    neovim
    vim
    btop
    nautilus
    vscodium
    nixfmt
    firefox
  ];
}
