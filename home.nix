{ config, pkgs, ... }:

let
    dotfiles = "${config.home.homeDirectory}/nixos-dotfiles/config";
    create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
    configs = {
        nvim = "nvim";
    };
in

{
    home.username = "vortex";
    home.homeDirectory = "/home/vortex";
    home.stateVersion = "25.05";
    programs.git.enable = true;
    programs.bash = {
        enable = true;
        shellAliases = {
            btw = "echo i use nixos, btw";
        };
        profileExtra = ''
            if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
                exec uwsm start -S hyprland-uwsm.desktop
                    fi
                    '';
    };

    xdg.configFile = builtins.mapAttrs
        (name: subpath: {
            source = create_symlink "${dotfiles}/${subpath}";
            recursive = true;
        })
        configs;

    home.packages = with pkgs; [
        neovim
            ripgrep
            nil
            nixpkgs-fmt
            nodejs
            npm
            gcc
    ]

}
