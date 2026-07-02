{ pkgs, ... }:
{
  home.packages = with pkgs; [
    rofi
    claude-code
  ];
}
