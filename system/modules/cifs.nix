{ pkgs, ... }:
{
    environment.systemPackages = with pkgs; [ cifs-utils ];

    fileSystems = {
        "/nas/files" = {
            device = "//192.168.255.1/Private";
            fsType = "cifs";
            options = let
                automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";
            in ["${automount_opts},credentials=/etc/nixos/smb-secrets,uid=1000,gid=1000"];
        };
        "/nas/media" = {
            device = "//192.168.255.1/Media";
            fsType = "cifs";
            options = let
                automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";
            in ["${automount_opts},credentials=/etc/nixos/smb-secrets,uid=1000,gid=1000"];
        };
    };
}
