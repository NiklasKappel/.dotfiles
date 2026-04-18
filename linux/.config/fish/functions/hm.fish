function hm --wraps='home-manager switch --flake ~/.dotfiles/' --description 'alias hm=home-manager switch --flake ~/.dotfiles/'
  home-manager switch --flake ~/.dotfiles/ $argv
        
end
