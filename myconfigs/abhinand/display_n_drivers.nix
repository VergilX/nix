{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    videoDrivers = [ "modesetting" "nvidia" ];

    # Disable display manager
    autorun = true;
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

  # Touchpad and Mouse
  services.libinput.enable = true;
  services.libinput.touchpad.naturalScrolling = true;
  services.libinput.mouse.naturalScrolling = true;

  # Vulkan
  hardware.opengl.driSupport = true;

  # Picom
  services.picom.enable = true;
}
