{ config, pkgs, ... }:
{
# game related apps

  environment.systemPackages = with pkgs; [

#antimicrox
#appimage-run
#discord
dolphin-emu
dolphin-emu-primehack
#dosbox
gtk3
heroic
libva-utils
libvdpau-va-gl
#linuxPackages.nvidia_x11
lutris
mangohud
mesa
mesa-demos
#nvidia-offload
steam
steam-run
vaapiVdpau
vulkan-loader
vulkan-tools
vulkan-validation-layers
wine
wineWowPackages.stable
winetricks
xdg-desktop-portal
xdg-desktop-portal-gtk

  ];
  
  #services.xdg.portal = {
  #  enable = true;
  #  backends = [ "gtk" ];
  #};
  
}
