function hm
  home-manager --extra-experimental-features "nix-command flakes" switch --flake ~/.nix-home-manager/
end
