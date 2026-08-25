{ ... }:
{
    podmanNetworks = [ "arr" ];
    containerDirs = [
        "/containers/arr/gluetun"
        "/containers/arr/qbt"
        "/containers/arr/prowlarr"
        "/containers/arr/sonarr"
        "/containers/arr/radarr"
    ];

    virtualisation.oci-containers.containers = {
        gluetun = {
            image = "qmcgaw/gluetun";
            autoStart = true;

            environmentFiles = [ "/containers/arr/arr.env" ];

            volumes = [
                "/containers/arr/gluetun:/gluetun"
            ];

            networks = [ "arr" "traefik" ];

            labels = {
                "traefik.enable" = "true";
                "traefik.http.routers.qbt.rule" = "Host(`qbt.local`)";
                "traefik.http.routers.qbt.entrypoints" = "web";
                "traefik.http.services.qbt.loadbalancer.server.port" = "8080";
            };

            environment = {
                UPDATER_PERIOD = "24h";
            };

            extraOptions = [
                "--cap-add=NET_ADMIN"
                "--device=/dev/net/tun:/dev/net/tun"
            ];

            ports = [
                "6881:6881"
                "9696:9696"
            ];
        };

        qbt = {
            image = "lscr.io/linuxserver/qbittorrent:latest";
            autoStart = true;

            environment = {
                PUID = "1000";
                PGID = "1000";
                TZ = "Europe/London";
                WEBUI_PORT = "8080";
            };

            volumes = [
                "/containers/arr/qbt:/config"
                "/tank/media:/media"
            ];

            extraOptions = [
                "--network=container:gluetun"
                "--label=deunhealth.restart.on.unhealthy=true"
                "--health-cmd=ping -c 1 www.google.com || exit 1"
                "--health-interval=60s"
                "--health-timeout=10s"
                "--health-retries=3"
                "--health-start-period=20s"
            ];
        };

        deunhealth = {
            image = "qmcgaw/deunhealth";
            autoStart = true;

            environment = {
                LOG_LEVEL = "info";
                HEALTH_SERVER_ADDRESS = "127.0.0.1:9999";
                TZ = "Europe/London";
            };

            volumes = [
                "/var/run/docker.sock:/var/run/docker.sock"
            ];

            extraOptions = [
                "--network=none"
            ];
        };

        prowlarr = {
            image = "lscr.io/linuxserver/prowlarr:latest";
            autoStart = true;

            environment = {
                PUID = "1000";
                PGID = "1000";
                TZ = "Europe/London";
            };

            volumes = [
                "/etc/localtime:/etc/localtime:ro"
                "/containers/arr/prowlarr:/config"
            ];

            extraOptions = [
                "--network=container:gluetun"
            ];
        };

        sonarr = {
            image = "lscr.io/linuxserver/sonarr:latest";
            autoStart = true;

            environment = {
                PUID = "1000";
                PGID = "1000";
                TZ = "Europe/London";
            };

            volumes = [
                "/etc/localtime:/etc/localtime:ro"
                "/containers/arr/sonarr:/config"
                "/tank/media:/media"
            ];

            networks = [ "arr" "traefik" ];

            labels = {
                "traefik.enable" = "true";
                "traefik.http.routers.sonarr.rule" = "Host(`sonarr.local`)";
                "traefik.http.routers.sonarr.entrypoints" = "web";
                "traefik.http.services.sonarr.loadbalancer.server.port" = "8989";
            };
        };

        radarr = {
            image = "lscr.io/linuxserver/radarr:latest";
            autoStart = true;

            environment = {
                PUID = "1000";
                PGID = "1000";
                TZ = "Europe/London";
            };

            volumes = [
                "/etc/localtime:/etc/localtime:ro"
                "/containers/arr/radarr:/config"
                "/tank/media:/media"
            ];

            networks = [ "arr" "traefik" ];

            labels = {
                "traefik.enable" = "true";
                "traefik.http.routers.radarr.rule" = "Host(`radarr.local`)";
                "traefik.http.routers.radarr.entrypoints" = "web";
                "traefik.http.services.radarr.loadbalancer.server.port" = "7878";
            };
        };

    };

    systemd.services = {
        "podman-gluetun" = {
            after = [ "podman-arr-network.service" "podman-traefik-network.service" ];
            requires = [ "podman-arr-network.service" "podman-traefik-network.service" ];
        };

        "podman-qbt" = {
            after = [ "podman-gluetun.service" ];
            requires = [ "podman-gluetun.service" ];
        };

        "podman-prowlarr" = {
            after = [ "podman-gluetun.service" ];
            requires = [ "podman-gluetun.service" ];
        };

        "podman-sonarr" = {
            after = [ "podman-arr-network.service" "podman-traefik-network.service" ];
            requires = [ "podman-arr-network.service" "podman-traefik-network.service" ];
        };

        "podman-radarr" = {
            after = [ "podman-arr-network.service" "podman-traefik-network.service" ];
            requires = [ "podman-arr-network.service" "podman-traefik-network.service" ];
        };
    };
}
