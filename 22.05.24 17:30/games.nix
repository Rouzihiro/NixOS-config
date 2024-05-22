{ config, pkgs, ... }:
{
# game related apps

  environment.systemPackages = with pkgs; [

#antimicrox
#appimage-run
#cemu #didnt work, trying flatpak
#discord
dolphin-emu
dolphin-emu-primehack
#dosbox
gtk3
heroic
#linuxPackages.nvidia_x11
lutris
mangohud
mesa
#nvidia-offload
steam
steam-run
vulkan-loader
vulkan-tools
wine
wineWowPackages.stable
winetricks

  ];
}
