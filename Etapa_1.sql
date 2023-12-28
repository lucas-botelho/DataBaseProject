create database tfc

use TFC

CREATE TABLE Curso (
    id bigint(20) NOT NULL,
    nome varchar(255) NOT NULL
);


CREATE TABLE Tecnologia (
    id bigint(20) NOT NULL,
    nome varchar(255) NOT NULL
);

CREATE TABLE Disciplina (
    id bigint(20) NOT NULL,
    cursoAssociado bigint(20) NOT NULL,
    nome varchar(255) NOT NULL
);

CREATE TABLE TFCCurso (
    id bigint(20) NOT NULL,
    idCurso bigint(20) NOT NULL,
    idTFC bigint(20) NOT NULL
);

CREATE TABLE TFCTecnologia (
    id bigint(20) NOT NULL,
    idTFC bigint(20) NOT NULL,
    idTecnologia bigint(20) NOT NULL
);

CREATE TABLE TFCDisciplina (
    id bigint(20) NOT NULL,
    idNumeroDisciplina bigint(20) NOT NULL,
    numeroTFC bigint(20) NOT NULL
);

CREATE TABLE AvaliacaoDisciplinaAluno (
    id bigint(20) NOT NULL,
    idNumeroAluno bigint(20) NOT NULL,
    idNumeroDisciplina bigint(20) NOT NULL,
    nota int NOT NULL
);

CREATE TABLE Aluno (
    id bigint(20) NOT NULL,
    curso varchar(255),
    email varchar(255),
    nome varchar(255) NOT NULL,
    numeroAluno varchar(255) NOT NULL,
    numeroContato int
);

CREATE TABLE Grupo (
    id bigint(20) NOT NULL,
    confirmaAluno1 tinyint(1) NOT NULL,
    confirmaAluno2 tinyint(1),
    idNumeroAluno1 varchar(255) NOT NULL,
    idNumeroAluno2 varchar(255)
);

CREATE TABLE HistoricoTFC (
    id bigint(20) NOT NULL,
    avaliacao varchar(255),
    dataMudancaEstado varchar(255),
    estado varchar(255) NOT NULL,
    idTFC varchar(255) NOT NULL,
    idTFCNumerico bigint(20) NOT NULL,
    utilizador varchar(255) NOT NULL
);

CREATE TABLE Inscricao (
    id bigint(20) NOT NULL,
    estado varchar(255),
    idNumeroGrupo bigint(20),
    idTFC varchar(255) NOT NULL,
    numeroAluno varchar(255),
    ordemEscolha int,
    registoDeInscricao datetime,
    publicado tinyint(1),
    anoLetivo varchar(255)
);

CREATE TABLE ProfessorNDEISI (
    id bigint(20) NOT NULL,
    desparamentoAfeto varchar(255) NOT NULL,
    email varchar(255) NOT NULL,
    idProfessor varchar(255),
    nome varchar(255) NOT NULL,
    numeroContato int NOT NULL
);

CREATE TABLE Empresa_EntidadeExterna (
    id bigint(20) NOT NULL,
    email varchar(255),
    idEmpresa varchar(255),
    interlocutor varchar(255),
    morada varchar(255),
    nome varchar(255) NOT NULL,
    numeroContato int
);

CREATE TABLE ProfessorDEISI (
    id bigint(20) NOT NULL,
    email varchar(255),
    nome varchar(255) NOT NULL,
    numeroContato int,
    numeroProfessor varchar(255) NOT NULL
);

CREATE TABLE Utilizador (
    id bigint(20) NOT NULL,
    coordenador tinyint(1),
    idIdentificacao varchar(255),
    tipoUtilizador varchar(255)
);

CREATE TABLE TFC (
    id bigint(20) NOT NULL,
    titulo varchar(255) NOT NULL,
    anoletivo varchar(255),
    avaliacaoProposta varchar(255),
    coorientador varchar(255),
    dataEstado varchar(255),
    dataProposta varchar(255),
    descricao text,
    entidade bigint(20),
    estado varchar(255),
    idGrupo bigint(20),
    idtfc varchar(255),
    motivoRecusa varchar(255),
    numeroInscricoes int,
    orientador varchar(255),
    orientadorProposto varchar(255),
    preponente varchar(255),
    semestre int,
    tecnologias varchar(255)
);


LOAD DATA INFILE 'E:/Lusofona/Semestre 3/Bases de Dados/Projeto Final/[EI-IG-23.BD]dados/Aluno.csv'
INTO TABLE Aluno
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

LOAD DATA INFILE 'E:/Lusofona/Semestre 3/Bases de Dados/Projeto Final/[EI-IG-23.BD]dados/AvaliacaoDisciplinaAluno.csv'
INTO TABLE AvaliacaoDisciplinaAluno
IGNORE 1 LINES;

LOAD DATA INFILE 'E:/Lusofona/Semestre 3/Bases de Dados/Projeto Final/[EI-IG-23.BD]dados/Curso.csv'
INTO TABLE Curso
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

LOAD DATA INFILE 'E:/Lusofona/Semestre 3/Bases de Dados/Projeto Final/[EI-IG-23.BD]dados/Disciplina.csv'
INTO TABLE Disciplina
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

LOAD DATA INFILE 'E:/Lusofona/Semestre 3/Bases de Dados/Projeto Final/[EI-IG-23.BD]dados/Empresa_EntidadeExterna.csv'
INTO TABLE Empresa_EntidadeExterna
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

LOAD DATA INFILE 'E:/Lusofona/Semestre 3/Bases de Dados/Projeto Final/[EI-IG-23.BD]dados/Grupo.csv'
INTO TABLE Grupo
FIELDS TERMINATED BY ';' 
LINES TERMINATED BY '\n'
IGNORE 1 lines

LOAD DATA INFILE 'E:/Lusofona/Semestre 3/Bases de Dados/Projeto Final/[EI-IG-23.BD]dados/HistoricoTFC.csv'
INTO TABLE HistoricoTFC
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 lines




LOAD DATA INFILE 'E:/Lusofona/Semestre 3/Bases de Dados/Projeto Final/[EI-IG-23.BD]dados/ProfessorDEISI.csv'
INTO TABLE ProfessorDEISI
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 lines

LOAD DATA INFILE 'E:/Lusofona/Semestre 3/Bases de Dados/Projeto Final/[EI-IG-23.BD]dados/ProfessorNDEISI.csv'
INTO TABLE ProfessorNDEISI
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 lines

LOAD DATA INFILE 'E:/Lusofona/Semestre 3/Bases de Dados/Projeto Final/[EI-IG-23.BD]dados/Tecnologia.csv'
INTO TABLE tecnologia 
FIELDS TERMINATED BY ';' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

LOAD DATA INFILE 'E:/Lusofona/Semestre 3/Bases de Dados/Projeto Final/[EI-IG-23.BD]dados/TFCCurso.csv'
INTO TABLE TFCCurso
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 lines


-- estes loads falham
LOAD DATA INFILE 'E:/Lusofona/Semestre 3/Bases de Dados/Projeto Final/[EI-IG-23.BD]dados/Inscricao.csv'
INTO TABLE Inscricao
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 lines

LOAD DATA INFILE 'E:/Lusofona/Semestre 3/Bases de Dados/Projeto Final/[EI-IG-23.BD]dados/TFC.csv'
INTO TABLE TFC
FIELDS TERMINATED BY ';' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 lines







