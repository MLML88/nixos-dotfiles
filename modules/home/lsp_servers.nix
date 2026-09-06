{ pkgs, ... }:

{
  home.packages = with pkgs; [
    lua-language-server # lua_ls
    typescript-language-server # ts_ls
    vscode-langservers-extracted # html, cssls, emmet_ls
    tailwindcss-language-server # tailwindcss
    astro-language-server # astro
    marksman # markdown
    pyright # python
    qt6.qtbase
    qt6.qtdeclarative
    qt6.qttools
  ];
}
