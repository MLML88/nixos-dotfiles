{
    description = "Start Over Nixos Hyprland";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { self, nixpkgs, home-manager, ... } @inputs:
    let
        system = "x86_64-linux";
    in {
        nixosConfigurations.asus = nixpkgs.lib.nixosSystem {
            inherit system;

            specialArgs = {inherit inputs;};

            modules = [
                ./host/asus

                home-manager.nixosModules.home-manager
                {
                    home-manager = {
                        useGlobalPkgs = true;
                        useUserPackages = true;

                        users.excailbur = import ./home/excailbur/home.nix;
                        backupFileExtension = "backup";
                    };
                }
            ];
        };
    };
}