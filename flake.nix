{
  description = "Minimal NixOS + Hyprland, Modularized";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # zen-browser = {
    #     url = "github:youwen5/zen-browser-flake";
    #     inputs.nixpkgs.follows = "nixpkgs";
    # };

    # hyprland.url = "github:hyprwm/Hyprland";
  };

  # outputs = { self, nixpkgs, home-manager, zen-browser, hyprland, ... } @inputs:
  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations.asus = nixpkgs.lib.nixosSystem {
        inherit system;

        specialArgs = { inherit inputs; };

        modules = [
          ./host/asus

          # hyprland.nixosModules.default

          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;

              users.excalibur = import ./home/excalibur/home.nix;
              backupFileExtension = "backup";
            };
          }
        ];
      };
    };
}
