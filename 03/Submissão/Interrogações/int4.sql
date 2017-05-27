.mode	columns
.headers	on
.nullvalue	NULL


SELECT Nome FROM Medico INTERSECT SELECT Nome FROM Paciente;