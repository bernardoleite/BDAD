Create Trigger T31
Before Insert On DepFuncionario
For Each Row
BEGIN
SELECT CASE
WHEN (
(New.Departamento = 'OFTALMOLOGIA' 
AND (select count(*) from DepFuncionario where Departamento = 'OFTALMOLOGIA') = 2) OR 
(New.Departamento = 'CARDIOLOGIA' 
AND (select count(*) from DepFuncionario where Departamento = 'CARDIOLOGIA') = 2) OR
(New.Departamento = 'OTORRINOLARINGOLOGIA' 
AND (select count(*) from DepFuncionario where Departamento = 'OTORRINOLARINGOLOGIA') = 2)
)
THEN RAISE(ABORT, 'Atribuição de Departamento não permitida devido a já existerem funcionários suficientes.') END;
END;
PRAGMA foreign_keys = off;
INSERT INTO DepFuncionario VALUES (258903, 'CARDIOLOGIA');
PRAGMA foreign_keys = on;

Create Trigger T32
Before Insert On DepEnfermeiro
For Each Row
BEGIN
SELECT CASE
WHEN (
(New.Departamento = 'OFTALMOLOGIA' 
AND (select count(*) from DepEnfermeiro where Departamento = 'OFTALMOLOGIA') = 2) OR 
(New.Departamento = 'CARDIOLOGIA' 
AND (select count(*) from DepEnfermeiro where Departamento = 'CARDIOLOGIA') = 2) OR
(New.Departamento = 'OTORRINOLARINGOLOGIA' 
AND (select count(*) from DepEnfermeiro where Departamento = 'OTORRINOLARINGOLOGIA') = 2)
)
THEN RAISE(ABORT, 'Atribuição de Departamento não permitida devido a já existerem Enfermeiros suficientes.') END;
END;
PRAGMA foreign_keys = off;
INSERT INTO DepEnfermeiro VALUES (156795, 'OTORRINOLARINGOLOGIA');
INSERT INTO DepEnfermeiro VALUES (156796, 'CARDIOLOGIA');
PRAGMA foreign_keys = on;

Create Trigger T33
Before Insert On DepTecnico
For Each Row
BEGIN
SELECT CASE
WHEN (
(New.Departamento = 'OFTALMOLOGIA' 
AND (select count(*) from DepTecnico where Departamento = 'OFTALMOLOGIA') = 2) OR 
(New.Departamento = 'CARDIOLOGIA' 
AND (select count(*) from DepTecnico where Departamento = 'CARDIOLOGIA') = 2) OR
(New.Departamento = 'OTORRINOLARINGOLOGIA' 
AND (select count(*) from DepTecnico where Departamento = 'OTORRINOLARINGOLOGIA') = 2)
)
THEN RAISE(ABORT, 'Atribuição de Departamento não permitida devido a já existerem Técnicos suficientes.') END;
END;
PRAGMA foreign_keys = off;
INSERT INTO DepTecnico VALUES (220913, 'OTORRINOLARINGOLOGIA');
INSERT INTO DepTecnico VALUES (220914, 'CARDIOLOGIA');
PRAGMA foreign_keys = on;


