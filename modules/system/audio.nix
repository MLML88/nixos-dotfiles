{ pkgs, ... }:

{
    hardware.bluetooth.enable = true;
    hardware.bluetooth.settings = {
        General = {
            Enable = "Source,Sink,Media,Socket";
            AutoEnable = true;
        };
    };
    services.blueman.enable = true;

    services.pipewire = {
        enable = true;
        pulse.enable = true;
        alsa.enable = true;
        wireplumber.enable = true;
    };

    environment.systemPackages = with pkgs; [
        bluez
        bluez-tools
        blueman
        pavucontrol
    ];
}
