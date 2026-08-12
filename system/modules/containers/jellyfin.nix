{ ... }:
{
    virtualisation.oci-containers.containers.jellyfin = {
        image = "jellyfin/jellyfin";
        user = "1000:1000";
        autoStart = true;

        devices = [
            "/dev/dri/renderD128:/dev/dri/renderD128"
        ];

        volumes = [
            "/containers/jellyfin/config:/config"
            "/containers/jellyfin/cache:/cache"
            "/tank/media:/media"
        ];

        extraOptions = [
            "--group-add=303"
            "--group-add=26"
        ];

        networks = [ "traefik" ];

        labels = {
            "traefik.enable" = "true";
            "traefik.http.routers.jellyfin.rule" = "Host(`jellyfin.local`)";
            "traefik.http.routers.jellyfin.entrypoints" = "web";
            "traefik.http.services.jellyfin.loadbalancer.server.port" = "8096";
        };
    };

    systemd.services."podman-jellyfin" = {
        after = [ "podman-traefik-network.service" ];
        requires = [ "podman-traefik-network.service" ];
    };
}
