PRAGMA recursive_triggers = on;
PRAGMA foreign_keys = off;
SELECT " ";
SELECT "TESTE INSERÇÃO DE CONSULTA SOBREPOSTA";
SELECT " ";
SELECT * FROM Consulta;
SELECT " ";
INSERT INTO Consulta VALUES (6, '2017-05-20', 13.30, 14.00, 258908, 258913, NULL);
SELECT * FROM Consulta;

PRAGMA foreign_keys = on;
PRAGMA recursive_triggers = off;