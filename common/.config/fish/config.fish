set -x EDITOR vi
set -x VISUAL vi

if status is-interactive
    set fish_greeting

    bind \ch backward-char
    bind \cj down-or-search
    bind \ck up-or-search
    bind \cl forward-char
    bind \ce nextd-or-forward-word
    bind \cb prevd-or-backward-word
end
