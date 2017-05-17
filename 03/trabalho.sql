--
-- File generated with SQLiteStudio v3.1.1 on Fri May 12 21:17:51 2017
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: Consulta
CREATE TABLE Consulta (ConsultaIdent INTEGER PRIMARY KEY, Dia INTEGER, HoraInicio TIME, HoraFim TIME CHECK (HoraInicio < HoraFim), Paciente REFERENCES Paciente (NIF), Médico REFERENCES Médico (NIF), Enfermeiro REFERENCES Enfermeiro (NIF) UNIQUE, UNIQUE (Dia, Paciente, Médico));
INSERT INTO Consulta VALUES (1, 31, 12, 13, 258908, 258909, NULL);
INSERT INTO Consulta VALUES (2, 1, 12, 12.30, 258907, 258910, NULL);
-- Table: Departamento
CREATE TABLE Departamento (Designacao TEXT PRIMARY KEY);

INSERT INTO Departamento VALUES ('OFTALMOLOGIA');
INSERT INTO Departamento VALUES ('CARDIOLOGIA');
INSERT INTO Departamento VALUES ('AUTORRINOLARINGOLOGIA');

-- Table: DepEnfermeiro
CREATE TABLE DepEnfermeiro (Enfermeiro REFERENCES Enfermeiro (NIF), Departamento REFERENCES Departamento (Designação), PRIMARY KEY (Enfermeiro, Departamento));

-- Table: DepFuncionário
CREATE TABLE DepFuncionário (Funcionário REFERENCES Funcionário (NIF), Departamento REFERENCES Departamento (Designação), PRIMARY KEY (Funcionário, Departamento));

-- Table: DepTécnico
CREATE TABLE DepTécnico (Técnico REFERENCES Técnico (NIF), Departamento REFERENCES Departamento (Designação), PRIMARY KEY (Técnico, Departamento));

-- Table: DiaEnfermeiro
CREATE TABLE DiaEnfermeiro (DiaTrabalho REFERENCES DiaTrabalho (Dia), Enfermeiro REFERENCES Enfermeiro (NIF), PRIMARY KEY (DiaTrabalho, Enfermeiro));

-- Table: DiaFuncionário
CREATE TABLE DiaFuncionário (Dia REFERENCES DiaTrabalho (Dia), Funcionário REFERENCES Funcionário, PRIMARY KEY (Dia, Funcionário));

-- Table: DiaMédico
CREATE TABLE DiaMédico (Dia REFERENCES DiaTrabalho (Dia), Médico REFERENCES Médico (NIF), PRIMARY KEY (Dia, Médico));

-- Table: DiaTrabalho
CREATE TABLE DiaTrabalho (HoraInicio TIME, Duração INTEGER, HoraFim TIME CHECK (HoraInicio < HoraFim), Dia INTEGER PRIMARY KEY);

-- Table: DiaTécnico
CREATE TABLE DiaTécnico (DiaTrabalho REFERENCES DiaTrabalho (Dia), Técnico REFERENCES Técnico (NIF), PRIMARY KEY (DiaTrabalho, Técnico));

-- Table: Enfermeiro
CREATE TABLE Enfermeiro (Nome TEXT, Idade INTEGER, DataNascimento DATE, NIF INTEGER PRIMARY KEY, Telemóvel INTEGER, Departamento REFERENCES Departamento (Designação));

-- Table: Especialidde
CREATE TABLE Especialidde (Designação TEXT PRIMARY KEY, MédicoChefe REFERENCES Médico (NIF));

-- Table: Exame
CREATE TABLE Exame (ExameIdent INTEGER PRIMARY KEY, Dia INTEGER, HoraInicio TIME, HoraFim TIME CHECK (HoraInicio < HoraFim), Resultado STRING, Consulta REFERENCES Consulta (ConsultaIdent), Exame REFERENCES TipoExame);

-- Table: Funcionário
CREATE TABLE Funcionário (Nome TEXT, Idade INTEGER, DataNascimento DATE, NIF INTEGER PRIMARY KEY, Telemóvel INTEGER);

-- Table: Limpeza
CREATE TABLE Limpeza (Funcionário REFERENCES Funcionário (NIF), SalaExame REFERENCES SalaExame (ID), PRIMARY KEY (Funcionário, SalaExame));

-- Table: Médico
CREATE TABLE Medico (Nome TEXT, Idade INTEGER, DataNascimento DATE, NIF INTEGER PRIMARY KEY, Telemóvel INTEGER, Especialidade REFERENCES Especialidade (Designacao));

INSERT INTO Medico VALUES ('Doutor(a) Orlando Mendes', '40', 1970, 258909, 919028760, 'CARDIOLOGIA');
INSERT INTO Medico VALUES ('Doutor(a) Miguel Vaz', '41', 1960, 258910, 919028799, 'OFTALMOLOGIA');
INSERT INTO Medico VALUES ('Doutor(a) Rita Malaco', '32', 1980, 258911, 919028800, 'OFTALMOLOGIA');

-- Table: Paciente
CREATE TABLE Paciente (Nome TEXT, Idade INTEGER, DataNascimento DATE, NIF INTEGER PRIMARY KEY, Telemóvel INTEGER, SeguroIdent REFERENCES Seguro (SeguroIdent));

INSERT INTO Paciente VALUES ('Bernardo Martins', '21', 1996, 258908, 919028762, 100001);
INSERT INTO Paciente VALUES ('Susana Melo', '30', 1981, 258907, 919028300, 100002);

-- Table: SalaExame
CREATE TABLE SalaExame (ID INTEGER PRIMARY KEY, HoraLimpeza INT);

-- Table: SalaTipo
CREATE TABLE SalaTipo (TipoExame REFERENCES TipoExame (Designaçao), SalaExame REFERENCES SalaExame (ID), PRIMARY KEY (TipoExame, SalaExame));

-- Table: Seguro
CREATE TABLE Seguro (SeguroIdent INTEGER PRIMARY KEY, Seguradora TEXT, DataValidade DATE CHECK (DataValidade > 2017), Tipo TEXT, Cobertura INTEGER);

INSERT INTO Seguro VALUES (100001, 'ADSE', 2020, 'COMPLETO', 250);

-- Table: TipoExame
CREATE TABLE TipoExame (Designaçao TEXT PRIMARY KEY);

-- Table: Técnico
CREATE TABLE Técnico (Nome TEXT, Idade INTEGER, DataNascimento DATE, NIF INTEGER PRIMARY KEY, Telemóvel INTEGER);

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
