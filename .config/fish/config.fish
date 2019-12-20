if status --is-login
    if test -z "$DISPLAY" -a $XDG_VTNR = 1
        exec startx
    end
end

set -gx PATH /home/sherwyn/.local/bin $PATH
set -gx PATH /home/sherwyn/.elixir-ls/release $PATH

