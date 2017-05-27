.mode	columns
.headers	on
.nullvalue	NULL


SELECT Funcionario, MAX(Duração) FROM DiaTrabalho, DiaFuncionario 
WHERE DiaTrabalho.Ident = DiaFuncionario.Ident;