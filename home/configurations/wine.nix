{ pkgs, ... } :{
  home.packages = [
    pkgs.wineWowPackages.staging
    pkgs.winetricks
  ];
}

