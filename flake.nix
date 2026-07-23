{
    description = "Nixos Configuration";

    inputs = {
        nixpkgs.url = "nixpkgs/nixos-26.05";
        home-manager = {
            url = "github:nix-community/home-manager/release-26.05";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        stylix = {
            url = "github:nix-community/stylix/release-26.05";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { nixpkgs, home-manager, stylix, ... }: {
        nixosConfigurations = {
            desktop = nixpkgs.lib.nixosSystem {
                modules = [
                    ./system/machines/desktop.nix
                    home-manager.nixosModules.home-manager
                    stylix.nixosModules.stylix
                    {
                        home-manager = {
                            useGlobalPkgs = true;
                            useUserPackages = true;
                            users.mightid.imports = [
                                ./home/machines/desktop.nix
                            ];
                            backupFileExtension = "backup";
                        };
                    }
                ];
            };
            laptop = nixpkgs.lib.nixosSystem {
                modules = [
                    ./system/machines/laptop.nix
                    stylix.nixosModules.stylix
                    home-manager.nixosModules.home-manager
                    {
                        home-manager = {
                            useGlobalPkgs = true;
                            useUserPackages = true;
                            users.mightid.imports = [
                                ./home/machines/laptop.nix
                            ];
                            backupFileExtension = "backup";
                        };
                    }
                ];
            };
        };
    };
}
