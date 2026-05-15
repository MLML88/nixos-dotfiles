{ config, pkgs, inputs, ... }:

let
    dotfiles = "${config.home.homeDirectory}/mydotfiles/MLML/.config";
    link = path: config.lib.file.mkOutOfStoreSymlink path;
    configs = {
        rofi = "rofi";
        fish = "fish";
        quickshell = "quickshell";
        kitty = "kitty";
        nvim = "nvim";
        hypr = "hypr";
        wlogout = "wlogout";
    };
in

{
    home.username = "vortex";
    home.homeDirectory = "/home/vortex";
    home.stateVersion = "25.05";

    home.pointerCursor = {
        gtk.enable = true;
        x11.enable = true;

        package = pkgs.bibata-cursors;
        name = "Bibata-Modern-Ice";
        size = 24;
    };

    xdg.userDirs = {
        enable = true;
        createDirectories = true;
        setSessionVariables = true;
    };

    xdg.configFile = builtins.mapAttrs
        (name: subpath: {
         source = link "${dotfiles}/${subpath}";
         recursive = true;
         }) configs;

    home.packages = with pkgs; [
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
        wlogout
        hyprsunset
        hyprlock
        hyprshot
        cliphist
        wl-clipboard
        wl-clip-persist
        lazygit
        awww
        ddcutil
    ];

    programs.home-manager.enable = true;
}
