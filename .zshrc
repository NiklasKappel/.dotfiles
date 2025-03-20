export HOMEBREW_CASK_OPTS="--appdir=~/Applications"
export HOMEBREW_NO_ANALYTICS=1
export PATH="/opt/homebrew/bin:$PATH"

alias bbic="brew update &&\
    brew bundle install --cleanup --file=~/.config/Brewfile &&\
    brew upgrade"
