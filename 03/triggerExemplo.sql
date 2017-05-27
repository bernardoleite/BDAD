Create Trigger T1
After Insert On Paciente
For Each Row
When (New.Nome ISNULL)
BEGIN
Update Paciente Set Nome = 'error' WHERE NIF = new.NIF;
END;

PRAGMA foreign_keys = off;
INSERT INTO Paciente VALUES(NULL,20,1997,24356,919028762,100005);
PRAGMA foreign_keys = on;