--
-- File generated with SQLiteStudio v3.1.1 on Fri May 12 21:17:51 2017
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: Consulta
CREATE TABLE Consulta (ConsultaIdent INTEGER PRIMARY KEY, Dia INTEGER, HoraInicio TIME, HoraFim TIME CHECK (HoraInicio < HoraFim), Paciente REFERENCES Paciente (NIF), M�dico REFERENCES M�dico (NIF), Enfermeiro REFERENCES Enfermeiro (NIF) UNIQUE, UNIQUE (Dia, Paciente, M�dico));
INSERT INTO Consulta VALUES (1, 31, 12, 13, 258908, 258909, NULL);
INSERT INTO Consulta VALUES (2, 1, 12, 12.30, 258907, 258910, NULL);
-- Table: Departamento
CREATE TABLE Departamento (Designacao TEXT PRIMARY KEY);

INSERT INTO Departamento VALUES ('OFTALMOLOGIA');
INSERT INTO Departamento VALUES ('CARDIOLOGIA');
INSERT INTO Departamento VALUES ('AUTORRINOLARINGOLOGIA');

-- Table: DepEnfermeiro
CREATE TABLE DepEnfermeiro (Enfermeiro REFERENCES Enfermeiro (NIF), Departamento REFERENCES Departamento (Designa��o), PRIMARY KEY (Enfermeiro, Departamento));

-- Table: DepFuncion�rio
CREATE TABLE DepFuncion�rio (Funcion�rio REFERENCES Funcion�rio (NIF), Departamento REFERENCES Departamento (Designa��o), PRIMARY KEY (Funcion�rio, Departamento));

-- Table: DepT�cnico
CREATE TABLE DepT�cnico (T�cnico REFERENCES T�cnico (NIF), Departamento REFERENCES Departamento (Designa��o), PRIMARY KEY (T�cnico, Departamento));

-- Table: DiaEnfermeiro
CREATE TABLE DiaEnfermeiro (DiaTrabalho REFERENCES DiaTrabalho (Dia), Enfermeiro REFERENCES Enfermeiro (NIF), PRIMARY KEY (DiaTrabalho, Enfermeiro));

-- Table: DiaFuncion�rio
CREATE TABLE DiaFuncion�rio (Dia REFERENCES DiaTrabalho (Dia), Funcion�rio REFERENCES Funcion�rio, PRIMARY KEY (Dia, Funcion�rio));

-- Table: DiaM�dico
CREATE TABLE DiaM�dico (Dia REFERENCES DiaTrabalho (Dia), M�dico REFERENCES M�dico (NIF), PRIMARY KEY (Dia, M�dico));

-- Table: DiaTrabalho
CREATE TABLE DiaTrabalho (HoraInicio TIME, Dura��o INTEGER, HoraFim TIME CHECK (HoraInicio < HoraFim), Dia INTEGER PRIMARY KEY);

-- Table: DiaT�cnico
CREATE TABLE DiaT�cnico (DiaTrabalho REFERENCES DiaTrabalho (Dia), T�cnico REFERENCES T�cnico (NIF), PRIMARY KEY (DiaTrabalho, T�cnico));

-- Table: Enfermeiro
CREATE TABLE Enfermeiro (Nome TEXT, Idade INTEGER, DataNascimento DATE, NIF INTEGER PRIMARY KEY, Telem�vel INTEGER, Departamento REFERENCES Departamento (Designa��o));

-- Table: Especialidde
CREATE TABLE Especialidde (Designa��o TEXT PRIMARY KEY, M�dicoChefe REFERENCES M�dico (NIF));

-- Table: Exame
CREATE TABLE Exame (ExameIdent INTEGER PRIMARY KEY, Dia INTEGER, HoraInicio TIME, HoraFim TIME CHECK (HoraInicio < HoraFim), Resultado STRING, Consulta REFERENCES Consulta (ConsultaIdent), Exame REFERENCES TipoExame);

-- Table: Funcion�rio
CREATE TABLE Funcion�rio (Nome TEXT, Idade INTEGER, DataNascimento DATE, NIF INTEGER PRIMARY KEY, Telem�vel INTEGER);

-- Table: Limpeza
CREATE TABLE Limpeza (Funcion�rio REFERENCES Funcion�rio (NIF), SalaExame REFERENCES SalaExame (ID), PRIMARY KEY (Funcion�rio, SalaExame));

-- Table: M�dico
CREATE TABLE Medico (Nome TEXT, Idade INTEGER, DataNascimento DATE, NIF INTEGER PRIMARY KEY, Telem�vel INTEGER, Especialidade REFERENCES Especialidade (Designacao));

INSERT INTO Medico VALUES ('Doutor(a) Orlando Mendes', '40', 1970, 258909, 919028760, 'CARDIOLOGIA');
INSERT INTO Medico VALUES ('Doutor(a) Miguel Vaz', '41', 1960, 258910, 919028799, 'OFTALMOLOGIA');
INSERT INTO Medico VALUES ('Doutor(a) Rita Malaco', '32', 1980, 258911, 919028800, 'OFTALMOLOGIA');

-- Table: Paciente
CREATE TABLE Paciente (Nome TEXT, Idade INTEGER, DataNascimento DATE, NIF INTEGER PRIMARY KEY, Telem�vel INTEGER, SeguroIdent REFERENCES Seguro (SeguroIdent));

INSERT INTO Paciente VALUES ('Bernardo Martins', '21', 1996, 258908, 919028762, 100001);
INSERT INTO Paciente VALUES ('Susana Melo', '30', 1981, 258907, 919028300, 100002);

-- Table: SalaExame
CREATE TABLE SalaExame (ID INTEGER PRIMARY KEY, HoraLimpeza INT);

-- Table: SalaTipo
CREATE TABLE SalaTipo (TipoExame REFERENCES TipoExame (Designa�ao), SalaExame REFERENCES SalaExame (ID), PRIMARY KEY (TipoExame, SalaExame));

-- Table: Seguro
CREATE TABLE Seguro (SeguroIdent INTEGER PRIMARY KEY, Seguradora TEXT, DataValidade DATE CHECK (DataValidade > 2017), Tipo TEXT, Cobertura INTEGER);

INSERT INTO Seguro VALUES (100001, 'ADSE', 2020, 'COMPLETO', 250);

-- Table: TipoExame
CREATE TABLE TipoExame (Designa�ao TEXT PRIMARY KEY);

-- Table: T�cnico
CREATE TABLE T�cnico (Nome TEXT, Idade INTEGER, DataNascimento DATE, NIF INTEGER PRIMARY KEY, Telem�vel INTEGER);

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
