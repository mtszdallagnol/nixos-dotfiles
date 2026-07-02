{ inputs, config, pkgs, ... }:
{
  imports = [
    inputs.nix4nvchad.homeManagerModules.default
    ./packages.nix
    ./symlinks.nix
    ./programs/git.nix
    ./programs/nvchad.nix
    ./programs/shell.nix
    ./services/flameshot.nix
  ];

  home.username = "mateus";
  home.homeDirectory = "/home/mateus";
  home.stateVersion = "26.05";
}
