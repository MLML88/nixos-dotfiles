{ config, pkgs, ... }:

let
  dotfiles = "${config.home.homeDirectory}/mydotfiles/MLML/.config";
  link = path: config.lib.file.mkOutOfStoreSymlink path;
  configs = {
    nvim = "nvim";
    fish = "fish";
    kitty = "kitty";
    zathura = "zathura";
  };
in

{
  xdg.configFile = builtins.mapAttrs (name: subpath: {
    source = link "${dotfiles}/${subpath}";
    force = true;
    recursive = true;
  }) configs;

  home.packages = with pkgs; [
    wget
    fish
    zoxide
    lazygit
    vscodium
    nixfmt

    ripgrep
    nodejs
    gnumake
    gcc
    cmake
    unzip
    tree-sitter
    fd
    fzf
    python3
    python3Packages.pip

    zathura
    zathuraPkgs.zathura_pdf_poppler
    (texliveSmall.withPackages (ps: with ps; [
      latexmk
      xetex
      enumitem
    ]))

  ];
}
