-- ZAŁOŻENIE: nie ma problemów w integralnością referencyjną
-- tzn. klucze obce mają dodane ON DELETE CASCADE
-- albo usuwamy elementy nie będące adresatem klucza obcego

-- usuń z tabeli towarów wszelkie donice, ale tylko jeśli nie są 
-- zamawiane (innych nie da się usunąć mając zamówienia)
DELETE FROM towar
  WHERE opis LIKE 'donica%' AND nr NOT IN (
    SELECT towar_nr FROM pozycja
    )
;

-- usuń towary niezamawiane
DELETE FROM towar
  WHERE nr NOT IN (
    SELECT towar_nr FROM pozycja
    )
;

-- usuń towary o nieznanej cenie
-- (przedtem być może warto usunąć wszelkie pozycje faktur
--  DELETE from pozycja;)
DELETE FROM towar
  WHERE cena IS NULL
;

-- zad 15: usuń klientów z Sopotu,
-- usuń klientów, których telefonu nie znamy
-- usuń kody kreskowe nie odpowiadające żadnym towarom
-- usuń klientów, którzy nie złożyli żadnego zamówienia
-- usuń zamówienie, które nie posiada pozycji
-- usuń towary nie posiadające kodu kreskowego
