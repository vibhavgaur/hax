while search("^    ","W") != 0
	echo "We are on line " line('.') " and column" col('.')
	:normal d4l
	:execute "normal i`\<Esc>"
	:execute "normal A`  \<Esc>"
endwhile
