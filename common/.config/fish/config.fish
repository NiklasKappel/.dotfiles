set -x EDITOR vi
set -x VISUAL vi

fish_add_path "$HOME/.local/bin/"

if status is-interactive
    set fish_greeting

    bind \cb prevd-or-backward-word
    bind \ce nextd-or-forward-word
    bind \ch backward-char
    bind \cj down-or-search
    bind \ck up-or-search
    bind \cl forward-char
    bind ctrl-space complete
end

