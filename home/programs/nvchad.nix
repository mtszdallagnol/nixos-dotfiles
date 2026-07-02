{ pkgs, ... }:
{
  programs.nvchad = {
    enable = true;
    hm-activation = false;
    extraPackages = with pkgs; [
      ripgrep
      nixd
      xclip
      basedpyright
      ruff
    ];
  };
}
