#!/bin/bash

# Marek Świergoń 261750 Środowisko Programisty Lista 4 Zadanie 2 (bez używania git-svn)

rev_min=$1
rev_max=$2
svn_path=$3
dir_name="${svn_path%/}" #usuwam slash jesli zmienna jest nim zakonczona
dir_name="${dir_name##*/}" #biore tylko to co jest po ostatnim slashu (nazwa folderu jaki chce utworzyc)
git init $dir_name #tworze puste repo
cd $dir_name #przechodze do repo

for rev_no in $(seq $rev_min $rev_max); do
	if svn log -q -r $rev_no $svn_path
	then
		#echo "$PWD"
		rm -rf * #czyszczę to co jest w kopii roboczej (zawartość poprzedniej rewizji)
		svn export --force -q $svn_path -r $rev_no "./" #zaciągam zawartość kolejnej rewizji do folderu kopii roboczej gita (po cichu i z forcem)
		commit_msg=$(svn log -r $rev_no $svn_path --xml | tr -d '\n' | grep -o '<msg>.*</msg>' | sed -e 's/<[^>]*>//g') # wyoderbniam sam commit message
		# poprzez wziecie logow w formacie xml, znalezieniu tresci ze znacznikami <msg> </msg> i usuniecie tych znacznikow
		git add "./**/*"  #stageuje nowo pobraną rewizję
		git commit -m "$commit_msg"
	fi
done
