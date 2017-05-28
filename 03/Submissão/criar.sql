--
-- File generated with SQLiteStudio v3.1.1 on Fri May 12 21:17:51 2017
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: Consulta
CREATE TABLE Consulta (ConsultaIdent INTEGER PRIMARY KEY, Dia DATE, HoraInicio TIME, HoraFim TIME CHECK (HoraInicio < HoraFim), Paciente REFERENCES Paciente (NIF), Medico REFERENCES Medico (NIF), Enfermeiro REFERENCES Enfermeiro (NIF) UNIQUE, UNIQUE (Dia, Paciente, Medico));

-- Table: Departamento
CREATE TABLE Departamento (Designacao TEXT PRIMARY KEY);


-- Table: DepEnfermeiro
CREATE TABLE DepEnfermeiro (Enfermeiro REFERENCES Enfermeiro (NIF), Departamento REFERENCES Departamento (Designacao), PRIMARY KEY (Enfermeiro, Departamento));


-- Table: DepFuncionário
CREATE TABLE DepFuncionario (Funcionario REFERENCES Funcionario (NIF), Departamento REFERENCES Departamento (Designacao), PRIMARY KEY (Funcionario, Departamento));


-- Table: DepTécnico
CREATE TABLE DepTecnico (Tecnico REFERENCES Tecnico (NIF), Departamento REFERENCES Departamento (Designação), PRIMARY KEY (Tecnico, Departamento));


-- Table: DiaEnfermeiro
CREATE TABLE DiaEnfermeiro (DiaTrabalho REFERENCES DiaTrabalho (Dia), Enfermeiro REFERENCES Enfermeiro (NIF), PRIMARY KEY (DiaTrabalho, Enfermeiro));

-- Table: DiaFuncionário
CREATE TABLE DiaFuncionario (Ident REFERENCES DiaTrabalho (Ident), Funcionario REFERENCES Funcionario (NIF), PRIMARY KEY (Ident, Funcionario));

	
-- Table: DiaMédico
CREATE TABLE DiaMedico (Dia REFERENCES DiaTrabalho (Dia), Medico REFERENCES Medico (NIF), PRIMARY KEY (Dia, Medico));


-- Table: DiaTrabalho
CREATE TABLE DiaTrabalho (HoraInicio TIME, Duração INTEGER, HoraFim TIME CHECK (HoraInicio < HoraFim), Dia DATE, Ident INTEGER PRIMARY KEY);


-- Table: DiaTécnico
CREATE TABLE DiaTécnico (DiaTrabalho REFERENCES DiaTrabalho (Dia), Técnico REFERENCES Técnico (NIF), PRIMARY KEY (DiaTrabalho, Técnico));

-- Table: Enfermeiro
CREATE TABLE Enfermeiro (Nome TEXT, Idade INTEGER, DataNascimento DATE, NIF INTEGER PRIMARY KEY, Telemóvel INTEGER, Departamento REFERENCES Departamento (Designação));



-- Table: Especialidde
CREATE TABLE Especialidade (Sigla TEXT PRIMARY KEY,Designação TEXT , MedicoChefe REFERENCES Medico (NIF));


-- Table: Exame
CREATE TABLE Exame (ExameIdent INTEGER PRIMARY KEY, Dia INTEGER, HoraInicio TIME, HoraFim TIME CHECK (HoraInicio < HoraFim), Resultado STRING, Consulta REFERENCES Consulta (ConsultaIdent), TipoExame REFERENCES TipoExame, Medico REFERENCES Medico (NIF), Enfermeiro REFERENCES Enfermeiro (NIF), Tecnico REFERENCES Tecnico (NIF));



-- Table: Funcionário
CREATE TABLE Funcionario (Nome TEXT, Idade INTEGER, DataNascimento DATE, NIF INTEGER PRIMARY KEY, Telemóvel INTEGER);


-- Table: Limpeza
CREATE TABLE Limpeza (Funcionario REFERENCES Funcionario (NIF), SalaExame REFERENCES SalaExame (ID), PRIMARY KEY (Funcionario, SalaExame));

-- Table: Médico
CREATE TABLE Medico (Nome TEXT, Idade INTEGER, DataNascimento DATE, NIF INTEGER PRIMARY KEY, Telemóvel INTEGER, Especialidade REFERENCES Especialidade (Sigla));



-- Table: Paciente
CREATE TABLE Paciente (Nome TEXT, Idade INTEGER, DataNascimento DATE, NIF INTEGER PRIMARY KEY, Telemóvel INTEGER, SeguroIdent REFERENCES Seguro (SeguroIdent));



-- Table: SalaExame
CREATE TABLE SalaExame (ID INTEGER PRIMARY KEY, HoraLimpeza INT);



-- Table: SalaTipo
CREATE TABLE SalaTipo (TipoExame REFERENCES TipoExame (Designaçao), SalaExame REFERENCES SalaExame (ID), PRIMARY KEY (TipoExame, SalaExame));



-- Table: Seguro
CREATE TABLE Seguro (SeguroIdent INTEGER PRIMARY KEY, Seguradora TEXT, DataValidade DATE CHECK (DataValidade > 2017), Tipo TEXT, Cobertura INTEGER);



-- Table: TipoExame
CREATE TABLE TipoExame (Designaçao TEXT PRIMARY KEY);



-- Table: Técnico
CREATE TABLE Tecnico (Nome TEXT, Idade INTEGER, DataNascimento DATE, NIF INTEGER PRIMARY KEY, Telemóvel INTEGER);



COMMIT TRANSACTION;
PRAGMA foreign_keys = on;