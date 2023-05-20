-- sprawdź jacy klienci złożyli zamówienia na układanki
SELECT DISTINCT klient.nr, imie, nazwisko, opis
   FROM ( ( klient INNER JOIN zamowienie 
                ON klient.nr = zamowienie.klient_nr
          ) INNER JOIN pozycja
            ON zamowienie.nr = pozycja.zamowienie_nr
        ) INNER JOIN towar 
          ON pozycja.towar_nr = towar.nr
   WHERE towar.opis LIKE 'układanka%'
;

-- zad P11: sprawdź zamówienia na chusteczki higieniczne, kto
-- zamawiał, ile, jaki jest średni czas oczekiwania na realizację
-- zamówienie na chusteczki.

