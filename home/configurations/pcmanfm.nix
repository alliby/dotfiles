{ pkgs, ...}:
{
  home.packages = with pkgs; [
    pcmanfm
    shared-mime-info
    lxde.lxmenu-data
  ];
}
