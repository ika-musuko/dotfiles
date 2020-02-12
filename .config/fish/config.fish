#if status --is-login
#    if test -z "$DISPLAY" -a $XDG_VTNR = 1
#        exec sway
#    end
#end

set -gx PATH /home/sherwyn/.local/bin $PATH
set -gx PATH /home/sherwyn/.elixir-ls/release $PATH
set -gx PATH /home/sherwyn/.extra $PATH

eval (direnv hook fish)
