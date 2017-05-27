.mode	columns
.headers	on
.nullvalue	NULL

SELECT Exame.Medico, ConsultaIdent FROM Exame, Consulta 
WHERE Consulta.Medico = Exame.Medico 
AND Consulta.ConsultaIdent = Exame.Consulta;