.mode	columns
.headers	on
.nullvalue	NULL

SELECT SalaExame FROM SalaTipo
GROUP BY SalaExame
HAVING COUNT(*) = (
                   SELECT MAX(Cnt) 
                   FROM(
                         SELECT COUNT(*) as Cnt
                         FROM SalaTipo
                         GROUP BY SalaExame
                        ) tmp
                    );