{ ... }:
{
    services.samba = {
        enable = true;
        securityType = "user";
        openFirewall = true;
        settings = {
            global = {
                "server string" = "homelab";
                "workgroup" = "WORKGROUP";
                "security" = "user";
                "map to guest" = "bad user";
                "name resolve order" = "bcast host";
                "hosts allow" = "192.168.0.1/16 10.0.0.0/8 172.16.0.0/12 100.64.0.0/10";
                "hosts deny" = "0.0.0.0/0";
                "guest account" = "nobody";
                "server min protocol" = "SMB2";
            };
            "private" = {
                "path" = "/tank/files";
                "force user" = "mightid";
                "force group" = "mightid";
                "create mask" = "0774";
                "force create mask" = "0774";
                "directory mask" = "0775";
                "force directory mask" = "0775";
                "browseable" = "yes";
                "writable" = "yes";
                "read only" = "no";
                "guest ok" = "no";
            };
            "media" = {
                "path" = "/tank/media";
                "force user" = "mightid";
                "force group" = "mightid";
                "create mask" = "0774";
                "force create mask" = "0774";
                "directory mask" = "0775";
                "force directory mask" = "0775";
                "browseable" = "yes";
                "writable" = "yes";
                "read only" = "no";
                "guest ok" = "no";
            };
        };
    };

    services.samba-wsdd = {
        enable = true;
        openFirewall = true;
    };
}
