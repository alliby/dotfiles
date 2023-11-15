{ ... }:
{
  # Alacritty
  programs.alacritty.enable = true;
  programs.alacritty.settings = {
    import = [ ./alacritty-theme.yaml ];
    font = { size = 14; };
    window.opacity = 0.9;
    key_bindings = [
      { key = "N"; mods = "Control|Shift"; action = "SpawnNewInstance"; }
    ];
  };
}
