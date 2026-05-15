{
    imports = [
        ../../modules/home/shell.nix
        ../../modules/home/hyprland.nix
    ];

    home = {
        username = "vortex";
        homeDirectory = "/home/vortex";

        stateVersion = "25.05";
    };

    programs.home-manager.enable = true;
}
