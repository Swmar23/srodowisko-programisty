#MAREK ŚWIERGOŃ 261750
#!/bin/bash

find "$1" -type f -printf "%f\n"

#find pomaga znaleźć pliki i nie tylko, możemy go wykorzystać, bo
#find przeszukuje wszystko co znajduje się w poddrzewie zadanego katalogu
#(katalogu w którym chcemy szukać)
# -type f - wyszukuj tylko plików regularnych (nie katalogów)
# -gdy nie podamy nazwy plików, to domyślnie wyświetla wszystkie jakie znajdzie
# gdybyśmy chcieli wyspecyfikować to wtedy flaga -name "nazwa/wzorzec"

#-printf "%f\n" sprawia że wyświetlamy tylko nazwy plików, nie pełne ścieżki
#%f - Print the basename (removes leading directories from a result)
# oraz że przechodzimy do nowej linii z wyświetlaniem
