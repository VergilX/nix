{ config, pkgs, ... }:

{
  networking.nameservers = [ "8.8.8.8" ];

  # SSH
  services.openssh.enable = true;

  # Global
  environment.systemPackages = with pkgs; [
    inetutils
  ];
}
