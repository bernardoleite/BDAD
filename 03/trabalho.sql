--
-- File generated with SQLiteStudio v3.1.1 on Fri May 12 21:17:51 2017
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: Consulta
CREATE TABLE Consulta (ConsultaIdent INTEGER PRIMARY KEY, Dia DATE, HoraInicio TIME, HoraFim TIME CHECK (HoraInicio < HoraFim), Paciente REFERENCES Paciente (NIF), Medico REFERENCES Medico (NIF), Enfermeiro REFERENCES Enfermeiro (NIF) UNIQUE, UNIQUE (Dia, Paciente, Medico));
INSERT INTO Consulta VALUES (1, '2017-05-19', 12, 13, 258908, 258909, NULL);
INSERT INTO Consulta VALUES (2, '2017-05-19', 12, 12.30, 258907, 258910, NULL);
INSERT INTO Consulta VALUES (3, '2017-05-20', 12.30, 13.30, 258907, 258913, NULL);
INSERT INTO Consulta VALUES (4, '2017-05-21', 12, 12.30, 258908, 258912, NULL);
INSERT INTO Consulta VALUES (5, '2017-05-21', 13, 14.30, 258906, 258913, NULL);

-- Table: Departamento
CREATE TABLE Departamento (Designacao TEXT PRIMARY KEY);

INSERT INTO Departamento VALUES ('OFTALMOLOGIA');
INSERT INTO Departamento VALUES ('CARDIOLOGIA');
INSERT INTO Departamento VALUES ('OTORRINOLARINGOLOGIA');

-- Table: DepEnfermeiro
CREATE TABLE DepEnfermeiro (Enfermeiro REFERENCES Enfermeiro (NIF), Departamento REFERENCES Departamento (Designação), PRIMARY KEY (Enfermeiro, Departamento));

-- Table: DepFuncionário
CREATE TABLE DepFuncionario (Funcionario REFERENCES Funcionario (NIF), Departamento REFERENCES Departamento (Designação), PRIMARY KEY (Funcionario, Departamento));

-- Table: DepTécnico
CREATE TABLE DepTécnico (Técnico REFERENCES Técnico (NIF), Departamento REFERENCES Departamento (Designação), PRIMARY KEY (Técnico, Departamento));

-- Table: DiaEnfermeiro
CREATE TABLE DiaEnfermeiro (DiaTrabalho REFERENCES DiaTrabalho (Dia), Enfermeiro REFERENCES Enfermeiro (NIF), PRIMARY KEY (DiaTrabalho, Enfermeiro));

-- Table: DiaFuncionário
CREATE TABLE DiaFuncionario (Ident REFERENCES DiaTrabalho (Ident), Funcionario REFERENCES Funcionario (NIF), PRIMARY KEY (Ident, Funcionario));

INSERT INTO DiaFuncionario VALUES (0, 258900);
INSERT INTO DiaFuncionario VALUES (1, 258900);
INSERT INTO DiaFuncionario VALUES (2, 258900);
INSERT INTO DiaFuncionario VALUES (3, 258901);
INSERT INTO DiaFuncionario VALUES (4, 258901);
INSERT INTO DiaFuncionario VALUES (5, 258901);
INSERT INTO DiaFuncionario VALUES (6, 258902);
INSERT INTO DiaFuncionario VALUES (7, 258902);

	
-- Table: DiaMédico
CREATE TABLE DiaMedico (Dia REFERENCES DiaTrabalho (Dia), Medico REFERENCES Medico (NIF), PRIMARY KEY (Dia, Medico));

-- Table: DiaTrabalho
CREATE TABLE DiaTrabalho (HoraInicio TIME, Duração INTEGER, HoraFim TIME CHECK (HoraInicio < HoraFim), Dia DATE, Ident INTEGER PRIMARY KEY);

INSERT INTO DiaTrabalho VALUES(08.00, 4, 12.00, '2017-05-19', 0);
INSERT INTO DiaTrabalho VALUES(08.00, 5, 13.00, '2017-05-20', 1);
INSERT INTO DiaTrabalho VALUES(08.30, 4, 12.30, '2017-05-21', 2);
INSERT INTO DiaTrabalho VALUES(12.30, 6, 18.30, '2017-05-19', 3);
INSERT INTO DiaTrabalho VALUES(13.30, 7, 20.30, '2017-05-20', 4);
INSERT INTO DiaTrabalho VALUES(13.00, 8, 21.00, '2017-05-21', 5);
INSERT INTO DiaTrabalho VALUES(08.00, 12, 20.00, '2017-05-21', 6);
INSERT INTO DiaTrabalho VALUES(10.00, 8, 18.00, '2017-05-21', 7);

-- Table: DiaTécnico
CREATE TABLE DiaTécnico (DiaTrabalho REFERENCES DiaTrabalho (Dia), Técnico REFERENCES Técnico (NIF), PRIMARY KEY (DiaTrabalho, Técnico));

-- Table: Enfermeiro
CREATE TABLE Enfermeiro (Nome TEXT, Idade INTEGER, DataNascimento DATE, NIF INTEGER PRIMARY KEY, Telemóvel INTEGER, Departamento REFERENCES Departamento (Designação));

-- Table: Especialidde
CREATE TABLE Especialidade (Sigla TEXT PRIMARY KEY,Designação TEXT , MedicoChefe REFERENCES Medico (NIF));

INSERT INTO Especialidade VALUES('CARD', 'CARDIOLOGIA', 258912);
INSERT INTO Especialidade VALUES('OFTA', 'OFTALMOLOGIA', 258910);

-- Table: Exame
CREATE TABLE Exame (ExameIdent INTEGER PRIMARY KEY, Dia INTEGER, HoraInicio TIME, HoraFim TIME CHECK (HoraInicio < HoraFim), Resultado STRING, Consulta REFERENCES Consulta (ConsultaIdent), Exame REFERENCES TipoExame);

INSERT INTO Exame VALUES (0, 2, 1220, 1630, 'Mau', 1, 'teste1');
INSERT INTO Exame VALUES (1, 2, 1220, 1630, 'Mau', 1, 'teste1');
INSERT INTO Exame VALUES (2, 2, 1220, 1630, 'Mau', 2, 'teste2');
INSERT INTO Exame VALUES (3, 2, 1220, 1630, 'Mau', 2, 'teste2');
INSERT INTO Exame VALUES (4, 2, 1220, 1630, 'Mau', 2, 'teste2');

-- Table: Funcionário
CREATE TABLE Funcionario (Nome TEXT, Idade INTEGER, DataNascimento DATE, NIF INTEGER PRIMARY KEY, Telemóvel INTEGER);

INSERT INTO Funcionario	VALUES ('Francisco Carneiro', 27, 1990, 258900, 919028750);
INSERT INTO Funcionario	VALUES ('Maria Coelho', 32, 1985, 258901, 919028751);
INSERT INTO Funcionario	VALUES ('Alvaro Caetano', 29, 1988, 258902, 919028752);

-- Table: Limpeza
CREATE TABLE Limpeza (Funcionario REFERENCES Funcionario (NIF), SalaExame REFERENCES SalaExame (ID), PRIMARY KEY (Funcionario, SalaExame));

-- Table: Médico
CREATE TABLE Medico (Nome TEXT, Idade INTEGER, DataNascimento DATE, NIF INTEGER PRIMARY KEY, Telemóvel INTEGER, Especialidade REFERENCES Especialidade (Sigla));

INSERT INTO Medico VALUES ('Orlando Mendes', '40', 1970, 258909, 919028760, 'CARD');
INSERT INTO Medico VALUES ('Miguel Vaz', '41', 1960, 258910, 919028799, 'OFTA');
INSERT INTO Medico VALUES ('Rita Malaco', '32', 1980, 258911, 919028800, 'OFTA');
INSERT INTO Medico VALUES ('Joana Carvalho', '52', 1980, 258912, 919028800, 'CARD');
INSERT INTO Medico VALUES ('Bernardo Martins', '52', 1980, 258913, 919028800, 'CARD');

-- Table: Paciente
CREATE TABLE Paciente (Nome TEXT, Idade INTEGER, DataNascimento DATE, NIF INTEGER PRIMARY KEY, Telemóvel INTEGER, SeguroIdent REFERENCES Seguro (SeguroIdent));

INSERT INTO Paciente VALUES ('Bernardo Martins', '21', 1996, 258908, 919028762, 100001);
INSERT INTO Paciente VALUES ('Susana Melo', '30', 1981, 258907, 919028300, 100002);
INSERT INTO Paciente VALUES ('Joana Carvalho', '30', 1981, 258906, 919028300, 100003);

-- Table: SalaExame
CREATE TABLE SalaExame (ID INTEGER PRIMARY KEY, HoraLimpeza INT);

-- Table: SalaTipo
CREATE TABLE SalaTipo (TipoExame REFERENCES TipoExame (Designaçao), SalaExame REFERENCES SalaExame (ID), PRIMARY KEY (TipoExame, SalaExame));

-- Table: Seguro
CREATE TABLE Seguro (SeguroIdent INTEGER PRIMARY KEY, Seguradora TEXT, DataValidade DATE CHECK (DataValidade > 2017), Tipo TEXT, Cobertura INTEGER);

INSERT INTO Seguro VALUES (100001, 'ADSE', 2020, 'COMPLETO', 250);

-- Table: TipoExame
CREATE TABLE TipoExame (Designaçao TEXT PRIMARY KEY);

INSERT INTO TipoExame VALUES ('teste');

-- Table: Técnico
CREATE TABLE Técnico (Nome TEXT, Idade INTEGER, DataNascimento DATE, NIF INTEGER PRIMARY KEY, Telemóvel INTEGER);

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
