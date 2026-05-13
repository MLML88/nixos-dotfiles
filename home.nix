{ config, pkgs, ... }:

{
  home.username = "vortex";
  home.homeDirectory = "/home/vortex";

  home.stateVersion = "25.05";

  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      monitor = ",preferred,auto,1";

      exec-once = [
        "waybar"
      ];

      input = {
        kb_layout = "us";
      };

      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
      };

      decoration = {
        rounding = 6;
      };

      misc = {
        force_default_wallpaper = 0;
      };

      bind = [
        "SUPER,Q,exec,kitty"
        "SUPER,M,exit"
      ];
    };
  };

  programs.kitty.enable = true;
  programs.waybar.enable = true;

  home.packages = with pkgs; [
    firefox
  ];

  programs.home-manager.enable = true;
}
