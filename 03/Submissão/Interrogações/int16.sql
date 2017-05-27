.mode	columns
.headers	on
.nullvalue	NULL

CREATE VIEW MEDIC_VIEW AS SELECT(
SELECT Medico FROM DiaMedico WHERE Medico = 
(SELECT MedicoChefe FROM Especialidade WHERE Especialidade.Sigla = 'CARD') AND DiaMedico.Dia ='2017-05-22') aux ;
SELECT CASE WHEN ((SELECT MIN(aux) FROM MEDIC_VIEW) IS NOT NULL) THEN (SELECT "Está de serviço.") ELSE (SELECT "Não está de serviço") END;