.mode	columns
.headers	on
.nullvalue	NULL

SELECT Nome FROM Paciente 
WHERE SeguroIdent NOT IN 
(SELECT SeguroIdent From Seguro);