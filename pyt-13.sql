-- wymień pary zamówień pochodzących od tego samego klienta
SELECT Z1.nr AS zam1, Z2.nr AS zam2, Z2.klient_nr
FROM zamowienie AS Z1, zamowienie Z2
WHERE Z1.klient_nr=Z2.klient_nr
      AND z1.nr<z2.nr;

-- zad P13: wymień pary klientów mieszkających w tym samym mieście.
-- Wymień pary towarów mających tę samą cenę oraz pary z tym samym kosztem.

