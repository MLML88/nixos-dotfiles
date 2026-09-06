{ pkgs, ... }:

{
    imports = [
        ../../modules/home/shell.nix
        ../../modules/home/hyprland.nix
        ../../modules/home/lsp_servers.nix
        ../../modules/home/lsp_formatters.nix
    ];

    home = {
        username = "excailbur";
        homeDirectory = "/home/excailbur";

        stateVersion = "26.05";
    };

    programs.home-manager.enable = true;
}
