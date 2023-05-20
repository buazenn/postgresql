/* z tabel klientów, zamówienień i ich pozycji oblicz zysk 
   na poszczególnych towarach dla poszczególnych klientów
*/
SELECT imie, nazwisko, opis, sum(ilosc),
       sum(ilosc) * (cena - koszt) AS zysk
   FROM  (( klient 
             INNER JOIN zamowienie 
                ON klient.nr = zamowienie.klient_nr
          ) INNER JOIN pozycja
              ON zamowienie.nr = pozycja.zamowienie_nr
         ) INNER JOIN towar 
           ON pozycja.towar_nr = towar.nr
	GROUP BY klient.nr, towar.nr
;

-- zad P9: uporządkuj powyższy wydruk w/g klientów
-- odrzuć wiersze, dla których nie da się określić zysku.

