--Lucas Botelho a22201202
--Tiago Mota a22207337
--Marcos Gil a22102606
--Gonçalo Neves a22204044

create database tfc

use tfc

--Curso
CREATE TABLE Curso (
    id bigint NOT NULL,
    nome varchar(255) NOT NULL
);

CREATE INDEX index_Curso_id ON Curso(id);

SELECT COUNT(*) AS NomesComEspaco FROM Curso WHERE TRIM(nome) != nome; -- 0

insert into Curso (id, nome) values (999, '   [teste   ')
insert into Curso (id, nome) values (999, '   " teste] "teste]')
insert into Curso (id, nome) values (999, '" teste] "teste"')

SELECT COUNT(*) AS NumRowsInvalidas FROM Curso WHERE TRIM(BOTH ' ' FROM nome) != nome or  nome LIKE '"%' or nome LIKE '%"' or  nome LIKE '[%' or nome LIKE '%[' or  nome LIKE ']%' or nome LIKE '%]';
--tira espacos brancos
UPDATE Curso SET nome = LTRIM(RTRIM(nome));
--tira "
UPDATE Curso SET nome = SUBSTRING(nome, 2, LEN(nome)) WHERE LEFT(nome, 1) = '"';
UPDATE Curso SET nome = SUBSTRING(nome, 1, LEN(nome)-1) WHERE RIGHT(nome, 1) = '"'

--Tira [
UPDATE Curso SET nome = SUBSTRING(nome, 2, LEN(nome)) WHERE LEFT(nome, 1) = '[';
UPDATE Curso SET nome = SUBSTRING(nome, 1, LEN(nome)-1) WHERE RIGHT(nome, 1) = '['

--Tira ]
UPDATE Curso SET nome = SUBSTRING(nome, 2, LEN(nome)) WHERE LEFT(nome, 1) = ']';
UPDATE Curso SET nome = SUBSTRING(nome, 1, LEN(nome)-1) WHERE RIGHT(nome, 1) = ']'

delete from Curso where id = 999

--Tecnologia
CREATE TABLE Tecnologia (
    id bigint NOT NULL,
    nome varchar(255) --tem de ser NOT NULL
);

select * from Tecnologia
select count(*) from Tecnologia --152

DELETE FROM Tecnologia WHERE nome IS NULL;

select count(*) from Tecnologia --151

ALTER TABLE Tecnologia ALTER COLUMN nome VARCHAR(255) NOT NULL;

SELECT IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Tecnologia' AND COLUMN_NAME = 'nome';

CREATE INDEX indexTecnologia_id ON Tecnologia(id);
SELECT COUNT(*) AS NumRowsInvalidas FROM Tecnologia WHERE TRIM(BOTH ' ' FROM nome) != nome or  nome LIKE '"%' or nome LIKE '%"' or  nome LIKE '[%' or nome LIKE '%[' or  nome LIKE ']%' or nome LIKE '%]'; -- 2

--disciplina
CREATE TABLE Disciplina (
    id bigint NOT NULL,
    cursoAssociado bigint NOT NULL,
    nome varchar(255) NOT NULL
);

CREATE INDEX index_Disciplina_id ON Disciplina(id);
CREATE INDEX index_Disciplina_cursoAssociado ON Disciplina(cursoAssociado);
SELECT COUNT(*) AS NumRowsInvalidas FROM Disciplina WHERE TRIM(BOTH ' ' FROM nome) != nome or  nome LIKE '"%' or nome LIKE '%"' or  nome LIKE '[%' or nome LIKE '%[' or  nome LIKE ']%' or nome LIKE '%]'; -- 2

CREATE TABLE TFCCurso (
    id bigint NOT NULL,
    idCurso bigint NOT NULL,
    idTFC bigint NOT NULL
);

CREATE INDEX indexTFCCurso_id ON TFCCurso(id);
CREATE INDEX indexTFCCurso_idCurso ON TFCCurso(idCurso);
CREATE INDEX indexTFCCurso_idTFC ON TFCCurso(idTFC);


CREATE TABLE TFCTecnologia (
    id bigint NOT NULL,
    idTFC bigint NOT NULL,
    idTecnologia bigint NOT NULL
);

CREATE INDEX indexTFCTecnologia_id ON TFCTecnologia(id);
CREATE INDEX indexTFCTecnologia_idTFC ON TFCTecnologia(idTFC);
CREATE INDEX indexTFCTecnologia_idTecnologia ON TFCTecnologia(idTecnologia);

CREATE TABLE TFCDisciplina (
    id bigint NOT NULL,
    idNumeroDisciplina bigint NOT NULL,
    numeroTFC bigint NOT NULL
);

CREATE INDEX indexTFCDisciplina_id ON TFCDisciplina(id);
CREATE INDEX indexTFCDisciplina_idNumeroDisciplina ON TFCDisciplina(idNumeroDisciplina);
CREATE INDEX indexTFCDisciplina_numeroTFC ON TFCDisciplina(numeroTFC);


CREATE TABLE AvaliacaoDisciplinaAluno (
    id bigint NOT NULL,
    idNumeroAluno bigint NOT NULL,
    idNumeroDisciplina bigint NOT NULL,
    nota int NOT NULL
);

CREATE INDEX index_AvaliacaoDisciplinaAluno_id ON AvaliacaoDisciplinaAluno(id);
CREATE INDEX index_AvaliacaoDisciplinaAluno_idNumeroAluno ON AvaliacaoDisciplinaAluno(idNumeroAluno);
CREATE INDEX index_AvaliacaoDisciplinaAluno_idNumeroDisciplina ON AvaliacaoDisciplinaAluno(idNumeroDisciplina);



CREATE TABLE Aluno (
    id bigint NOT NULL,
    curso varchar(255),
    email varchar(255),
    nome varchar(255) NOT NULL,
    numeroAluno varchar(255) NOT NULL,
    numeroContato int
);

CREATE INDEX index_Aluno_id ON Aluno(id);

SELECT COUNT(*) AS NumRowsInvalidas FROM Aluno WHERE TRIM(BOTH ' ' FROM nome) != nome or  nome LIKE '"%' or nome LIKE '%"' or  nome LIKE '[%' or nome LIKE '%[' or  nome LIKE ']%' or nome LIKE '%]'; 
SELECT COUNT(*) AS NumRowsInvalidas FROM Aluno WHERE TRIM(BOTH ' ' FROM curso) != curso or  curso LIKE '"%' or curso LIKE '%"' or  curso LIKE '[%' or curso LIKE '%[' or  curso LIKE ']%' or curso LIKE '%]'; 
SELECT COUNT(*) AS NumRowsInvalidas FROM Aluno WHERE TRIM(BOTH ' ' FROM email) != email or  email LIKE '"%' or email LIKE '%"' or  email LIKE '[%' or email LIKE '%[' or  email LIKE ']%' or email LIKE '%]'; 
SELECT COUNT(*) AS NumRowsInvalidas FROM Aluno WHERE TRIM(BOTH ' ' FROM numeroAluno) != numeroAluno or  numeroAluno LIKE '"%' or numeroAluno LIKE '%"' or  numeroAluno LIKE '[%' or numeroAluno LIKE '%[' or  numeroAluno LIKE ']%' or numeroAluno LIKE '%]'; 

CREATE TABLE Grupo (
    id bigint NOT NULL,
    confirmaAluno1 tinyint NOT NULL,
    confirmaAluno2 tinyint,
    idNumeroAluno1 varchar(255) NOT NULL,
    idNumeroAluno2 varchar(255)
);

CREATE INDEX index_Grupo_id ON Grupo(id);

SELECT COUNT(*) AS NumRowsInvalidas FROM Grupo WHERE TRIM(BOTH ' ' FROM idNumeroAluno1) != idNumeroAluno1 or  idNumeroAluno1 LIKE '"%' or idNumeroAluno1 LIKE '%"' or  idNumeroAluno1 LIKE '[%' or idNumeroAluno1 LIKE '%[' or  idNumeroAluno1 LIKE ']%' or idNumeroAluno1 LIKE '%]'; 
SELECT COUNT(*) AS NumRowsInvalidas FROM Grupo WHERE TRIM(BOTH ' ' FROM idNumeroAluno2) != idNumeroAluno2 or  idNumeroAluno2 LIKE '"%' or idNumeroAluno2 LIKE '%"' or  idNumeroAluno2 LIKE '[%' or idNumeroAluno2 LIKE '%[' or  idNumeroAluno2 LIKE ']%' or idNumeroAluno2 LIKE '%]'; 


CREATE TABLE HistoricoTFC (
    id bigint NOT NULL,
    avaliacao varchar(255),
    dataMudancaEstado varchar(255),
    estado varchar(255) NOT NULL,
    idTFC varchar(255) NOT NULL,
    idTFCNumerico bigint NOT NULL,
    utilizador varchar(255) NOT NULL
);

CREATE INDEX index_HistoricoTFC_id ON HistoricoTFC(id);

SELECT COUNT(*) AS NumRowsInvalidasAvaliacao
FROM HistoricoTFC
WHERE TRIM(BOTH ' ' FROM avaliacao) != avaliacao OR
      avaliacao LIKE '"%' OR 
      avaliacao LIKE '%"' OR 
      avaliacao LIKE '[%' OR 
      avaliacao LIKE '%[' OR 
      avaliacao LIKE ']%' OR 
      avaliacao LIKE '%]';

SELECT COUNT(*) AS NumRowsInvalidasDataMudancaEstado
FROM HistoricoTFC
WHERE TRIM(BOTH ' ' FROM dataMudancaEstado) != dataMudancaEstado OR
      dataMudancaEstado LIKE '"%' OR 
      dataMudancaEstado LIKE '%"' OR 
      dataMudancaEstado LIKE '[%' OR 
      dataMudancaEstado LIKE '%[' OR 
      dataMudancaEstado LIKE ']%' OR 
      dataMudancaEstado LIKE '%]';

SELECT COUNT(*) AS NumRowsInvalidasEstado
FROM HistoricoTFC
WHERE TRIM(BOTH ' ' FROM estado) != estado OR
      estado LIKE '"%' OR 
      estado LIKE '%"' OR 
      estado LIKE '[%' OR 
      estado LIKE '%[' OR 
      estado LIKE ']%' OR 
      estado LIKE '%]';

SELECT COUNT(*) AS NumRowsInvalidasIdTFC
FROM HistoricoTFC
WHERE TRIM(BOTH ' ' FROM idTFC) != idTFC OR
      idTFC LIKE '"%' OR 
      idTFC LIKE '%"' OR 
      idTFC LIKE '[%' OR 
      idTFC LIKE '%[' OR 
      idTFC LIKE ']%' OR 
      idTFC LIKE '%]';

SELECT COUNT(*) AS NumRowsInvalidasUtilizador
FROM HistoricoTFC
WHERE TRIM(BOTH ' ' FROM utilizador) != utilizador OR
      utilizador LIKE '"%' OR 
      utilizador LIKE '%"' OR 
      utilizador LIKE '[%' OR 
      utilizador LIKE '%[' OR 
      utilizador LIKE ']%' OR 
      utilizador LIKE '%]';

SELECT COUNT(*) AS NumRowsInvalidasUtilizador
FROM HistoricoTFC
WHERE TRIM(BOTH ' ' FROM utilizador) != utilizador OR
      utilizador LIKE '"%' OR 
      utilizador LIKE '%"' OR 
      utilizador LIKE '[%' OR 
      utilizador LIKE '%[' OR 
      utilizador LIKE ']%' OR 
      utilizador LIKE '%]';

CREATE TABLE Inscricao (
    id bigint NOT NULL,
    estado varchar(255),
    idNumeroGrupo bigint NOT NULL,
    idTFC varchar(255) NOT NULL,
    numeroAluno varchar(255),
    ordemEscolha int,
    registoDeInscricao datetime,
    publicado tinyint,
    anoLetivo varchar(255)
);

CREATE INDEX indexInscricao_id ON Inscricao(id);
CREATE INDEX indexInscricao_idNumeroGrupo ON Inscricao(idNumeroGrupo);

SELECT 
  COUNT(*) AS NumRowsInvalidasEstado
FROM Inscricao
WHERE 
  TRIM(BOTH ' ' FROM estado) != estado OR
  estado LIKE '"%' OR 
  estado LIKE '%"' OR 
  estado LIKE '[%' OR 
  estado LIKE '%[' OR 
  estado LIKE ']%' OR 
  estado LIKE '%]';

SELECT 
  COUNT(*) AS NumRowsInvalidasIdTFC
FROM Inscricao
WHERE 
  TRIM(BOTH ' ' FROM idTFC) != idTFC OR
  idTFC LIKE '"%' OR 
  idTFC LIKE '%"' OR 
  idTFC LIKE '[%' OR 
  idTFC LIKE '%[' OR 
  idTFC LIKE ']%' OR 
  idTFC LIKE '%]';

SELECT 
  COUNT(*) AS NumRowsInvalidasNumeroAluno
FROM Inscricao
WHERE 
  TRIM(BOTH ' ' FROM numeroAluno) != numeroAluno OR
  numeroAluno LIKE '"%' OR 
  numeroAluno LIKE '%"' OR 
  numeroAluno LIKE '[%' OR 
  numeroAluno LIKE '%[' OR 
  numeroAluno LIKE ']%' OR 
  numeroAluno LIKE '%]';

SELECT 
  COUNT(*) AS NumRowsInvalidasAnoLetivo
FROM Inscricao
WHERE 
  TRIM(BOTH ' ' FROM anoLetivo) != anoLetivo OR
  anoLetivo LIKE '"%' OR 
  anoLetivo LIKE '%"' OR 
  anoLetivo LIKE '[%' OR 
  anoLetivo LIKE '%[' OR 
  anoLetivo LIKE ']%' OR 
  anoLetivo LIKE '%]';

SELECT count(estado) FROM Inscricao WHERE estado NOT IN ('Aguarda Atribuição', 'Atribuído', 'Não Atribuído', 'Atribuído', 'Anulado') OR estado IS NULL;
SELECT count(estado) FROM Inscricao 
SELECT distinct estado FROM Inscricao WHERE estado NOT IN ('Aguarda Atribuição', 'Atribuído', 'Não Atribuído', 'Atribuído', 'Anulado') OR estado IS NULL;
SELECT distinct estado FROM Inscricao

BEGIN TRANSACTION TransactionUpdateEstadoInscricao;
UPDATE Inscricao
SET estado = 'Aguarda Atribuição'
WHERE estado = 'A Aguardar Atribuição';

UPDATE Inscricao
SET estado = 'Atribuído'
WHERE estado = 'Atribuido';

UPDATE Inscricao
SET estado = 'Não Atribuído'
WHERE estado = 'Não Atribuido';

UPDATE Inscricao
SET estado = 'Anulado'
WHERE estado IS NULL;

SELECT distinct estado FROM Inscricao WHERE estado NOT IN ('Aguarda Atribuição', 'Atribuído', 'Não Atribuído', 'Atribuído', 'Anulado') OR estado IS NULL;
SELECT distinct estado FROM Inscricao

COMMIT TRANSACTION TransactionUpdateEstadoInscricao;
--ROLLBACK TRANSACTION TransactionUpdateEstadoInscricao;



CREATE TABLE ProfessorNDEISI (
    id bigint NOT NULL,
    departamentoAfeto varchar(255) NOT NULL,
    email varchar(255) NOT NULL,
    idProfessor varchar(255),
    nome varchar(255) NOT NULL,
    numeroContato int NOT NULL
);

CREATE INDEX indexProfessoresNDEISI_id ON ProfessorNDEISI(id);

SELECT 
  COUNT(*) AS NumRowsInvalidasDesparamentoAfeto
FROM ProfessorNDEISI
WHERE 
  TRIM(BOTH ' ' FROM departamentoAfeto) != departamentoAfeto OR
  departamentoAfeto LIKE '"%' OR 
  departamentoAfeto LIKE '%"' OR 
  departamentoAfeto LIKE '[%' OR 
  departamentoAfeto LIKE '%[' OR 
  departamentoAfeto LIKE ']%' OR 
  departamentoAfeto LIKE '%]';

-- For email
SELECT 
  COUNT(*) AS NumRowsInvalidasEmail
FROM ProfessorNDEISI
WHERE 
  TRIM(BOTH ' ' FROM email) != email OR
  email LIKE '"%' OR 
  email LIKE '%"' OR 
  email LIKE '[%' OR 
  email LIKE '%[' OR 
  email LIKE ']%' OR 
  email LIKE '%]';

-- For idProfessor
SELECT 
  COUNT(*) AS NumRowsInvalidasIdProfessor
FROM ProfessorNDEISI
WHERE 
  TRIM(BOTH ' ' FROM idProfessor) != idProfessor OR
  idProfessor LIKE '"%' OR 
  idProfessor LIKE '%"' OR 
  idProfessor LIKE '[%' OR 
  idProfessor LIKE '%[' OR 
  idProfessor LIKE ']%' OR 
  idProfessor LIKE '%]';

-- For nome
SELECT 
  COUNT(*) AS NumRowsInvalidasNome
FROM ProfessorNDEISI
WHERE 
  TRIM(BOTH ' ' FROM nome) != nome OR
  nome LIKE '"%' OR 
  nome LIKE '%"' OR 
  nome LIKE '[%' OR 
  nome LIKE '%[' OR 
  nome LIKE ']%' OR 
  nome LIKE '%]';


CREATE TABLE Empresa_EntidadeExterna (
    id bigint NOT NULL,
    email varchar(255),
    idEmpresa varchar(255),
    interlocutor varchar(255),
    morada varchar(255),
    nome varchar(255), --tem de ser NOT NULL
    numeroContato int
);
select * from Empresa_EntidadeExterna
select count(*) from Empresa_EntidadeExterna --96
select count(*) from Empresa_EntidadeExterna where nome is null --1

DELETE FROM Empresa_EntidadeExterna WHERE nome IS NULL;

select count(*) from Empresa_EntidadeExterna where nome is null --0

ALTER TABLE Empresa_EntidadeExterna ALTER COLUMN nome VARCHAR(255) NOT NULL;

SELECT IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Empresa_EntidadeExterna' AND COLUMN_NAME = 'nome';

CREATE INDEX index_Empresa_EntidadeExterna_id ON Empresa_EntidadeExterna(id);

-- For email
SELECT 
  COUNT(*) AS NumRowsInvalidasEmail
FROM Empresa_EntidadeExterna
WHERE 
  TRIM(BOTH ' ' FROM email) != email OR
  email LIKE '"%' OR 
  email LIKE '%"' OR 
  email LIKE '[%' OR 
  email LIKE '%[' OR 
  email LIKE ']%' OR 
  email LIKE '%]';

-- For idEmpresa
SELECT 
  COUNT(*) AS NumRowsInvalidasIdEmpresa
FROM Empresa_EntidadeExterna
WHERE 
  TRIM(BOTH ' ' FROM idEmpresa) != idEmpresa OR
  idEmpresa LIKE '"%' OR 
  idEmpresa LIKE '%"' OR 
  idEmpresa LIKE '[%' OR 
  idEmpresa LIKE '%[' OR 
  idEmpresa LIKE ']%' OR 
  idEmpresa LIKE '%]';

-- For interlocutor
SELECT 
  COUNT(*) AS NumRowsInvalidasInterlocutor
FROM Empresa_EntidadeExterna
WHERE 
  TRIM(BOTH ' ' FROM interlocutor) != interlocutor OR
  interlocutor LIKE '"%' OR 
  interlocutor LIKE '%"' OR 
  interlocutor LIKE '[%' OR 
  interlocutor LIKE '%[' OR 
  interlocutor LIKE ']%' OR 
  interlocutor LIKE '%]';

-- For morada
SELECT 
  COUNT(*) AS NumRowsInvalidasMorada
FROM Empresa_EntidadeExterna
WHERE 
  TRIM(BOTH ' ' FROM morada) != morada OR
  morada LIKE '"%' OR 
  morada LIKE '%"' OR 
  morada LIKE '[%' OR 
  morada LIKE '%[' OR 
  morada LIKE ']%' OR 
  morada LIKE '%]';

-- For nome
SELECT 
  COUNT(*) AS NumRowsInvalidasNome
FROM Empresa_EntidadeExterna
WHERE 
  TRIM(BOTH ' ' FROM nome) != nome OR
  nome LIKE '"%' OR 
  nome LIKE '%"' OR 
  nome LIKE '[%' OR 
  nome LIKE '%[' OR 
  nome LIKE ']%' OR 
  nome LIKE '%]';


CREATE TABLE ProfessorDEISI (
    id bigint NOT NULL,
    email varchar(255),
    nome varchar(255) NOT NULL,
    numeroContato int,
    numeroProfessor varchar(255) NOT NULL
);

CREATE INDEX indexProfessoresDEISI_id ON ProfessorDEISI(id);

-- For email
SELECT 
  COUNT(*) AS NumRowsInvalidasEmail
FROM ProfessorDEISI
WHERE 
  TRIM(BOTH ' ' FROM email) != email OR
  email LIKE '"%' OR 
  email LIKE '%"' OR 
  email LIKE '[%' OR 
  email LIKE '%[' OR 
  email LIKE ']%' OR 
  email LIKE '%]';

-- For nome
SELECT 
  COUNT(*) AS NumRowsInvalidasNome
FROM ProfessorDEISI
WHERE 
  TRIM(BOTH ' ' FROM nome) != nome OR
  nome LIKE '"%' OR 
  nome LIKE '%"' OR 
  nome LIKE '[%' OR 
  nome LIKE '%[' OR 
  nome LIKE ']%' OR 
  nome LIKE '%]';

-- For numeroProfessor
SELECT 
  COUNT(*) AS NumRowsInvalidasNumeroProfessor
FROM ProfessorDEISI
WHERE 
  TRIM(BOTH ' ' FROM numeroProfessor) != numeroProfessor OR
  numeroProfessor LIKE '"%' OR 
  numeroProfessor LIKE '%"' OR 
  numeroProfessor LIKE '[%' OR 
  numeroProfessor LIKE '%[' OR 
  numeroProfessor LIKE ']%' OR 
  numeroProfessor LIKE '%]';


CREATE TABLE Utilizador (
    id bigint NOT NULL,
    coordenador tinyint,
    idIdentificacao varchar(255),
    tipoUtilizador varchar(255)
);

CREATE INDEX indexUtilizador_id ON Utilizador(id);

-- For idIdentificacao
SELECT 
  COUNT(*) AS NumRowsInvalidasIdIdentificacao
FROM Utilizador
WHERE 
  TRIM(BOTH ' ' FROM idIdentificacao) != idIdentificacao OR
  idIdentificacao LIKE '"%' OR 
  idIdentificacao LIKE '%"' OR 
  idIdentificacao LIKE '[%' OR 
  idIdentificacao LIKE '%[' OR 
  idIdentificacao LIKE ']%' OR 
  idIdentificacao LIKE '%]';

-- For tipoUtilizador
SELECT 
  COUNT(*) AS NumRowsInvalidasTipoUtilizador
FROM Utilizador
WHERE 
  TRIM(BOTH ' ' FROM tipoUtilizador) != tipoUtilizador OR
  tipoUtilizador LIKE '"%' OR 
  tipoUtilizador LIKE '%"' OR 
  tipoUtilizador LIKE '[%' OR 
  tipoUtilizador LIKE '%[' OR 
  tipoUtilizador LIKE ']%' OR 
  tipoUtilizador LIKE '%]';


CREATE TABLE TFC (
    id bigint NOT NULL,
    titulo varchar(255),
    anoletivo varchar(255),
    avaliacaoProposta varchar(255),
    coorientador varchar(255),
    dataEstado varchar(255),
    dataProposta varchar(255),
    descricao text,
    entidade bigint ,
    estado varchar(255),
    idGrupo bigint,
    idtfc varchar(255),
    motivoRecusa varchar(255),
    numeroInscricoes int,
    orientador varchar(255),
    orientadorProposto varchar(255),
    preponente varchar(255),
    semestre int,
    tecnologias varchar(255)
);

CREATE INDEX indexTFC_id ON TFC(id);
CREATE INDEX indexTFC_idGrupo ON TFC(idGrupo);
CREATE INDEX indexTFC_idtfc ON TFC(idtfc);


-- For titulo
SELECT 
  COUNT(*) AS NumRowsInvalidasTitulo
FROM TFC
WHERE 
  TRIM(BOTH ' ' FROM titulo) != titulo OR
  titulo LIKE '"%' OR 
  titulo LIKE '%"' OR 
  titulo LIKE '[%' OR 
  titulo LIKE '%[' OR 
  titulo LIKE ']%' OR 
  titulo LIKE '%]';

-- For anoletivo
SELECT 
  COUNT(*) AS NumRowsInvalidasAnoLetivo
FROM TFC
WHERE 
  TRIM(BOTH ' ' FROM anoletivo) != anoletivo OR
  anoletivo LIKE '"%' OR 
  anoletivo LIKE '%"' OR 
  anoletivo LIKE '[%' OR 
  anoletivo LIKE '%[' OR 
  anoletivo LIKE ']%' OR 
  anoletivo LIKE '%]';

-- For avaliacaoProposta
SELECT 
  COUNT(*) AS NumRowsInvalidasAvaliacaoProposta
FROM TFC
WHERE 
  TRIM(BOTH ' ' FROM avaliacaoProposta) != avaliacaoProposta OR
  avaliacaoProposta LIKE '"%' OR 
  avaliacaoProposta LIKE '%"' OR 
  avaliacaoProposta LIKE '[%' OR 
  avaliacaoProposta LIKE '%[' OR 
  avaliacaoProposta LIKE ']%' OR 
  avaliacaoProposta LIKE '%]';

-- For coorientador
SELECT 
  COUNT(*) AS NumRowsInvalidasCoorientador
FROM TFC
WHERE 
  TRIM(BOTH ' ' FROM coorientador) != coorientador OR
  coorientador LIKE '"%' OR 
  coorientador LIKE '%"' OR 
  coorientador LIKE '[%' OR 
  coorientador LIKE '%[' OR 
  coorientador LIKE ']%' OR 
  coorientador LIKE '%]';

-- For dataEstado
SELECT 
  COUNT(*) AS NumRowsInvalidasDataEstado
FROM TFC
WHERE 
  TRIM(BOTH ' ' FROM dataEstado) != dataEstado OR
  dataEstado LIKE '"%' OR 
  dataEstado LIKE '%"' OR 
  dataEstado LIKE '[%' OR 
  dataEstado LIKE '%[' OR 
  dataEstado LIKE ']%' OR 
  dataEstado LIKE '%]';

-- For dataProposta
SELECT 
  COUNT(*) AS NumRowsInvalidasDataProposta
FROM TFC
WHERE 
  TRIM(BOTH ' ' FROM dataProposta) != dataProposta OR
  dataProposta LIKE '"%' OR 
  dataProposta LIKE '%"' OR 
  dataProposta LIKE '[%' OR 
  dataProposta LIKE '%[' OR 
  dataProposta LIKE ']%' OR 
  dataProposta LIKE '%]';

-- For estado
SELECT 
  COUNT(*) AS NumRowsInvalidasEstado
FROM TFC
WHERE 
  TRIM(BOTH ' ' FROM estado) != estado OR
  estado LIKE '"%' OR 
  estado LIKE '%"' OR 
  estado LIKE '[%' OR 
  estado LIKE '%[' OR 
  estado LIKE ']%' OR 
  estado LIKE '%]';

-- For idtfc
SELECT 
  COUNT(*) AS NumRowsInvalidasIdTFC
FROM TFC
WHERE 
  TRIM(BOTH ' ' FROM idtfc) != idtfc OR
  idtfc LIKE '"%' OR 
  idtfc LIKE '%"' OR 
  idtfc LIKE '[%' OR 
  idtfc LIKE '%[' OR 
  idtfc LIKE ']%' OR 
  idtfc LIKE '%]';

-- For motivoRecusa
SELECT 
  COUNT(*) AS NumRowsInvalidasMotivoRecusa
FROM TFC
WHERE 
  TRIM(BOTH ' ' FROM motivoRecusa) != motivoRecusa OR
  motivoRecusa LIKE '"%' OR 
  motivoRecusa LIKE '%"' OR 
  motivoRecusa LIKE '[%' OR 
  motivoRecusa LIKE '%[' OR 
  motivoRecusa LIKE ']%' OR 
  motivoRecusa LIKE '%]';

-- For orientador
SELECT 
  COUNT(*) AS NumRowsInvalidasOrientador
FROM TFC
WHERE 
  TRIM(BOTH ' ' FROM orientador) != orientador OR
  orientador LIKE '"%' OR 
  orientador LIKE '%"' OR 
  orientador LIKE '[%' OR 
  orientador LIKE '%[' OR 
  orientador LIKE ']%' OR 
  orientador LIKE '%]';

-- For orientadorProposto
SELECT 
  COUNT(*) AS NumRowsInvalidasOrientadorProposto
FROM TFC
WHERE 
  TRIM(BOTH ' ' FROM orientadorProposto) != orientadorProposto OR
  orientadorProposto LIKE '"%' OR 
  orientadorProposto LIKE '%"' OR 
  orientadorProposto LIKE '[%' OR 
  orientadorProposto LIKE '%[' OR 
  orientadorProposto LIKE ']%' OR 
  orientadorProposto LIKE '%]';

-- For preponente
SELECT 
  COUNT(*) AS NumRowsInvalidasPreponente
FROM TFC
WHERE 
  TRIM(BOTH ' ' FROM preponente) != preponente OR
  preponente LIKE '"%' OR 
  preponente LIKE '%"' OR 
  preponente LIKE '[%' OR 
  preponente LIKE '%[' OR 
  preponente LIKE ']%' OR 
  preponente LIKE '%]';

-- For tecnologias
SELECT 
  COUNT(*) AS NumRowsInvalidasTecnologias
FROM TFC
WHERE 
  TRIM(BOTH ' ' FROM tecnologias) != tecnologias OR
  tecnologias LIKE '"%' OR 
  tecnologias LIKE '%"' OR 
  tecnologias LIKE '[%' OR 
  tecnologias LIKE '%[' OR 
  tecnologias LIKE ']%' OR 
  tecnologias LIKE '%]';
   
SELECT count(estado) FROM TFC WHERE estado NOT IN ('Aguarda Aprovação', 'Recusado', 'Aguarda Atribuição', 'Atribuído', 'Publicado', 'Indisponível', 'Anulado') OR estado IS NULL;
SELECT distinct estado FROM TFC WHERE estado NOT IN ('Aguarda Aprovação', 'Recusado', 'Aguarda Atribuição', 'Atribuído', 'Publicado', 'Indisponível', 'Anulado') OR estado IS NULL;

BEGIN TRANSACTION TransactionUpdateEstadoTFC;

UPDATE TFC
SET estado = 'Aguarda Aprovação'
WHERE estado = 'A Aguardar Aprovação';

UPDATE TFC
SET estado = 'Aguarda Atribuição'
WHERE TRIM(estado) = 'A Aguardar Atribuição';

UPDATE TFC
SET estado = 'Atribuído'
WHERE TRIM(estado) = 'Atribuido';

UPDATE TFC
SET estado = 'Não Atribuído'
WHERE TRIM(estado) = 'Nao Atribuido';

UPDATE TFC
SET estado = 'Indisponível'
WHERE TRIM(estado) = 'Indisponivel';

UPDATE TFC
SET estado = 'Anulado'
WHERE estado NOT IN ('Aguarda Aprovação', 'Recusado', 'Aguarda Atribuição', 'Atribuído', 'Publicado', 'Indisponível', 'Anulado') OR estado IS NULL;

SELECT count(estado) FROM TFC WHERE estado NOT IN ('Aguarda Aprovação', 'Recusado', 'Aguarda Atribuição', 'Atribuído', 'Publicado', 'Indisponível', 'Anulado') OR estado IS NULL;
SELECT estado FROM TFC WHERE estado NOT IN ('Aguarda Aprovação', 'Recusado', 'Aguarda Atribuição', 'Atribuído', 'Publicado', 'Indisponível', 'Anulado') OR estado IS NULL;
SELECT distinct estado FROM TFC 

COMMIT TRANSACTION TransactionUpdateEstadoTFC;
--ROLLBACK TRANSACTION TransactionUpdateEstadoTFC;

--contar duplicados
SELECT COUNT(idtfc) AS NumRepetidos FROM TFC GROUP BY idtfc HAVING COUNT(idtfc) > 1;
 -- Aluno
SELECT COUNT(numeroAluno) AS NumRepetidos FROM Aluno GROUP BY numeroAluno HAVING COUNT(numeroAluno) > 1;
--AvaliacaoDisciplinaAluno ainda nao tem dados
--Curso
SELECT COUNT(nome)  AS NumRepetidos FROM Curso GROUP BY nome HAVING COUNT(nome) > 1;
--Disciplina
SELECT COUNT(nome)  AS NumRepetidos FROM Disciplina GROUP BY nome HAVING COUNT(nome) > 1;
--Empresa_EntidadeExterna
SELECT COUNT(id) AS NumRepetidos FROM Empresa_EntidadeExterna GROUP BY id HAVING COUNT(id) > 1;
--Grupo
SELECT COUNT(id) AS NumRepetidos FROM Grupo GROUP BY id HAVING COUNT(id) > 1;
-- ProfessorDEISI
SELECT COUNT(numeroProfessor) AS NumRepetidos FROM ProfessorDEISI GROUP BY numeroProfessor HAVING COUNT(numeroProfessor) > 1;
SELECT numeroProfessor AS NumRepetidos FROM ProfessorDEISI GROUP BY numeroProfessor HAVING COUNT(numeroProfessor) > 1;

-- ProfessorNDEISI
SELECT COUNT(idProfessor) AS NumRepetidos FROM ProfessorNDEISI GROUP BY idProfessor HAVING COUNT(idProfessor) > 1;
-- Aluno em mais do que um grupo
SELECT COUNT(*) AS NumRepetidos FROM ( SELECT idNumeroAluno1 AS idNumeroAluno FROM Grupo UNION ALL SELECT idNumeroAluno2 AS idNumeroAluno FROM Grupo ) AS Alunos GROUP BY idNumeroAluno HAVING COUNT(*) > 1;
SELECT idNumeroAluno AS NumRepetidos FROM ( SELECT idNumeroAluno1 AS idNumeroAluno FROM Grupo UNION ALL SELECT idNumeroAluno2 AS idNumeroAluno FROM Grupo ) AS Alunos GROUP BY idNumeroAluno HAVING COUNT(*) > 1;
-- HistoricoTFC
SELECT COUNT(id) AS NumRepetidos FROM HistoricoTFC GROUP BY id HAVING COUNT(id) > 1;
-- Inscricao
SELECT COUNT(id) AS NumRepetidos FROM Inscricao GROUP BY id HAVING COUNT(id) > 1;
-- Tecnologia
SELECT COUNT(id) AS NumRepetidos FROM Tecnologia GROUP BY id HAVING COUNT(id) > 1;
-- TFC
SELECT COUNT(id) AS NumRepetidos FROM TFC GROUP BY id HAVING COUNT(id) > 1;
-- TFCCurso
SELECT COUNT(id) AS NumRepetidos FROM TFCCurso GROUP BY id HAVING COUNT(id) > 1;
-- TFCTecnologia
SELECT COUNT(id) AS NumRepetidos FROM TFCTecnologia GROUP BY id HAVING COUNT(id) > 1;
-- Utilizador
SELECT COUNT(id) AS NumRepetidos FROM Utilizador GROUP BY id HAVING COUNT(id) > 1;



