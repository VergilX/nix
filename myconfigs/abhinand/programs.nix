{ config, pkgs, ... }:

{

  # Define a user account. Don't forget to set a password with 'passwd'
  users.users.abhinand = {
    isNormalUser = true;
    description = "Abhinand D Manoj";
    extraGroups = [ "networkmanager" "wheel" "audio" ];
    packages = with pkgs; [
      # apps
      kitty
      gnome.nautilus
      steam
      nitrogen
      dunst
      flameshot
      zathura
      mpv 
      libreoffice-qt6-still
      element-desktop
      ungoogled-chromium

      # Fonts
      nerdfonts

      # Utils
      yt-dlp
      mpd
      mpc-cli
      libnotify
      bluez
      brightnessctl
      jellyfin-ffmpeg
      unzipNLS
      pv
      flex
      yacc
      bison
      file
      sxiv
      # ciscoPacketTracer8

      # Camera
      gnome.cheese

      vscode

      # Verilog
      verilog
      gtkwave

      rar
      unrar
      p7zip
    ];
  };


  # Moosic
  services.mpd = {
    enable = true;
    musicDirectory = "/home/abhinand/moosic";
    extraConfig = ''
      audio_output {
        type "pulse"
        name "My PulseAudio" # this can be whatever you want
      }
    '';

    # Optional:
    # network.listenAddress = "any"; # if you want to allow non-localhost connections
    # network.startWhenNeeded = true; # systemd feature: only start MPD service upon connection to its socket
};
}
