function journal
	jrnl $argv[2..-1]
jrnl --encrypt
cd ~/.jrnl
git add journal.txt
git commit -m (date)
git push
end
