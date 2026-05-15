{
    imports = [
        ./hardware-configuration.nix

        ../../modules/system/boot.nix
        ../../modules/system/networking.nix
        ../../modules/system/audio.nix
        ../../modules/system/hyprland.nix
        ../../modules/system/users.nix
    ];

    networking.hostName = "laptop";
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    system.stateVersion = "25.05";
}
