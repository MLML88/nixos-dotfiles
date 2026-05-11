{ config, pkgs, hyprland, ... }:

{
  home.username = "vortex";
  home.homeDirectory = "/home/vortex";

  home.stateVersion = "25.05";

  programs.git.enable = true;

  programs.kitty.enable = true;

  wayland.windowManager.hyprland = {
    enable = true;

    package =
      hyprland.packages.${pkgs.system}.hyprland;

    portalPackage =
      hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
  };

  programs.bash = {
    enable = true;

    shellAliases = {
      btw = "echo i use nixos, btw";
    };

    profileExtra = ''
      if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
        exec uwsm start hyprland
      fi
    '';
  };
}
