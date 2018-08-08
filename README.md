Diese Scripts erstellt ein CommMenu, über das man Nachschub anfordern kann. Der Bestellte Nachschub wird dann per Hubschrauber eingeflogen.


callSupport.sqf lässt den Spieler die _dropPos über die Karte wählen. Der Support-Typ wird als parameter übergeben.

Hubschraubertyp und SpawnPosition werden in createHeli.sqf festgelegt.

Der Nachschub wird gewöhnlich in Flecktarn geliefert. Wenn aber die Weste des Nachschub-Anforderers in "BL_Westen" eingetragen ist, wird der Nachschub in Tropentarn geliefert.

