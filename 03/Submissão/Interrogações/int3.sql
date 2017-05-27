.mode	columns
.headers	on
.nullvalue	NULL

SELECT AVG(HoraFim-HoraInicio) 
FROM Consulta WHERE Consulta.Medico = 
(SELECT distinct NIF FROM Medico WHERE Medico.Especialidade = 'CARD');