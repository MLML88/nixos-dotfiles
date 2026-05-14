{ config, pkgs, ... }:

let
dotfiles = "${config.home.homeDirectory}/nixos-dotfiles/config";
link = path: config.lib.file.mkOutOfStoreSymlink path;
configs = {
    rofi = "rofi";
    fish = "fish";
    quickshell = "quickshell";
    kitty = "kitty";
    nvim = "nvim";
    hypr = "hypr";
};
in

{
    home.username = "vortex";
    home.homeDirectory = "/home/vortex";

    home.stateVersion = "25.05";

    wayland.windowManager.hyprland = {
        enable = true;
        systemd.enable = false; # Stops home manager from auto-gen hyprland.conf
    };

    xdg.configFile = builtins.mapAttrs
        (name: subpath: {
         source = link "${dotfiles}/${subpath}";
         recursive = true;
         }) configs;

    home.packages = with pkgs; [
        kitty
        firefox
        python3
        python3Packages.pip
        ripgrep
        nodejs
        gcc
        gnumake
        cmake
        wget
        unzip
        tree-sitter
        fd
        fzf
        fish
        zoxide
        rofi
        quickshell
    ];

    programs.home-manager.enable = true;
}
