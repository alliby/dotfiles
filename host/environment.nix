{ ... }: {
  environment.variables = {
    # Scaling
    # GDK_SCALE = "1.4";
    # GDK_DPI_SCALE = "1";
    # QT_AUTO_SCREEN_SCALE_FACTOR = "1";

    # Set Helix as Default Editor
    EDITOR = "hx"; 
    TERMINAL = "alacritty";
    _JAVA_AWT_WM_NONREPARENTING = "1";
  };

  # session variables
  environment.sessionVariables = {
    # XDG Variables
    XDG_CACHE_HOME  = "\${HOME}/.cache";
    XDG_CONFIG_HOME = "\${HOME}/.config";
  };
}
