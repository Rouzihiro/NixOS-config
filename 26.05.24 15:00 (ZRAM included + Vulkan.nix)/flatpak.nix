{ config, pkgs, ... }:

{
  # Flatpak und Flatpak-Repositories einbinden
  environment.systemPackages = with pkgs; [
    flatpak
  ];

  # Flatpak-Repositories hinzufügen
  environment.etc."flatpak/repo.d/flathub.conf".text = ''
    [remote "flathub"]
    url=https://dl.flathub.org/repo/
    gpg-verify=true
    gpg-verify-summary=true
    xa.title=Flathub
    xa.comment=Apps for all Linux devices
  '';

  # Sicherstellen, dass der Flatpak-Dienst aktiviert ist
  services.flatpak.enable = true;

  # Sicherstellen, dass das Flatpak-Repository hinzugefügt wird
  system.activationScripts.flatpak = ''
    ${pkgs.flatpak}/bin/flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
  '';

  # Flatpak-Anwendungen installieren
#  system.activationScripts.flatpakApps = ''
#    ${pkgs.flatpak}/bin/flatpak install -y flathub com.valvesoftware.Steam
#    ${pkgs.flatpak}/bin/flatpak install -y flathub org.winehq.Wine
#    ${pkgs.flatpak}/bin/flatpak install -y flathub net.davidotek.pupgui2
#    ${pkgs.flatpak}/bin/flatpak install -y flathub net.lutris.Lutris
#    ${pkgs.flatpak}/bin/flatpak install -y flathub com.github.Matoking.protontricks
#  '';
}
