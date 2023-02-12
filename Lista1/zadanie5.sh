# MAREK ŚWIERGOŃ 261750
#!/bin/bash


#korzystam z zadania pierwszego gdzie wyświetlam wszystkie pliki
#(tu po tym iteruję)
for FILEPATH in `find $1 -type f -name "*"`
do
	sed -i 's/a/A/g' $FILEPATH
done

#-i -edit file in place
#s/ - substitute
#/g - replace all occurences globally
