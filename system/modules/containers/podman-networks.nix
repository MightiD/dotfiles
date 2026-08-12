{ pkgs, lib, config, ... }:
{
    options.podmanNetworks = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        default = [];
    };

    config = {
        systemd.services = lib.listToAttrs (map (name: {
            name = "podman-${name}-network";
            value = {
                description = "Create the ${name} network";
                wantedBy = [ "multi-user.target" ];
                after = [ "network-online.target" ];
                wants = [ "network-online.target" ];
                serviceConfig = {
                    Type = "oneshot";
                    RemainAfterExit = true;
                    ExecStart = "${pkgs.bash}/bin/bash -c '${pkgs.podman}/bin/podman network exists ${name} || ${pkgs.podman}/bin/podman network create ${name}'";
                };
            };
        }) config.podmanNetworks);
    };
}
