# Call Support Menu
Fügt ein Menü in das CommandMenu ein Wo man Nachschub bestellen kann, der dann per Hubschrauber eingeflogen wird.
<p>
  <sub>
  Tested on: Arma-3 APEX Version 1.84<br/>
  Required Mods: <a href="https://github.com/CBATeam/CBA_A3/releases">CBA A3</a>, <a href="http:/bwmod.de/">BW-Mod</a>, 14JgKp Mod<br/>
</p>
<hr>


## Beschreibung
<p>
Trägt ein Spieler einen passenden Funkrucksack, kann er das Menü öffnen um einen Nachschubtyp auszuwählen.
Die Tarnfarbe des Nachschubs wird über die Tarnfarbe des Funkrucksackes bestimmt.

Wählt ein Spieler einen Nachschubtyp, öffnet sich seine Karte, wo er durch links-klick die Abwurfzone bestimmen kann.

Ist keine spawnPosition definiert, wird der Hubschrauber zufällig irgendwo um den Spieler herum erstellt.

Hat der Hubschrauber seine Fracht abgeworfen, fliegt er zurück zur spawnPosition und wird dort gelöscht.
</p>

## Installation
<p>
Klick auf den grünen Button, um alle Dateien als zip-File herunterzuladen.

Extrahiere das Packet.

Kopier den Ordner Support in den Ordner deiner Mission.

Füge den Inhalt der heruntergeladenen init.sqf deiner Init.sqf hinzu.

Füge den Inhalt der heruntergeladenen Description.ext deiner Description.ext hinzu.
Sollte in deiner Description.ext bereits eine "CfgCommunicationMenu" class existieren, dann füge nur das Menü ein.
</p>


## Bedienung
<p>
  Das CommandMenu öffnet man mit (0-8-x). Eventuell muss man dazu seine ACE Tastenbelegung anpassen.
</p>


### Hubschrauber spawnposition definieren
<p>
Erstelle einen Marker mit dem Namen supportSpawnMarker.
Der Marker kann auch während der Mission erstellt/verschoben/gelöscht werden.
Du kannst diesen Marker auch per script erstellen.
Kann ein Localmarker sein muss aber auf dem server erstellt werden.
</p>


### Funkrucksäcke definieren
<p>
In support\init.sqf sind 2 Arrays definiert. (UGBL_RadiosFleck  und UGBL_RadiosTropen). 
Diese Arrays enthalten die Classnames der Rucksäcke, die man tragen muss damit man das Menü benutzen kann.
</p>


### Menü anpassen
<p>
Blub fragen XD
</p>

 
