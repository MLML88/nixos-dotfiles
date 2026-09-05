{
    imports = [
        ./hardware-configuration.nix

        ../../modules/system/boot.nix
        ../../modules/system/hyprland.nix
        ../../modules/system/networking.nix
        ../../modules/system/users.nix
    ];

    networking.hostName = "asus";
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    system.stateVersion = "26.05";
}
