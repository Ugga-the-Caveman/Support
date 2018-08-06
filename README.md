Diese Scripts erstellt ein CommMenu, über das man Nachschub anfordern kann. Der Bestellte Nachschub wird dann per Hubschrauber eingeflogen.


callSupport.sqf lässt den Spieler die _dropPos über die Karte wählen. Der Typ und die _spawnPos werden als parameter übergeben.
Wenn man die _spawnPos nicht definiert, erscheint der Hubschrauber zufällig um den _caller herum.

Dann wird createHeli.sqf auf dem Server gestartet, was dann den Hubschrauber erstellt und den Support abwerfen lässt.

Der Nachschub wird gewöhnlich in FleckTarn geliefert. Wenn aber die Weste des Nachschub-Anforderers in "BL_Westen" eingetragen ist, wird der Nachschub in Tropentarn geliefert.

