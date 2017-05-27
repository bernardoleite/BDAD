.mode	columns
.headers	on
.nullvalue	NULL

SELECT COUNT(Consulta) FROM Exame WHERE Exame.Consulta = (SELECT MAX(Consulta) FROM Exame);