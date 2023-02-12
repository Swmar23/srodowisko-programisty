# MAREK ŚWIERGOŃ 261750
#!/bin/bash

for WORD in `grep -o -E -r -h '\w+' -- "$1" | sort -u`
do
	echo "Słowo $WORD występuje w następujących liniach [NAZWA_PLIKU:LINIJKA]:"
	grep -wr "$WORD" -- "$1" | awk -F "/" '{print $NF}'
	echo "********************************"
done

# Uwaga: Trzeba założyć, że w plikach występują tylko litery, spacje i znaki nowej linii.
# Nie działa, gdy w tekście są znaki specjalne!

# działanie iterowania po słowach wyjaśnione w zadaniu 2.
# w środku pętli drukuję linijkę pokazującą słowo, którego rekordy zostaną wyświelone
# następnie wyświetlam rekordy, w celu sformatowania wyjścia z grep stosuję awk
# awk - pattern scanning and processing language
# -F "/" - ustawienie separatora kolumn na /
# $NF - zmienna w której przechowywana jest liczba kolumn na jaką udało się podzielić
# linijkę z użyciem separatora
# '{print $NF}' - wyświetl ostatnią kolumnę (czyli tak naprawdę wszystko co jest po ostatnim
# wystąpieniu separatora '/' - tak pozbywam się ścieżki
# UWAGA - nie działa gdy w tekście znajduje się znak '/' (konkretniej w linijce z szukanym słowem)

