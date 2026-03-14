{ config, pkgs, lib, ... }:

{
  # Required.
  home.homeDirectory = "/home/niklas";
  home.stateVersion = "25.11"; # Read release notes before changing.
  home.username = "niklas";
  programs.home-manager.enable = true;

  # Install packages.
  home.packages = with pkgs; [
    bat
    fd
    fzf
    gcc
    neovim
    nodejs
    ripgrep
    tree
  ];

  # Manage files.
  home.file = {
    # `<lhs>.source = <rhs>;` places `<rhs>` in the nix store and symlinks `<lhs>` to `<rhs>`.
    ".local/share/fonts/NerdFonts".source = "${pkgs.nerd-fonts.dejavu-sans-mono}/share/fonts/truetype/NerdFonts";
  };

  # Import GNOME settings.
  imports = [
    ./dconf.nix
  ];
}
