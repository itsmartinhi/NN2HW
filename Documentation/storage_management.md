# Speichermanagment

## Problemstellung: Trennung von Input und Gewichten im Speicher

**Format:**  
_aa bbbb bbbb bbbb_  
a = Input, Gewicht oder Inputsize  
b = Wert von Input/Gewicht/Inputsize  

---

00 0000 0000 0001 <- Input mit Wert 1  

01 0000 0000 0010 <- Gewicht der Outputnode 1 mit Wert 2  
01 0000 0000 0001 <- Gew icht der Outputnode 1 mit Wert 1  

10 0011 0001 0000 <- Inputsize mit Wert 784
11 0000 0000 1010 <- Outputsize mit Wert 10

---

Speicherzelle 0: Inputsize
Speicherzelle 1: Outputsize

Speicherzelle 2: Erster Inputwert  
Speicherzelle 2+Inputsize: Erster Gewichtswert von Outputnode 1  
Speicherzelle 2+Inputsize*2: Erster Gewichtswert von Outputnode 2  



Notizen:
- Speicherbreite kein Problem
- evtl. 2 Speicher für Gewichte und Inputs
- ROM für Gewichte & RAM für Input & Output


32bit Speicher (da 4 Multiplizierer)
RAM = 4 * 8bit Input
ROM = 4 * 8bit Gewichte

## Kalkulation der Storage-Input-Size

(Länge des Inputvektors in Byte + 1 (Für Bias)) * 8 / 4

RAM brauch min. ein write enable

Input Storage Länge und Weight Länge als Constanten zur Synthese nehmen

Incrementierer geben nur ein "ich bin fertig" Signal.  
Incrementierer sollte idealerweise rückwärtslaufen -> sobald negativ -> done.  
Benötigt Vergleichsmodul (erstes Bit!!!)

Multiplizierer muss ready Signal an Register weitergeben sonst übergibt Register jedes mal den Wert.

Argmax aufteilen:
- Register das Max wert hält
- subtrahierer der vergleicht

for generate statement zum generieren von instanzen (z.B. für Multiplizierer)

