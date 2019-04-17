--------------------------------------------------------------------------------
------- 4 - ZAPYTANIE WYSWIETLA SKLAD SEDZIOWSKI W MECZU O PODANYM ID ----------
--------------------------------------------------------------------------------
SELECT
ID_MECZU, 
DATA_MECZU, 
CZAS_MECZU,
(SELECT KLUB.NAZWA FROM DRUZYNA join klub on KLUB.ID_KLUBU = DRUZYNA.KLUB_ID_KLUBU WHERE MECZ.DRUZYNA_ID_DRUZYNY_1 = DRUZYNA.ID_DRUZYNY ) as KLUB_1,
(SELECT KLUB.NAZWA FROM DRUZYNA join klub on KLUB.ID_KLUBU = DRUZYNA.KLUB_ID_KLUBU WHERE MECZ.DRUZYNA_ID_DRUZYNY_2 = DRUZYNA.ID_DRUZYNY ) as KLUB_2,
(SELECT STADION.NAZWA FROM STADION WHERE MECZ.STADION_ID_STADIONU = STADION.ID_STADIONU) as STADION,
(SELECT STADION.LOKALIZACJA FROM STADION WHERE MECZ.STADION_ID_STADIONU = STADION.ID_STADIONU) as LOKALIZACJA
FROM MECZ;
SELECT 
  OSOBA.NAZWISKO AS NAZWISKO,
  OSOBA.IMIE AS IMIE,
  OSOBA.NARODOWOSC AS NARODOWOSC,
  KLASA_SEDZIEGO.NAZWA_KLASY AS KLASA_SEDZIEGO
FROM OSOBA
  JOIN SEDZIA_MECZ
    ON SEDZIA_MECZ.OSOBA_ID_OSOBY = OSOBA.ID_OSOBY
  JOIN MECZ
    ON MECZ.SEDZIA_MECZ_ID_OSOBY_SEDZIA_1 = SEDZIA_MECZ.ID_SEDZIEGO
    OR MECZ.SEDZIA_MECZ_ID_OSOBY_SEDZIA_2 = SEDZIA_MECZ.ID_SEDZIEGO
    OR MECZ.SEDZIA_MECZ_ID_OSOBY_SEDZIA_3 = SEDZIA_MECZ.ID_SEDZIEGO
  JOIN KLASA_SEDZIEGO
    ON SEDZIA_MECZ.KLASA_SEDZIEGO_ID_KLASY = KLASA_SEDZIEGO.ID_KLASY
WHERE MECZ.ID_MECZU = &Podaj_Id_Meczu
ORDER BY OSOBA.NAZWISKO;

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------