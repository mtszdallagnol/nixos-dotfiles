{ config, ... }:
{
  services.flameshot = {
    enable = true;
    settings.General = {
      showStartupLaunchMessage = false;
      savePath = "${config.home.homeDirectory}/Pictures/Screenshots";
      saveAsFileExtension = ".png";
      showDesktopNotification = true;
      disabledTrayIcon = false;
    };
  };
}
