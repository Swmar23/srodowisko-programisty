# MAREK ŚWIERGOŃ 261750
#!/bin/bash

for WORD in `grep -o -E -r -h '\w+' -- "$1" | sort -u `
do 
	if grep -qEr "*\b$WORD\b.*\b$WORD\b*" -- "$1"
	then
		echo "Słowo $WORD występuje więcej niż raz w następujących liniach [NAZWA_PLIKU:LINIJKA]:"
		grep -Er "*\b$WORD\b.*\b$WORD\b*" -- "$1" | awk -F "/" '{print $NF}'
	fi
done

# Uwaga: Trzeba założyć, że w plikach występują tylko litery, spacje i znaki nowej linii.
# Nie działa, gdy w tekście są znaki specjalne!

# zadanie analogiczne do zadania 4., przy czym tutaj musimy szukać co najmniej dwóch wystąpień słowa
# zatem w grep nie ma flagi -w (słowa mogą wystąpić gdziekolwiek, szukamy po wzorcu)
# "*\b$WORD\b.*\b$WORD\b" oznacza, że w dowolnym miejscu linijki musi się znaleźć raz słowo, potem 
# dowolny ciąg znaków (.*) zakończony  drugim powtórzeniem słowa"
# ponieważ nie chcemy, żeby echo pracowało gdy dla danego słowa nie ma nigdy spełnionego warunku,
# to wstawiamy wyświetlane rzeczy do if (grep musi zwrócić 0, czyli znaleźć choć jedną linijkę dla
# danego słowa)

# żeby grep (będący poleceniem warunkowym) nie wyświetlał wyników, daję flagę wyciszającą -q (quiet)

# '{print $NF}' - wyświetl ostatnią kolumnę (czyli tak naprawdę wszystko co jest po ostatnim
# wystąpieniu separatora '/' - tak pozbywam się ścieżki
# UWAGA - nie działa gdy w tekście znajduje się znak '/' (konkretniej w linijce z szukanym słowem)
