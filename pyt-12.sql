-- wypisz liczbę pozycji zamówionych towarów przez poszczególnych klientów
SELECT klient.nr, imie, nazwisko, count(*) AS pozycji
   FROM ( klient INNER JOIN zamowienie 
             ON klient.nr = zamowienie.klient_nr
        ) INNER JOIN pozycja
             ON zamowienie.nr = pozycja.zamowienie_nr
GROUP BY klient.nr, imie, nazwisko
ORDER BY nazwisko
;

/*   zmodyfikuj poprzednie zapytanie tak by pokazywało
     liczbę różnych zamówionych towarów, a nie pozycji
*/
SELECT imie, nazwisko, count(*) AS towarów FROM (
   SELECT imie, nazwisko
      FROM ( klient INNER JOIN zamowienie 
                ON klient.nr = zamowienie.klient_nr
           ) INNER JOIN pozycja
                ON zamowienie.nr = pozycja.zamowienie_nr
   GROUP BY klient.nr, imie, nazwisko, pozycja.towar_nr
   ) AS foo
   GROUP BY imie, nazwisko
   ORDER BY nazwisko
;

/* wypisz liczbę różnych pozycji zamówionych towarów oraz wartości 
   zamówień i osiągniętego zysku w rozbiciu na klientów
*/
SELECT imie, nazwisko, count(*) AS pozycji, 
       sum(ilosc * cena) AS suma,
       sum(ilosc * (cena - koszt)) AS zysk
FROM (  (  ( klient 
             INNER JOIN zamowienie 
                ON klient.nr = zamowienie.klient_nr
           )
           INNER JOIN pozycja
              ON zamowienie.nr = pozycja.zamowienie_nr
        )
        INNER JOIN towar
           ON pozycja.towar_nr = towar.nr
     )
GROUP BY klient.nr, imie, nazwisko
ORDER BY nazwisko
;

-- zad P12: zmodyfikuj podobnie zapytanie tak, by dotyczyło towarów
-- zamiast pozycji.

