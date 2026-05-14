{
    description = "Minimal NixOS + Hyprland";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        zen-browser = {
            url = "github:youwen5/zen-browser-flake";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        hyprland.url = "github:hyprwm/Hyprland";
    };

    outputs = { self, nixpkgs, home-manager, zen-browser, hyprland, ... } @inputs:
    let
    system = "x86_64-linux";
    in {
        nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
            inherit system;

            specialArgs = {inherit inputs;};

            modules = [
                ./configuration.nix

                hyprland.nixosModules.default

                home-manager.nixosModules.home-manager
                {
                    home-manager = {
                        useGlobalPkgs = true;
                        useUserPackages = true;

                        users.vortex = import ./home.nix;
                        backupFileExtension = "backup";
                    };
                }
            ];
        };
    };
}
