{ config, pkgs, ... }:

let
  dotfiles = "${config.home.homeDirectory}/mydotfiles/MLML/.config";
  link = path: config.lib.file.mkOutOfStoreSymlink path;
  configs = {
    hypr = "hypr"; # Need to symlink up first before the lsp language servers
    quickshell = "quickshell";
    rofi = "rofi";
    wlogout = "wlogout";
    fcitx5 = "fcitx5";
    swaync = "swaync";
  };
in

{
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    setSessionVariables = true;
  };

  xdg.configFile = builtins.mapAttrs (name: subpath: {
    source = link "${dotfiles}/${subpath}";
    force = true;
    recursive = true;
  }) configs;

  home.pointerCursor = {
    enable = true;

    gtk.enable = true;
    x11.enable = true;

    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 24;
  };

  home.packages = with pkgs; [
    rofi
    quickshell
    wlogout
    hyprsunset
    hyprlock
    hyprshot
    cliphist
    wl-clipboard
    wl-clip-persist
    awww
    ddcutil
    swaynotificationcenter
    ffmpeg
    vlc
  ];
}
