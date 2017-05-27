.mode	columns
.headers	on
.nullvalue	NULL

SELECT CAST((SELECT COUNT (*) FROM Exame) AS FLOAT) / (SELECT COUNT (*) FROM Paciente);