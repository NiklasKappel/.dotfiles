function bbic --wraps='brew update && brew bundle install --cleanup --file=~/.config/Brewfile && brew upgrade' --description 'alias bbic=brew update && brew bundle install --cleanup --file=~/.config/Brewfile && brew upgrade'
  brew update && brew bundle install --cleanup --file=~/.config/Brewfile && brew upgrade $argv
        
end
