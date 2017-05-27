.mode	columns
.headers	on
.nullvalue	NULL

SELECT Especialidade, TipoExame FROM 
(SELECT TipoExame, Especialidade FROM 
(SELECT Especialidade, ConsultaIdent 
FROM Medico 
INNER JOIN Consulta 
ON Medico.NIF = Consulta.Medico) p 
INNER JOIN Exame 
ON p.ConsultaIdent = Exame.Consulta) 
GROUP BY TipoExame having COUNT(*) > 1;