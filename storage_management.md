# Speichermanagment

## Problemstellung: Trennung von Input und Gewichten im Speicher

**Format:**  
_aa bbbb bbbb bbbb_  
a = Input, Gewicht oder Inputsize  
b = Wert von Input/Gewicht/Inputsize  

---

00 0000 0000 0001 <- Input mit Wert 1  

01 0000 0000 0010 <- Gewicht der Outputnode 1 mit Wert 2  
01 0000 0000 0001 <- Gewicht der Outputnode 1 mit Wert 1  

10 0011 0001 0000 <- Inputsize mit Wert 784
11 0000 0000 1010 <- Outputsize mit Wert 10

---

Speicherzelle 0: Inputsize
Speicherzelle 1: Outputsize

Speicherzelle 2: Erster Inputwert  
Speicherzelle 2+Inputsize: Erster Gewichtswert von Outputnode 1  
Speicherzelle 2+Inputsize*2: Erster Gewichtswert von Outputnode 2  
