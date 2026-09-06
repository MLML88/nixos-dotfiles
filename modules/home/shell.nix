{ config, pkgs, ... }:

let
  dotfiles = "${config.home.homeDirectory}/mydotfiles/MLML/.config";
  link = path: config.lib.file.mkOutOfStoreSymlink path;
  configs = {
    nvim = "nvim";
    fish = "fish";
    kitty = "kitty";
  };
in

{
  xdg.configFile = builtins.mapAttrs (name: subpath: {
    source = link "${dotfiles}/${subpath}";
    force = true;
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
