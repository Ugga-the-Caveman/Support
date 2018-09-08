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
Spieler die einen speziellen Rucksack tragen, haben Zugriff auf ein Menü, über das man Nachschub anforden kann.
  
Der Nachschub wird per Hubschrauber eingeflogen und an der Abwurfzone, die man über die Karte gewhlt hat abgeworfen.

Hat der Hubschrauber seine Fracht abgeworfen, fliegt er zurück zur spawnPosition und wird dort gelöscht.
</p>

## Installation
<p>
1. Lade alle Dateien als zip-File herunter und extrahiere anschließend das Paket.

3. Kopier den Ordner Support in den Ordner deiner Mission.

4. Füge den Inhalt der heruntergeladenen init.sqf deiner Init.sqf hinzu.

5. Füge den Inhalt der heruntergeladenen Description.ext deiner Description.ext hinzu.
Sollte in deiner Description.ext bereits eine "CfgCommunicationMenu" class existieren, dann füge nur das Menü ein.
</p>


## Bedienung
<p>
Das CommandMenu öffnet man mit den Zahlentasten (0-8-x). Eventuell muss man dazu seine ACE Tastenbelegung anpassen.

Um das Menu zu benutzen, braucht der Nachschub-Anforderer eine Karte(oder GPS und dergleichen) und einen passenden Funkrucksack.
Die Funkrucksäcke werden in den globalen Variablen UGBL_RadiosFleck und UGBL_RadiosTropen definiert. Der Rucksack des Nachschub-Anforderers, bestimmt die Tarnfarbe des Nachschubes.

Um die spawnPosition des Hubschraubers festzulegen, muss man auf dem Server einem Marker namens "supportSpawnMarker" erstellen. Dieser Marker kann Lokal sein und jederzeit erstellt/verschoben/gelöscht werden. Solange der Marker nicht existiert, wird der Hubschrauber, in gewissem Abstand, in zufälliger Richtung, um den Nachschub-Anforderer herum erstellt.
</p>


### Menü anpassen
<p>
todo =)
</p>

 
