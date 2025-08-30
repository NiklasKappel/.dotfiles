set -x EDITOR vi
set -x VISUAL vi

set -x HOMEBREW_CASK_OPTS --appdir=~/Applications
set -x HOMEBREW_NO_ANALYTICS 1

fish_add_path /opt/homebrew/bin

if status is-interactive
    set fish_greeting

    bind \ch backward-char
    bind \cj down-or-search
    bind \ck up-or-search
    bind \cl forward-char
    bind \ce nextd-or-forward-word
    bind \cb prevd-or-backward-word
end
