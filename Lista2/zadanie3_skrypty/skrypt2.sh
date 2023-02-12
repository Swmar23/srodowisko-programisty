# MAREK ŚWIERGOŃ 261750
#!/bin/bash

for WORD in `grep -o -E -r -h '\w+' -- "$1" | sort -u`
do
	echo "$WORD | $(grep -wroh "$WORD" -- "$1" | wc -w)"
done


# pętla iteruje po wszystkich unikatowych słowach występujących w poddrzewie
# grep - print lines that match patterns
# -o - wyświetlamy tylko znalezione słowo, nie całą linijkę jak domyślnie (only-matching)
# -r - rekursywny tryb działania: przeszukuje w całym poddrzewie (recursive)
# -h - nie wyświetlamy nazwy pliku, w którym znaleziono dane słowo (no-filename)
# -E - wzorzec traktujemy jako zapisany w POSIX-Extended Regular Expressions
# \w+ - matches one or more word characters (tak jak [a-zA-Z0-9_]+ w klasycznym REGEX)
# z grepa dostajemy listę słów występującą we wszystkich plikach, z pomocą sort
# sortujemy je i dbamy o unikalność rekordów (-u)

# wewnątrz pętli dla każdego unikatowego słowa wyszukujemy dokładnie jego i zliczamy wystąpenia
# z pomocą wc
# do tego przy grep potrzebujemy zamiast -E mieć -w (szukanie DOKŁADNIE TEGO SŁOWA)
# z kolei w wc flaga -w zaznacza, że chcemy zliczać słowa (w wc można też inne rzeczy zliczać)

