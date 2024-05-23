{ config, pkgs, ... }:

# installation of Cemu and its obviously necessary files

{
  environment.systemPackages = with pkgs; [
    cemu
    clang
    cmake
    curl
    freeglut
    git
    #gtk3
    libgcrypt
    libsecret
    nasm
    ninja
    pulseaudio
    systemd
  ];
}
