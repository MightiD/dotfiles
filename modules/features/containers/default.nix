{inputs, moduleWithSystem, ...}: {
    flake.nixosModules.containers = moduleWithSystem({pkgs, ...}: {
        virtualisation = {
            containers = {
                enable = true;
            };

            docker = {
                enable = true;

                daemon.settings = {
                    pruning = {
                        enabled = true;
                        interval = "7d";
                    };
                };
            };
        };

        environment.systemPackages = with pkgs; [
            docker-compose
            lazydocker
        ];
    });
}
