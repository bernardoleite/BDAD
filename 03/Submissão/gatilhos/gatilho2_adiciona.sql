Create Trigger T21
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
 
Create Trigger T22
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
 
