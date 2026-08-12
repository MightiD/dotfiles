{ pkgs, ... }:
{
    services.openvpn.servers.home = {
        config = ''
            port 5222
            proto tcp-server
            dev tun
            topology subnet
            remote-cert-tls client
            ca /etc/openvpn/ca.crt
            cert /etc/openvpn/server.crt
            key /etc/openvpn/server.key
            tls-crypt-v2 /etc/openvpn/tls-crypt.key
            crl-verify /etc/openvpn/crl.pem
            data-ciphers AES-256-GCM
            dh none
            tls-server
            tls-version-min 1.3
            tls-groups X25519:prime256v1:secp384r1:secp521r1
            server 10.8.0.0 255.255.255.0
            push "route 192.168.1.0 255.255.0.0"
            push "dhcp-option DNS 192.168.255.1"
            push "redirect-gateway def1 bypass-dhcp"
            persist-key
            persist-tun
            keepalive 10 120
            tcp-nodelay
            verb 3
            user nobody
            group nobody
        '';
    };

    networking.nat = {
        enable = true;
        externalInterface = "eno1";
        internalInterfaces = [ "tun0" ];
    };

    networking.firewall = {
        allowedTCPPorts = [ 5222 ];
    };

    boot.kernel.sysctl."net.ipv4.ip_forward" = 1;
}
