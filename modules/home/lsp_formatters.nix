{ pkgs, ...}:

{
    home.packages = with pkgs; [
        biome
        prettier
        stylua
        python312Packages.isort
        python312Packages.pylint
        clang-tools
        deno       
    ];
}
