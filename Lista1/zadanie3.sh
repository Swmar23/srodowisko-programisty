# MAREK ŚWIERGOŃ 261750
#!/bin/bash

for WORD in `grep -o -E -r -h '\w+' -- "$1" | sort -u`
do
	echo "$WORD | $(grep -wrol "$WORD" -- "$1" | wc -w)"
done


# praktycznie cała idea omówiona w zadaniu 2.
# różnica to flaga -l zamiast -h w grep znajdującym się wewnątrz pętli
# dzięki temu zliczamy nie wystąpienia słowa ale liczbę plików, w których to słowo
# występuje choć raz
# -l (files-with-matches) Suppress normal output; instead print the name of each
# input file from which output would normally have been printed. (z man)
# (szuka tylko do pierwszego napotkania)
