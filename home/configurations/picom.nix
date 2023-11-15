{ ... }:
{
  # Picom
  services.picom = {
    enable = true;
    vSync = true;
    backend = "glx";
    extraArgs = [ "--legacy-backends" ];
    wintypes = {
      dropdown_menu = { shadow = false; };
      popup_menu    = { shadow = false; };
      utility       = { shadow = false; };
    };
  };
}
