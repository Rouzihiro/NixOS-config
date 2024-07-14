{
  # Define the system configuration for NixOS
  imports =
    [ # Include the default NixOS configuration
      ./hardware-configuration.nix
    ];

  # System settings
  system.stateVersion = "23.05"; # Adjust this to your NixOS version

  # Configure the time zone
  time.timeZone = "Europe/Berlin"; # Adjust this to your timezone

  # Enable networking
  networking.hostName = "nixos"; # Set your hostname
  networking.networkmanager.enable = true; # Enable NetworkManager for managing networks

  # Enable the KDE Plasma desktop environment
  services.xserver.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  # Allow both Wayland and X11 sessions
  services.xserver.displayManager.sddm.wayland = true;

  # Optional: Enable additional KDE features
  services.xserver.desktopManager.plasma5.enableKwinWayland = true;

  # Enable sound
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable some basic packages
  environment.systemPackages = with pkgs; [
    wget
    curl
    vim
    plasma-workspace # Plasma workspace tools
    kdeApplications.konsole # KDE terminal emulator
    kdeApplications.dolphin # KDE file manager
  ];

  # User configuration
  users.users.rey = { # Username set to "rey"
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "audio" "video" ];
    packages = with pkgs; [
      # User-specific packages
    ];
  };

  # Enable sudo for your user
  security.sudo = {
    enable = true;
    wheelNeedsPassword = false;
  };

  # Optional: Configure hardware acceleration
  hardware.opengl.enable = true;

  # Optional: Enable services for virtualization, if needed
  virtualisation.libvirtd.enable = true;

  # Optional: Configure firewall
  networking.firewall.enable = true;

  # Optional: Enable NixOS' automatic upgrades
  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = true;

  # Define the Nix channel from which to get Nix packages
  nix.package = pkgs.nixStable;
}