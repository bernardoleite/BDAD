Create Trigger T2P2
After Update On Consulta
For Each Row
When (exists (select * From Consulta where Medico = New.Medico
AND (HoraInicio) < (New.HoraFim + 0.05)
AND (HoraFim + 0.05) > New.Horainicio
AND Dia = New.Dia
AND ConsultaIdent != New.ConsultaIdent))
BEGIN
Update Consulta set HoraInicio = HoraInicio + 0.01 where (Consulta.ConsultaIdent = New.ConsultaIdent);
Update Consulta set HoraFim = HoraFim + 0.01 where (Consulta.ConsultaIdent = New.ConsultaIdent);
END;
 
Create Trigger T2P1
After Insert On Consulta
For Each Row
When (exists (select * From Consulta where Medico = New.Medico
AND HoraInicio < (New.HoraFim + 0.05)
AND (HoraFim + 0.05) > New.Horainicio
AND Dia = New.Dia
AND ConsultaIdent != New.ConsultaIdent))
BEGIN
Update Consulta set HoraInicio = HoraInicio + 0.01 where (Consulta.ConsultaIdent = New.ConsultaIdent);
Update Consulta set HoraFim = HoraFim + 0.01 where (Consulta.ConsultaIdent = New.ConsultaIdent);
END;
 
PRAGMA recursive_triggers = on;
PRAGMA foreign_keys = off;
 
INSERT INTO Consulta VALUES (6, '2017-05-20', 13.33, 14.00, 258908, 258913, NULL);
 
PRAGMA foreign_keys = on;
PRAGMA recursive_triggers = off;