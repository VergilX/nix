{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    # videoDrivers = [ "modesetting" ];  # Disable NVIDIA
    videoDrivers = [ "modesetting" "nvidia" ];  # Enable NVIDIA

    # Disable display manager
    displayManager.startx.enable = true;

    # Window Manager
    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
      	dmenu
	i3blocks
	i3status
	i3lock
      ];
    };
  };

  # for i3blocks
  environment.pathsToLink = [ "/libexec" ];

  # Auto-login
  services.displayManager.defaultSession = "none+i3";
  services.getty.autologinUser = "abhinand";

  # Touchpad and Mouse
  services.libinput.enable = true;
  services.xserver.libinput.naturalScrolling = true;
  services.libinput.mouse.naturalScrolling = true;

  # Vulkan
  # hardware.opengl.driSupport = true;

  # Picom
  services.picom.enable = true;
}
