{ config, pkgs, inputs, ... }:

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
        wlogout = "wlogout";
    };
in

{
    home.username = "vortex";
    home.homeDirectory = "/home/vortex";

    home.stateVersion = "25.05";

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
