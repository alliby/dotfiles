{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # lxde.lxmenu-data
    # shared-mime-info
    xfce.thunar
  ];
}
