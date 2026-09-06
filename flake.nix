{
  description = "Nixos Hyprland with mulitple host";

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
  };

  outputs = { self, nixpkgs, home-manager, zen-browser, ... } @inputs:
    let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations = {
        # Asus laptop
        asus = nixpkgs.lib.nixosSystem {
          inherit system;

          modules = [
            ./host/asus

            home-manager.nixosModules.home-manager {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;

                users.excalibur = import ./home/excalibur/home.nix;
                backupFileExtension = "backup";
              };
            };
          ];
        };

        # School laptop
        school = nixpkgs.lib.nixosSystem {
          inherit system;

          modules = [
            ./host/school

            home-manager.nixosModules.home-manager {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;

                users.vortex = import ./home/vortex/home.nix;
                backupFileExtension = "backup";
              };
            };
          ];
        };

      };
    };
}