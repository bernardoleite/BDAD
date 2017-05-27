.mode	columns
.headers	on
.nullvalue	NULL

SELECT TipoExame, COUNT(*) as c FROM SalaTipo GROUP BY TipoExame having c > 3;