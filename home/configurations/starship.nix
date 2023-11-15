{ pkgs, lib, ... }: 
{
  programs.starship.enable = true;
  programs.starship.enableNushellIntegration = true;
  programs.starship.enableFishIntegration = false;
  programs.starship.enableIonIntegration = false;
  programs.starship.enableZshIntegration = false;
  programs.starship.settings = {
    battery.disabled = true;
    cmd_duration.disabled = true;
  };
}
