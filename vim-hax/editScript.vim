:normal gg " start from the top

while search("```python",'n') != 0
	" go to the top of the file
	:normal gg
	" Find a python code block and change its tag
	:execute "/```python"
	echo "I found a python code block!"
	:normal d$
	:execute "normal i\t#!python\<Esc>"

	" Find the end of the python code block
	:execute "/```"
	echo "Found the end of the python code block"

	" Select the code in the code block and indent it
	:normal k
	:normal V
	:execute "?#!python"
	:normal j
	:normal >
	:execute "/```"
	:normal dd " Remove the trailing blockquotes ```
endwhile

:normal gg " go to the top of the file

while search("^    ","W") != 0
	echo "We are on line " line('.') " and column" col('.')
	:normal d4l
	:execute "normal i`\<Esc>"
	:execute "normal A`  \<Esc>"
endwhile

:normal gg
while search("^``","W") != 0
	:normal dd
endwhile

let imdir = input("Enter the (case-sensitive) name of the folder containing the images for this post\n")
:normal gg
while search("^![png","W") != 0
	:normal d7l
	:normal dt)
	:normal j
	:execute "normal i<p align=\"center\">\r<img src=\"../images/" . imdir . "/\<Esc>"
	:normal p
	:execute "normal a\">\r</p>"
	:normal kkk
	:normal dd
endwhile	

echo "All Done!"
