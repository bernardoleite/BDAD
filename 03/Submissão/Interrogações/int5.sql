.mode	columns
.headers	on
.nullvalue	NULL

SELECT Consulta.Dia FROM Consulta WHERE Consulta.Medico =
(SELECT NIF From Medico, Consulta WHERE Nome = 'Bernardo Martins' INTERSECT SELECT Medico FROM Medico, Consulta WHERE Medico.NIF = Consulta.Medico INTERSECT 
SELECT Medico FROM Consulta WHERE date('now') <= Consulta.Dia AND date('now', '+3 day') >= Consulta.Dia);