.mode	columns
.headers	on
.nullvalue	NULL

SELECT Sigla, Nome FROM Especialidade, Medico WHERE MedicoChefe = Medico.NIF;