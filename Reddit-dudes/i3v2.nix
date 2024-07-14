# Add the necessary imports
{ config, pkgs, lib, ... }:
{
  # Enable NVIDIA drivers
  services.xserver.videoDrivers = [ "nvidia" ];

  # Enable LightDM display manager
  services.xserver.displayManager.lightdm.enable = true;

  # Enable i3 window manager
  services.xserver.windowManager.i3.enable = true;
  services.xserver.windowManager.i3.package = pkgs.i3-gaps; # Optional: Use i3-gaps for additional customization

  # Optional: Disable compositor for i3
  services.xserver.windowManager.i3.extraConfig = ''
    # PRIME Synchronization for eDP-1
    exec --no-startup-id xrandr --output eDP-1 --set "PRIME Synchronization" 1
    # PRIME Synchronization for HDMI-1
    exec --no-startup-id xrandr --output HDMI-1 --set "PRIME Synchronization" 1
    # Start picom (formerly compton) with specific settings
    exec --no-startup-id picom --config /dev/null --backend glx --vsync opengl-swc --unredir-if-possible
  '';

  # System performance tweaks (optional)
  powerManagement.cpuFreqGovernor = lib.mkDefault "performance";

  # Add gaming-specific packages if needed
  environment.systemPackages = with pkgs; [
    steam
    lutris
  ];
}