{ ... }:
{
  # XidleHook
  services.xidlehook = {
    enable = true;
    not-when-audio = true;
    not-when-fullscreen = true;
    timers = [
      {
        delay = 1800;
      	command = "systemctl suspend";
      }
    ];
  };
}
