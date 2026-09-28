# 10-homelab.sh — headless homelab server (hostname: tank)

[ "$(hostname)" = "tank" ] || return

AddPackage docker
AddPackage docker-compose
AddPackage nftables
AddPackage syncthing
AddPackage rsync
AddPackage smartmontools
AddPackage hdparm
AddPackage lm_sensors
AddPackage ncdu
AddPackage iotop
