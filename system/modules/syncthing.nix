{ ... }:
{
    services.syncthing = {
        enable = true;
        openDefaultPorts = true;
        user = "mightid";
        dataDir = "/home/mightid";
        configDir = "/home/mightid/.config/syncthing";
    };
}
