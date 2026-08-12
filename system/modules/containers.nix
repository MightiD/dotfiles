{ pkgs, ... }:
{
    virtualisation = {
        podman = {
            enable = true;
            dockerCompat = true;
            defaultNetwork.settings.dns_enabled = true;
            autoPrune = {
                enable = true;
                dates = "weekly";
            };
        };

        oci-containers.backend = "podman";
    };

    environment.systemPackages = with pkgs; [
        docker-compose
        lazydocker
        podman-tui
    ];

    users.users.mightid.extraGroups = [ "podman" ];
}
