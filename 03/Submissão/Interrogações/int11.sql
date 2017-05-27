.mode	columns
.headers	on
.nullvalue	NULL

SELECT TipoExame, count(*) as sum FROM Exame GROUP BY TipoExame;