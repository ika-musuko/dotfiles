function search
	find / -type f | fzf --bind 'enter:execute(xdg-open {} &)'
end
