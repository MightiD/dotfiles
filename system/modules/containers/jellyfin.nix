{ ... }:
{
    virtualisation.oci-containers.containers.jellyfin = {
        image = "jellyfin/jellyfin";
        ports = [ "8096:8096"];
        user = "1000:1000";
        devices = [
            "/dev/dri/renderD128:/dev/dri/renderD128"
        ];
        autoStart = true;

        extraOptions = [
            "--group-add=303"
            "--group-add=26"
        ];
    };
}
