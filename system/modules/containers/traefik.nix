{ pkgs, ... }:
{
    imports = [ ./podman-networks.nix ];

    podmanNetworks = [ "traefik" ];

    virtualisation.oci-containers.containers.traefik = {
        image = "traefik";
        ports = [ "80:80"];
        autoStart = true;

        volumes = [
            "/run/podman/podman.sock:/var/run/docker.sock:ro"
        ];

        cmd = [
            "--entrypoints.web.address=:80"
            "--providers.docker=true"
            "--providers.docker.exposedbydefault=false"
            "--providers.docker.network=traefik"
            "--api.dashboard=true"
            "--api.insecure=true"
            "--log.level=DEBUG"
            "--accesslog=true"
        ];

        networks = [ "traefik" ];

        labels = {
            "traefik.enable" = "true";
            "traefik.http.routers.dashboard.rule" = "Host(`dash.local`)";
            "traefik.http.routers.dashboard.entrypoints" = "web";
        };
    };

    systemd.services."podman-traefik" = {
        after = [ "podman-traefik-network.service" ];
        requires = [ "podman-traefik-network.service" ];
    };
}
