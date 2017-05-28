Create Trigger T11
Before Insert On DepFuncionario
For Each Row
BEGIN
SELECT CASE
WHEN 
( (select count(*) from DepFuncionario where Departamento = New.Departamento) = 2)
THEN RAISE(ABORT, 'Atribuição de Departamento não permitida devido a já existerem funcionários suficientes.') END;
END;


Create Trigger T12
Before Insert On DepEnfermeiro
For Each Row
BEGIN
SELECT CASE
WHEN 
( (select count(*) from DepEnfermeiro where Departamento = New.Departamento) = 2)
THEN RAISE(ABORT, 'Atribuição de Departamento não permitida devido a já existerem Enfermeiros suficientes.') END;
END;


Create Trigger T13
Before Insert On DepTecnico
For Each Row
BEGIN
SELECT CASE
WHEN 
( (select count(*) from DepTecnico where Departamento = New.Departamento) = 2)
THEN RAISE(ABORT, 'Atribuição de Departamento não permitida devido a já existerem Técnicos suficientes.') END;
END;



