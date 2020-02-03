function search
	find / -type f 2>/dev/null | fzf --bind 'enter:execute(xdg-open {} &)' 
end
