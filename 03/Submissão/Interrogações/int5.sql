.mode	columns
.headers	on
.nullvalue	NULL

SELECT Dia From Consulta Where (Consulta.Medico = (select NIF from Medico where Medico.Nome = 'Bernardo Martins')) 
And Dia >= date('now') AND Dia <= date('now', '+20 day');
