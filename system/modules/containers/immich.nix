{ ... }:
{
    imports = [ ./podman-networks.nix ];

    podmanNetworks = [ "immich" ];

    virtualisation.oci-containers.containers = {
        immich-server = {
            image = "ghcr.io/immich-app/immich-server:v3";
            autoStart = true;

            environmentFiles = [ /containers/immich/immich.env ];

            volumes = [
                "/tank/photos/upload:/data"
                "/etc/localtime:/etc/localtime:ro"
            ];

            networks = [ "traefik" "immich" ];

            labels = {
                "traefik.enable" = "true";
                "traefik.http.routers.immich.rule" = "Host(`immich.local`)";
                "traefik.http.routers.immich.entrypoints" = "web";
                "traefik.http.services.immich.loadbalancer.server.port" = "2283";
            };

            dependsOn = [
                "immich-redis"
                "immich-database"
            ];
        };

        immich-machine-learning = {
            image = "ghcr.io/immich-app/immich-machine-learning:v3";
            autoStart = true;

            environmentFiles = [ /containers/immich/immich.env ];

            volumes = [
                "/containers/immich/immich-machine-learning/model-cache:/cache"
            ];

            networks = [ "immich" ];
        };

        immich-redis = {
            image = "docker.io/valkey/valkey:9@sha256:546304417feac0874c3dd576e0952c6bb8f06bb4093ea0c9ca303c73cf458f63";
            autoStart = true;

            networks = [ "immich" ];

            extraOptions = [
                "--health-cmd=redis-cli ping || exit 1"
            ];
        };

        immich-database = {
            image = "ghcr.io/immich-app/postgres:14-vectorchord0.4.3-pgvectors0.2.0@sha256:bcf63357191b76a916ae5eb93464d65c07511da41e3bf7a8416db519b40b1c23";
            autoStart = true;

            environmentFiles = [ /containers/immich/immich.env ];

            environment = {
                POSTGRES_INITDB_ARGS = "--data-checksums";
            };

            volumes = [
                "/tank/photos/db:/var/lib/postgresql/data"
            ];

            extraOptions = [
                "--shm-size=128m"
            ];

            networks = [ "immich" ];
        };
    };

    systemd.services."podman-immich-server" = {
        after = [ "podman-immich-network.service" ];
        requires = [ "podman-immich-network.service" ];
    };
    systemd.services."podman-immich-machine-learning" = {
        after = [ "podman-immich-network.service" ];
        requires = [ "podman-immich-network.service" ];
    };
    systemd.services."podman-immich-redis" = {
        after = [ "podman-immich-network.service" ];
        requires = [ "podman-immich-network.service" ];
    };
    systemd.services."podman-immich-database" = {
        after = [ "podman-immich-network.service" ];
        requires = [ "podman-immich-network.service" ];
    };
}
