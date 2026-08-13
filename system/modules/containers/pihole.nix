{ ... }:
{
    virtualisation.oci-containers.containers.pihole = {
        image = "pihole/pihole:latest";
        autoStart = true;

        volumes = [
            "/containers/pihole:/etc/pihole"
        ];

        environment = {
            TZ = "Europe/London";
            FTLCONF_dns_listeningMode = "ALL";
        };

        networks = [ "traefik" ];

        ports = [ "53:53" ];

        labels = {
            "traefik.enable" = "true";
            "traefik.http.routers.pihole.rule" = "Host(`pihole.local`)";
            "traefik.http.routers.pihole.entrypoints" = "web";
            "traefik.http.services.pihole.loadbalancer.server.port" = "80";
        };

        extraOptions = [
            "--cap-add=NET_ADMIN"
            "--cap-add=SYS_TIME"
            "--cap-add=SYS_NICE"
        ];
    };

    systemd.services."podman-pihole" = {
        after = [ "podman-traefik-network.service" ];
        requires = [ "podman-traefik-network.service" ];
    };
}
