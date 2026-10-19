AddPackage base
AddPackage base-devel
AddPackage efibootmgr
AddPackage grub
AddPackage linux
AddPackage linux-firmware
AddPackage linux-headers
AddPackage networkmanager
AddPackage plymouth
AddPackage sof-firmware
AddPackage ufw

case "$(hostname -s)" in
    big-arch)
        AddPackage amd-ucode
        AddPackage vulkan-radeon
        AddPackage vulkan-tools
        AddPackage xf86-video-amdgpu
        AddPackage xf86-video-ati
        ;;
    mini-arch|homelab)
        AddPackage intel-ucode
        ;;
esac
