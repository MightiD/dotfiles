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

        disko = {
            url = "github:nix-community/disko";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { nixpkgs, home-manager, stylix, disko, ... }: {
        nixosConfigurations = {
            bigNix = nixpkgs.lib.nixosSystem {
                specialArgs = {
                    host = "bigNix";
                };

                modules = [
                    ./system/machines/desktop/default.nix
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
                            extraSpecialArgs = { host = "bigNix"; };
                        };
                    }
                ];
            };
            miniNix = nixpkgs.lib.nixosSystem {
                specialArgs = {
                    host = "miniNix";
                };

                modules = [
                    ./system/machines/laptop/default.nix
                    stylix.nixosModules.stylix
                    home-manager.nixosModules.home-manager
                    {
                        home-manager = {
                            useGlobalPkgs = true;
                            useUserPackages = true;
                            users.mightid.imports = [
                                ./home/machines/laptop.nix
                            ];
                            extraSpecialArgs = { host = "miniNix"; };
                            backupFileExtension = "backup";
                        };
                    }
                ];
            };
            homelab = nixpkgs.lib.nixosSystem {
                specialArgs = {
                    host = "homelab";
                };

                modules = [
                    ./system/machines/homelab/default.nix
                    disko.nixosModules.disko
                    home-manager.nixosModules.home-manager
                    {
                        home-manager = {
                            useGlobalPkgs = true;
                            useUserPackages = true;
                            users.mightid.imports = [
                                ./home/machines/homelab.nix
                            ];
                            extraSpecialArgs = { host = "homelab"; };
                            backupFileExtension = "backup";
                        };
                    }
                ];
            };
        };
    };
}
