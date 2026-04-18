function hm --wraps='home-manager switch --flake ~/.dotfiles_nix/' --description 'alias hm=home-manager switch --flake ~/.dotfiles_nix/'
  home-manager switch --flake ~/.dotfiles_nix/ $argv
        
end
