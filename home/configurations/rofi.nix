{ pkgs, ... }:
let
  content = pkgs.fetchFromGitHub {
    owner     = "alliby";
    repo      = "rofi";
    rev       = "8a18fabd1aa70d9c7122db465f2b786f292151ad";
    sha256    = "6vDCHXxXxDevQZAuBIPcxSgEQHcoCIsS2s8u8YoX354=";
  };
in
{
  home.packages = with pkgs; [ rofi ];
  home.file.".config/rofi".source = content;
}
