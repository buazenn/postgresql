-- funkcje agregujące

-- wypisz zamówienia klientów o więcej niż jednej pozycji
SELECT imie, nazwisko, zamowienie.nr as zamowienie_nr, count(*) as "ile pozycji"
   FROM (( klient INNER JOIN zamowienie
             ON klient.nr = zamowienie.klient_nr
         ) INNER JOIN pozycja
             ON zamowienie.nr = pozycja.zamowienie_nr
        )
   GROUP BY imie, nazwisko, zamowienie.nr
   HAVING count(*)>1
;

-- zad P10: z tabel klientów i zamówień oblicz minimalny, maksymalny
-- i średni czas oczekiwania przez poszczególnych klientów (zamówienia
-- niezrealizowane nie liczą się do średniej).

