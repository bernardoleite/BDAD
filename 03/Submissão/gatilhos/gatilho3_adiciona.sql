Create Trigger T31
Before Delete On Medico
For Each Row
When (exists(select * from Especialidade where Especialidade.MedicoChefe = Old.NIF))
Begin
Update Especialidade set MedicoChefe = NULL Where (Especialidade.MedicoChefe = Old.NIF);
End;
 
Create Trigger T32
After Update On Especialidade
For Each Row
When (exists(select * from Especialidade where Especialidade.MedicoChefe ISNULL))
Begin
    UPDATE Especialidade set MedicoChefe = (Select NIF From Medico Where Medico.Especialidade = (select SIGLA from Especialidade where Especialidade.MedicoChefe ISNULL));
End;
 
