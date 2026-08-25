{ lib, config, ... }:
{
    options.containerDirs = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        default = [];
    };

    config.systemd.tmpfiles.rules =
        map (dir: "d ${dir} 0755 root root -") config.containerDirs;
}
