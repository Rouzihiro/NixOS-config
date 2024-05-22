{ config, pkgs, ... }:
{

  nixpkgs.config.permittedInsecurePackages = [
    "openssl-1.1.1w"
  ];

# steam
 programs.steam = {
 enable = true;
 remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
 dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
};


# (lutris.override {
# extraPkgs = pkgs: [
## List package dependencies here
 # wineWowPackages.stable
 # winetricks
 # ];
 # })

 # nix.settings = {
 #   substituters = ["https://nix-gaming.cachix.org"];
 #   trusted-public-keys = ["nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="];
 # };



}
