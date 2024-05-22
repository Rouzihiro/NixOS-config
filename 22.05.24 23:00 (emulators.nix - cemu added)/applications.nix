{ config, pkgs, ... }:
{

 #Allow unfree packages
 nixpkgs.config.allowUnfree = true;
 services.devmon.enable = true;
 services.gvfs.enable = true; 
 services.udisks2.enable = true;

 services.flatpak.enable = true;
# afterwards add the repo in Terminal to get it running
## flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
## flatpak update

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.rey = {
  isNormalUser = true;
  description = "rey";
  extraGroups = [ "networkmanager" "wheel" "kvm" "input" "disk" "libvirtd" ];
  packages = with pkgs; [

#arandr
#btop
#chromium
#emacs
#discord
#flameshot
gcc
lshw
mupdf
neofetch
#neovim
nvtop
#pavucontrol
#ripgrep
#spotify
thunderbird

  ];
  };
	
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [

#audacious
#autoconf
#binutils
#brave
#calibre
#callPackage
#cider
#clang
#cmake
#corefonts
#coreutils
#coreutils
#curl
#dconf
#distrobox
#dmidecode
#evolutionWithPlugins
ffmpeg
#fetchFromGitHub
#fetchpatch
#filezilla
#firefox
flatpak
#fuse
#gcc
#gimp
#git
#glib
#glxinfo
#google-chrome
#gnumake
#kate
#killall
#libclang
#libreoffice-fresh
#llvm
ntfs3g
#obs-studio
#onlyoffice-bin
#openshot-qt
#openvpn
openssl
#pantheon-tweaks
pciutils
#podman
#powershell
protonup-ng
#python311
#python311Packages.pip
#qbittorrent
samba
#screenfetch
#shortwave
#stdenv
#swaycons
#synergy
#transmission
#transmission-qt
#ulauncher
#uget
#unzip
#virtualglLib
#virt-manager
vlc
#wget
#xclip
#xdg-desktop-portal-gtk
#xorg.xinit
#ytmdesktop
#zoom-us

  ];
}
