{ config, pkgs, ...}:

let
    dotfiles = "${config.home.homeDirectory}/mydotfiles/MLML/.config";
    link = path: config.lib.file.mkOutOfStoreSymlink path;
    configs = {
        fish = "fish";
        nvim = "nvim";
    };
in

{
    xdg.configFile = builtins.mapAttrs
        (name: subpath: {
         source = link "${dotfiles}/${subpath}";
         recursive = true;
         }) configs;

    home.packages = with pkgs; [
        ripgrep
        nodejs
        gnumake
        cmake
        unzip
        wget
        tree-sitter
        fd
        fzf
        fish
        zoxide
        lazygit
    ];
}
