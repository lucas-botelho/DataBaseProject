--Lucas Botelho a22201202
--Tiago Mota a22207337
--Marcos Gil a22102606
--Gonçalo Neves a22204044

create database tfc

use tfc
--1 criar tabelas
--Curso
CREATE TABLE Curso (
    id bigint NOT NULL,
    nome varchar(255) NOT NULL
);

--Tecnologia
CREATE TABLE Tecnologia (
    id bigint NOT NULL,
    nome varchar(255) --tem de ser NOT NULL
);

select * from Tecnologia
select count(*) from Tecnologia --152
DELETE FROM Tecnologia WHERE nome IS NULL; --apagar os que vieram a null da importacao de dados
select count(*) from Tecnologia --151
ALTER TABLE Tecnologia ALTER COLUMN nome VARCHAR(255) NOT NULL; --meter nome a nao aceitar nulls tal como no modelo de dados
--validar se ficou com o campo a not null
SELECT IS_NULLABLE FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Tecnologia' AND COLUMN_NAME = 'nome';

--disciplina
CREATE TABLE Disciplina (
    id bigint NOT NULL,
    cursoAssociado bigint NOT NULL,
    nome varchar(255) NOT NULL
);

CREATE TABLE TFCCurso (
    id bigint NOT NULL,
    idCurso bigint NOT NULL,
    idTFC bigint NOT NULL
);


CREATE TABLE TFCTecnologia (
    id bigint NOT NULL,
    idTFC bigint NOT NULL,
    idTecnologia bigint NOT NULL
);

CREATE TABLE TFCDisciplina (
    id bigint NOT NULL,
    idNumeroDisciplina bigint NOT NULL,
    numeroTFC bigint NOT NULL
);

CREATE TABLE AvaliacaoDisciplinaAluno (
    id bigint NOT NULL,
    idNumeroAluno bigint NOT NULL,
    idNumeroDisciplina bigint NOT NULL,
    nota int NOT NULL
);

CREATE TABLE Aluno (
    id bigint NOT NULL,
    curso varchar(255),
    email varchar(255),
    nome varchar(255) NOT NULL,
    numeroAluno varchar(255) NOT NULL,
    numeroContato int
);

CREATE TABLE Grupo (
    id bigint NOT NULL,
    confirmaAluno1 tinyint NOT NULL,
    confirmaAluno2 tinyint,
    idNumeroAluno1 varchar(255) NOT NULL,
    idNumeroAluno2 varchar(255)
);

CREATE TABLE HistoricoTFC (
    id bigint NOT NULL,
    avaliacao varchar(255),
    dataMudancaEstado varchar(255),
    estado varchar(255) NOT NULL,
    idTFC varchar(255) NOT NULL,
    idTFCNumerico bigint NOT NULL,
    utilizador varchar(255) NOT NULL
);

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


CREATE TABLE ProfessorNDEISI (
    id bigint NOT NULL,
    departamentoAfeto varchar(255) NOT NULL,
    email varchar(255) NOT NULL,
    idProfessor varchar(255),
    nome varchar(255) NOT NULL,
    numeroContato int NOT NULL
);

CREATE TABLE Empresa_EntidadeExterna (
    id bigint NOT NULL,
    email varchar(255),
    idEmpresa varchar(255),
    interlocutor varchar(255),
    morada varchar(255),
    nome varchar(255), --tem de ser NOT NULL
    numeroContato int
);

--mesmo processo aplicado a table Tecnologia
select * from Empresa_EntidadeExterna
select count(*) from Empresa_EntidadeExterna --96
select count(*) from Empresa_EntidadeExterna where nome is null --1

DELETE FROM Empresa_EntidadeExterna WHERE nome IS NULL;

select count(*) from Empresa_EntidadeExterna where nome is null --0

ALTER TABLE Empresa_EntidadeExterna ALTER COLUMN nome VARCHAR(255) NOT NULL;

SELECT IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Empresa_EntidadeExterna' AND COLUMN_NAME = 'nome';

CREATE TABLE ProfessorDEISI (
    id bigint NOT NULL,
    email varchar(255),
    nome varchar(255) NOT NULL,
    numeroContato int,
    numeroProfessor varchar(255) NOT NULL
);

CREATE TABLE Utilizador (
    id bigint NOT NULL,
    coordenador tinyint,
    idIdentificacao varchar(255),
    tipoUtilizador varchar(255)
);


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

--3 criar indices
CREATE INDEX index_Curso_id ON Curso(id);
CREATE INDEX indexTecnologia_id ON Tecnologia(id);
CREATE INDEX index_Disciplina_id ON Disciplina(id);
CREATE INDEX index_Disciplina_cursoAssociado ON Disciplina(cursoAssociado);
CREATE INDEX indexTFCCurso_id ON TFCCurso(id);
CREATE INDEX indexTFCCurso_idCurso ON TFCCurso(idCurso);
CREATE INDEX indexTFCCurso_idTFC ON TFCCurso(idTFC);
CREATE INDEX indexTFCTecnologia_id ON TFCTecnologia(id);
CREATE INDEX indexTFCTecnologia_idTFC ON TFCTecnologia(idTFC);
CREATE INDEX indexTFCTecnologia_idTecnologia ON TFCTecnologia(idTecnologia);
CREATE INDEX indexTFCDisciplina_id ON TFCDisciplina(id);
CREATE INDEX indexTFCDisciplina_idNumeroDisciplina ON TFCDisciplina(idNumeroDisciplina);
CREATE INDEX indexTFCDisciplina_numeroTFC ON TFCDisciplina(numeroTFC);
CREATE INDEX index_AvaliacaoDisciplinaAluno_id ON AvaliacaoDisciplinaAluno(id);
CREATE INDEX index_AvaliacaoDisciplinaAluno_idNumeroAluno ON AvaliacaoDisciplinaAluno(idNumeroAluno);
CREATE INDEX index_AvaliacaoDisciplinaAluno_idNumeroDisciplina ON AvaliacaoDisciplinaAluno(idNumeroDisciplina);
CREATE INDEX index_Aluno_id ON Aluno(id);
CREATE INDEX index_Grupo_id ON Grupo(id);
CREATE INDEX index_HistoricoTFC_id ON HistoricoTFC(id);
CREATE INDEX indexInscricao_id ON Inscricao(id);
CREATE INDEX indexInscricao_idNumeroGrupo ON Inscricao(idNumeroGrupo);
CREATE INDEX indexProfessoresNDEISI_id ON ProfessorNDEISI(id);
CREATE INDEX index_Empresa_EntidadeExterna_id ON Empresa_EntidadeExterna(id);
CREATE INDEX indexProfessoresDEISI_id ON ProfessorDEISI(id);
CREATE INDEX indexUtilizador_id ON Utilizador(id);
CREATE INDEX indexTFC_id ON TFC(id);
CREATE INDEX indexTFC_idGrupo ON TFC(idGrupo);
CREATE INDEX indexTFC_idtfc ON TFC(idtfc);

--4.1/4.2 
SELECT COUNT(*) AS NomesComEspaco FROM Curso WHERE TRIM(nome) != nome; -- 0
--inserts para testes
insert into Curso (id, nome) values (999, '   [teste   ')
insert into Curso (id, nome) values (999, '   " teste] "teste]')
insert into Curso (id, nome) values (999, '" teste] "teste"')

SELECT COUNT(*) AS NumRowsInvalidas FROM Curso WHERE TRIM(BOTH ' ' FROM nome) != nome or  nome LIKE '"%' or nome LIKE '%"' or  nome LIKE '[%' or nome LIKE '%[' or  nome LIKE ']%' or nome LIKE '%]';
SELECT * FROM Curso WHERE TRIM(BOTH ' ' FROM nome) != nome or  nome LIKE '"%' or nome LIKE '%"' or  nome LIKE '[%' or nome LIKE '%[' or  nome LIKE ']%' or nome LIKE '%]';
SELECT * FROM Curso
UPDATE Curso SET nome = LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(nome, '"', ''), '[', ''), ']', '')));

--Curso
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

--apagar dados de testes
delete from Curso where id = 999

--Aluno
--tira espacos brancos
 UPDATE Aluno SET curso = LTRIM(RTRIM(curso));
--tira "
 UPDATE Aluno SET curso = SUBSTRING(curso, 2, LEN(curso)) WHERE LEFT(curso, 1) = '"';
 UPDATE Aluno SET curso = SUBSTRING(curso, 1, LEN(curso)-1) WHERE RIGHT(curso, 1) = '"'
--Tira [
 UPDATE Aluno SET curso = SUBSTRING(curso, 2, LEN(curso)) WHERE LEFT(curso, 1) = '[';
 UPDATE Aluno SET curso = SUBSTRING(curso, 1, LEN(curso)-1) WHERE RIGHT(curso, 1) = '['
--Tira ]
 UPDATE Aluno SET curso = SUBSTRING(curso, 2, LEN(curso)) WHERE LEFT(curso, 1) = ']';
 UPDATE Aluno SET curso = SUBSTRING(curso, 1, LEN(curso)-1) WHERE RIGHT(curso, 1) = ']'

--tira espacos brancos
 UPDATE Aluno SET email = LTRIM(RTRIM(email));
--tira "
 UPDATE Aluno SET email = SUBSTRING(email, 2, LEN(email)) WHERE LEFT(email, 1) = '"';
 UPDATE Aluno SET email = SUBSTRING(email, 1, LEN(email)-1) WHERE RIGHT(email, 1) = '"'
--Tira [
 UPDATE Aluno SET email = SUBSTRING(email, 2, LEN(email)) WHERE LEFT(email, 1) = '[';
 UPDATE Aluno SET email = SUBSTRING(email, 1, LEN(email)-1) WHERE RIGHT(email, 1) = '['
--Tira ]
 UPDATE Aluno SET email = SUBSTRING(email, 2, LEN(email)) WHERE LEFT(email, 1) = ']';
 UPDATE Aluno SET email = SUBSTRING(email, 1, LEN(email)-1) WHERE RIGHT(email, 1) = ']'

--tira espacos brancos
 UPDATE Aluno SET nome = LTRIM(RTRIM(nome));
--tira "
 UPDATE Aluno SET nome = SUBSTRING(nome, 2, LEN(nome)) WHERE LEFT(nome, 1) = '"';
 UPDATE Aluno SET nome = SUBSTRING(nome, 1, LEN(nome)-1) WHERE RIGHT(nome, 1) = '"'
--Tira [
 UPDATE Aluno SET nome = SUBSTRING(nome, 2, LEN(nome)) WHERE LEFT(nome, 1) = '[';
 UPDATE Aluno SET nome = SUBSTRING(nome, 1, LEN(nome)-1) WHERE RIGHT(nome, 1) = '['
--Tira ]
 UPDATE Aluno SET nome = SUBSTRING(nome, 2, LEN(nome)) WHERE LEFT(nome, 1) = ']';
 UPDATE Aluno SET nome = SUBSTRING(nome, 1, LEN(nome)-1) WHERE RIGHT(nome, 1) = ']'

--tira espacos brancos
 UPDATE Aluno SET numeroAluno = LTRIM(RTRIM(numeroAluno));
--tira "
 UPDATE Aluno SET numeroAluno = SUBSTRING(numeroAluno, 2, LEN(numeroAluno)) WHERE LEFT(numeroAluno, 1) = '"';
 UPDATE Aluno SET numeroAluno = SUBSTRING(numeroAluno, 1, LEN(numeroAluno)-1) WHERE RIGHT(numeroAluno, 1) = '"'
--Tira [
 UPDATE Aluno SET numeroAluno = SUBSTRING(numeroAluno, 2, LEN(numeroAluno)) WHERE LEFT(numeroAluno, 1) = '[';
 UPDATE Aluno SET numeroAluno = SUBSTRING(numeroAluno, 1, LEN(numeroAluno)-1) WHERE RIGHT(numeroAluno, 1) = '['
--Tira ]
 UPDATE Aluno SET numeroAluno = SUBSTRING(numeroAluno, 2, LEN(numeroAluno)) WHERE LEFT(numeroAluno, 1) = ']';
 UPDATE Aluno SET numeroAluno = SUBSTRING(numeroAluno, 1, LEN(numeroAluno)-1) WHERE RIGHT(numeroAluno, 1) = ']'

--Disciplina
--tira espacos brancos
 UPDATE Disciplina SET nome = LTRIM(RTRIM(nome));
--tira "
 UPDATE Disciplina SET nome = SUBSTRING(nome, 2, LEN(nome)) WHERE LEFT(nome, 1) = '"';
 UPDATE Disciplina SET nome = SUBSTRING(nome, 1, LEN(nome)-1) WHERE RIGHT(nome, 1) = '"'
--Tira [
 UPDATE Disciplina SET nome = SUBSTRING(nome, 2, LEN(nome)) WHERE LEFT(nome, 1) = '[';
 UPDATE Disciplina SET nome = SUBSTRING(nome, 1, LEN(nome)-1) WHERE RIGHT(nome, 1) = '['
--Tira ]
 UPDATE Disciplina SET nome = SUBSTRING(nome, 2, LEN(nome)) WHERE LEFT(nome, 1) = ']';
 UPDATE Disciplina SET nome = SUBSTRING(nome, 1, LEN(nome)-1) WHERE RIGHT(nome, 1) = ']'

--Empresa_EntidadeExterna

--tira espacos brancos
 UPDATE Empresa_EntidadeExterna SET email = LTRIM(RTRIM(email));
--tira "
 UPDATE Empresa_EntidadeExterna SET email = SUBSTRING(email, 2, LEN(email)) WHERE LEFT(email, 1) = '"';
 UPDATE Empresa_EntidadeExterna SET email = SUBSTRING(email, 1, LEN(email)-1) WHERE RIGHT(email, 1) = '"'
--Tira [
 UPDATE Empresa_EntidadeExterna SET email = SUBSTRING(email, 2, LEN(email)) WHERE LEFT(email, 1) = '[';
 UPDATE Empresa_EntidadeExterna SET email = SUBSTRING(email, 1, LEN(email)-1) WHERE RIGHT(email, 1) = '['
--Tira ]
 UPDATE Empresa_EntidadeExterna SET email = SUBSTRING(email, 2, LEN(email)) WHERE LEFT(email, 1) = ']';
 UPDATE Empresa_EntidadeExterna SET email = SUBSTRING(email, 1, LEN(email)-1) WHERE RIGHT(email, 1) = ']'

 --tira espacos brancos
 UPDATE Empresa_EntidadeExterna SET idEmpresa = LTRIM(RTRIM(idEmpresa));
--tira "
 UPDATE Empresa_EntidadeExterna SET idEmpresa = SUBSTRING(idEmpresa, 2, LEN(idEmpresa)) WHERE LEFT(idEmpresa, 1) = '"';
 UPDATE Empresa_EntidadeExterna SET idEmpresa = SUBSTRING(idEmpresa, 1, LEN(idEmpresa)-1) WHERE RIGHT(idEmpresa, 1) = '"'
--Tira [
 UPDATE Empresa_EntidadeExterna SET idEmpresa = SUBSTRING(idEmpresa, 2, LEN(idEmpresa)) WHERE LEFT(idEmpresa, 1) = '[';
 UPDATE Empresa_EntidadeExterna SET idEmpresa = SUBSTRING(idEmpresa, 1, LEN(idEmpresa)-1) WHERE RIGHT(idEmpresa, 1) = '['
--Tira ]
 UPDATE Empresa_EntidadeExterna SET idEmpresa = SUBSTRING(idEmpresa, 2, LEN(idEmpresa)) WHERE LEFT(idEmpresa, 1) = ']';
 UPDATE Empresa_EntidadeExterna SET idEmpresa = SUBSTRING(idEmpresa, 1, LEN(idEmpresa)-1) WHERE RIGHT(idEmpresa, 1) = ']'
 
--tira espacos brancos
 UPDATE Empresa_EntidadeExterna SET interlocutor = LTRIM(RTRIM(interlocutor));
--tira "
 UPDATE Empresa_EntidadeExterna SET interlocutor = SUBSTRING(interlocutor, 2, LEN(interlocutor)) WHERE LEFT(interlocutor, 1) = '"';
 UPDATE Empresa_EntidadeExterna SET interlocutor = SUBSTRING(interlocutor, 1, LEN(interlocutor)-1) WHERE RIGHT(interlocutor, 1) = '"'
--Tira [
 UPDATE Empresa_EntidadeExterna SET interlocutor = SUBSTRING(interlocutor, 2, LEN(interlocutor)) WHERE LEFT(interlocutor, 1) = '[';
 UPDATE Empresa_EntidadeExterna SET interlocutor = SUBSTRING(interlocutor, 1, LEN(interlocutor)-1) WHERE RIGHT(interlocutor, 1) = '['
--Tira ]
 UPDATE Empresa_EntidadeExterna SET interlocutor = SUBSTRING(interlocutor, 2, LEN(interlocutor)) WHERE LEFT(interlocutor, 1) = ']';
 UPDATE Empresa_EntidadeExterna SET interlocutor = SUBSTRING(interlocutor, 1, LEN(interlocutor)-1) WHERE RIGHT(interlocutor, 1) = ']'
  
--tira espacos brancos
 UPDATE Empresa_EntidadeExterna SET morada = LTRIM(RTRIM(morada));
--tira "
 UPDATE Empresa_EntidadeExterna SET morada = SUBSTRING(morada, 2, LEN(morada)) WHERE LEFT(morada, 1) = '"';
 UPDATE Empresa_EntidadeExterna SET morada = SUBSTRING(morada, 1, LEN(morada)-1) WHERE RIGHT(morada, 1) = '"'
--Tira [
 UPDATE Empresa_EntidadeExterna SET morada = SUBSTRING(morada, 2, LEN(morada)) WHERE LEFT(morada, 1) = '[';
 UPDATE Empresa_EntidadeExterna SET morada = SUBSTRING(morada, 1, LEN(morada)-1) WHERE RIGHT(morada, 1) = '['
--Tira ]
 UPDATE Empresa_EntidadeExterna SET morada = SUBSTRING(morada, 2, LEN(morada)) WHERE LEFT(morada, 1) = ']';
 UPDATE Empresa_EntidadeExterna SET morada = SUBSTRING(morada, 1, LEN(morada)-1) WHERE RIGHT(morada, 1) = ']'
 
 --tira espacos brancos
 UPDATE Empresa_EntidadeExterna SET nome = LTRIM(RTRIM(nome));
--tira "
 UPDATE Empresa_EntidadeExterna SET nome = SUBSTRING(nome, 2, LEN(nome)) WHERE LEFT(nome, 1) = '"';
 UPDATE Empresa_EntidadeExterna SET nome = SUBSTRING(nome, 1, LEN(nome)-1) WHERE RIGHT(nome, 1) = '"'
--Tira [
 UPDATE Empresa_EntidadeExterna SET nome = SUBSTRING(nome, 2, LEN(nome)) WHERE LEFT(nome, 1) = '[';
 UPDATE Empresa_EntidadeExterna SET nome = SUBSTRING(nome, 1, LEN(nome)-1) WHERE RIGHT(nome, 1) = '['
--Tira ]
 UPDATE Empresa_EntidadeExterna SET nome = SUBSTRING(nome, 2, LEN(nome)) WHERE LEFT(nome, 1) = ']';
 UPDATE Empresa_EntidadeExterna SET nome = SUBSTRING(nome, 1, LEN(nome)-1) WHERE RIGHT(nome, 1) = ']'

 --Grupo
 UPDATE Grupo SET idNumeroAluno1 = LTRIM(RTRIM(idNumeroAluno1));
 UPDATE Grupo SET idNumeroAluno1 = SUBSTRING(idNumeroAluno1, 2, LEN(idNumeroAluno1)) WHERE LEFT(idNumeroAluno1, 1) = '"';
 UPDATE Grupo SET idNumeroAluno1 = SUBSTRING(idNumeroAluno1, 1, LEN(idNumeroAluno1)-1) WHERE RIGHT(idNumeroAluno1, 1) = '"'
 UPDATE Grupo SET idNumeroAluno1 = SUBSTRING(idNumeroAluno1, 2, LEN(idNumeroAluno1)) WHERE LEFT(idNumeroAluno1, 1) = '[';
 UPDATE Grupo SET idNumeroAluno1 = SUBSTRING(idNumeroAluno1, 1, LEN(idNumeroAluno1)-1) WHERE RIGHT(idNumeroAluno1, 1) = '['
 UPDATE Grupo SET idNumeroAluno1 = SUBSTRING(idNumeroAluno1, 2, LEN(idNumeroAluno1)) WHERE LEFT(idNumeroAluno1, 1) = ']';
 UPDATE Grupo SET idNumeroAluno1 = SUBSTRING(idNumeroAluno1, 1, LEN(idNumeroAluno1)-1) WHERE RIGHT(idNumeroAluno1, 1) = ']'

UPDATE Grupo SET idNumeroAluno2 = LTRIM(RTRIM(idNumeroAluno2));
UPDATE Grupo SET idNumeroAluno2 = SUBSTRING(idNumeroAluno2, 2, LEN(idNumeroAluno2)) WHERE LEFT(idNumeroAluno2, 1) = '"';
UPDATE Grupo SET idNumeroAluno2 = SUBSTRING(idNumeroAluno2, 1, LEN(idNumeroAluno2)-1) WHERE RIGHT(idNumeroAluno2, 1) = '"';
UPDATE Grupo SET idNumeroAluno2 = SUBSTRING(idNumeroAluno2, 2, LEN(idNumeroAluno2)) WHERE LEFT(idNumeroAluno2, 1) = '[';
UPDATE Grupo SET idNumeroAluno2 = SUBSTRING(idNumeroAluno2, 1, LEN(idNumeroAluno2)-1) WHERE RIGHT(idNumeroAluno2, 1) = ']';

--HistoricoTFC
UPDATE HistoricoTFC SET avaliacao = LTRIM(RTRIM(avaliacao));
UPDATE HistoricoTFC SET avaliacao = SUBSTRING(avaliacao, 2, LEN(avaliacao)) WHERE LEFT(avaliacao, 1) = '"';
UPDATE HistoricoTFC SET avaliacao = SUBSTRING(avaliacao, 1, LEN(avaliacao)-1) WHERE RIGHT(avaliacao, 1) = '"';
UPDATE HistoricoTFC SET avaliacao = SUBSTRING(avaliacao, 2, LEN(avaliacao)) WHERE LEFT(avaliacao, 1) = '[';
UPDATE HistoricoTFC SET avaliacao = SUBSTRING(avaliacao, 1, LEN(avaliacao)-1) WHERE RIGHT(avaliacao, 1) = ']';

UPDATE HistoricoTFC SET dataMudancaEstado = LTRIM(RTRIM(dataMudancaEstado));
UPDATE HistoricoTFC SET dataMudancaEstado = SUBSTRING(dataMudancaEstado, 2, LEN(dataMudancaEstado)) WHERE LEFT(dataMudancaEstado, 1) = '"';
UPDATE HistoricoTFC SET dataMudancaEstado = SUBSTRING(dataMudancaEstado, 1, LEN(dataMudancaEstado)-1) WHERE RIGHT(dataMudancaEstado, 1) = '"';
UPDATE HistoricoTFC SET dataMudancaEstado = SUBSTRING(dataMudancaEstado, 2, LEN(dataMudancaEstado)) WHERE LEFT(dataMudancaEstado, 1) = '[';
UPDATE HistoricoTFC SET dataMudancaEstado = SUBSTRING(dataMudancaEstado, 1, LEN(dataMudancaEstado)-1) WHERE RIGHT(dataMudancaEstado, 1) = ']';

UPDATE HistoricoTFC SET estado = LTRIM(RTRIM(estado));
UPDATE HistoricoTFC SET estado = SUBSTRING(estado, 2, LEN(estado)) WHERE LEFT(estado, 1) = '"';
UPDATE HistoricoTFC SET estado = SUBSTRING(estado, 1, LEN(estado)-1) WHERE RIGHT(estado, 1) = '"';
UPDATE HistoricoTFC SET estado = SUBSTRING(estado, 2, LEN(estado)) WHERE LEFT(estado, 1) = '[';
UPDATE HistoricoTFC SET estado = SUBSTRING(estado, 1, LEN(estado)-1) WHERE RIGHT(estado, 1) = ']';

UPDATE HistoricoTFC SET idTFC = LTRIM(RTRIM(idTFC));
UPDATE HistoricoTFC SET idTFC = SUBSTRING(idTFC, 2, LEN(idTFC)) WHERE LEFT(idTFC, 1) = '"';
UPDATE HistoricoTFC SET idTFC = SUBSTRING(idTFC, 1, LEN(idTFC)-1) WHERE RIGHT(idTFC, 1) = '"';
UPDATE HistoricoTFC SET idTFC = SUBSTRING(idTFC, 2, LEN(idTFC)) WHERE LEFT(idTFC, 1) = '[';
UPDATE HistoricoTFC SET idTFC = SUBSTRING(idTFC, 1, LEN(idTFC)-1) WHERE RIGHT(idTFC, 1) = ']';

UPDATE HistoricoTFC SET utilizador = LTRIM(RTRIM(utilizador));
UPDATE HistoricoTFC SET utilizador = SUBSTRING(utilizador, 2, LEN(utilizador)) WHERE LEFT(utilizador, 1) = '"';
UPDATE HistoricoTFC SET utilizador = SUBSTRING(utilizador, 1, LEN(utilizador)-1) WHERE RIGHT(utilizador, 1) = '"';
UPDATE HistoricoTFC SET utilizador = SUBSTRING(utilizador, 2, LEN(utilizador)) WHERE LEFT(utilizador, 1) = '[';
UPDATE HistoricoTFC SET utilizador = SUBSTRING(utilizador, 1, LEN(utilizador)-1) WHERE RIGHT(utilizador, 1) = ']';

--Inscricao
UPDATE Inscricao SET estado = LTRIM(RTRIM(estado));
UPDATE Inscricao SET estado = SUBSTRING(estado, 2, LEN(estado)) WHERE LEFT(estado, 1) = '"';
UPDATE Inscricao SET estado = SUBSTRING(estado, 1, LEN(estado)-1) WHERE RIGHT(estado, 1) = '"';
UPDATE Inscricao SET estado = SUBSTRING(estado, 2, LEN(estado)) WHERE LEFT(estado, 1) = '[';
UPDATE Inscricao SET estado = SUBSTRING(estado, 1, LEN(estado)-1) WHERE RIGHT(estado, 1) = ']';

UPDATE Inscricao SET idTFC = LTRIM(RTRIM(idTFC));
UPDATE Inscricao SET idTFC = SUBSTRING(idTFC, 2, LEN(idTFC)) WHERE LEFT(idTFC, 1) = '"';
UPDATE Inscricao SET idTFC = SUBSTRING(idTFC, 1, LEN(idTFC)-1) WHERE RIGHT(idTFC, 1) = '"';
UPDATE Inscricao SET idTFC = SUBSTRING(idTFC, 2, LEN(idTFC)) WHERE LEFT(idTFC, 1) = '[';
UPDATE Inscricao SET idTFC = SUBSTRING(idTFC, 1, LEN(idTFC)-1) WHERE RIGHT(idTFC, 1) = ']';

UPDATE Inscricao SET numeroAluno = LTRIM(RTRIM(numeroAluno));
UPDATE Inscricao SET numeroAluno = SUBSTRING(numeroAluno, 2, LEN(numeroAluno)) WHERE LEFT(numeroAluno, 1) = '"';
UPDATE Inscricao SET numeroAluno = SUBSTRING(numeroAluno, 1, LEN(numeroAluno)-1) WHERE RIGHT(numeroAluno, 1) = '"';
UPDATE Inscricao SET numeroAluno = SUBSTRING(numeroAluno, 2, LEN(numeroAluno)) WHERE LEFT(numeroAluno, 1) = '[';
UPDATE Inscricao SET numeroAluno = SUBSTRING(numeroAluno, 1, LEN(numeroAluno)-1) WHERE RIGHT(numeroAluno, 1) = ']';

UPDATE Inscricao SET anoLetivo = LTRIM(RTRIM(anoLetivo));
UPDATE Inscricao SET anoLetivo = SUBSTRING(anoLetivo, 2, LEN(anoLetivo)) WHERE LEFT(anoLetivo, 1) = '"';
UPDATE Inscricao SET anoLetivo = SUBSTRING(anoLetivo, 1, LEN(anoLetivo)-1) WHERE RIGHT(anoLetivo, 1) = '"';
UPDATE Inscricao SET anoLetivo = SUBSTRING(anoLetivo, 2, LEN(anoLetivo)) WHERE LEFT(anoLetivo, 1) = '[';
UPDATE Inscricao SET anoLetivo = SUBSTRING(anoLetivo, 1, LEN(anoLetivo)-1) WHERE RIGHT(anoLetivo, 1) = ']';
--ProfessorDeisi
UPDATE ProfessorDeisi SET email = LTRIM(RTRIM(email));
UPDATE ProfessorDeisi SET email = SUBSTRING(email, 2, LEN(email)) WHERE LEFT(email, 1) = '"';
UPDATE ProfessorDeisi SET email = SUBSTRING(email, 1, LEN(email)-1) WHERE RIGHT(email, 1) = '"';
UPDATE ProfessorDeisi SET email = SUBSTRING(email, 2, LEN(email)) WHERE LEFT(email, 1) = '[';
UPDATE ProfessorDeisi SET email = SUBSTRING(email, 1, LEN(email)-1) WHERE RIGHT(email, 1) = ']';

UPDATE ProfessorDeisi SET nome = LTRIM(RTRIM(nome));
UPDATE ProfessorDeisi SET nome = SUBSTRING(nome, 2, LEN(nome)) WHERE LEFT(nome, 1) = '"';
UPDATE ProfessorDeisi SET nome = SUBSTRING(nome, 1, LEN(nome)-1) WHERE RIGHT(nome, 1) = '"';
UPDATE ProfessorDeisi SET nome = SUBSTRING(nome, 2, LEN(nome)) WHERE LEFT(nome, 1) = '[';
UPDATE ProfessorDeisi SET nome = SUBSTRING(nome, 1, LEN(nome)-1) WHERE RIGHT(nome, 1) = ']';

UPDATE ProfessorDeisi SET numeroProfessor = LTRIM(RTRIM(numeroProfessor));
UPDATE ProfessorDeisi SET numeroProfessor = SUBSTRING(numeroProfessor, 2, LEN(numeroProfessor)) WHERE LEFT(numeroProfessor, 1) = '"';
UPDATE ProfessorDeisi SET numeroProfessor = SUBSTRING(numeroProfessor, 1, LEN(numeroProfessor)-1) WHERE RIGHT(numeroProfessor, 1) = '"';
UPDATE ProfessorDeisi SET numeroProfessor = SUBSTRING(numeroProfessor, 2, LEN(numeroProfessor)) WHERE LEFT(numeroProfessor, 1) = '[';
UPDATE ProfessorDeisi SET numeroProfessor = SUBSTRING(numeroProfessor, 1, LEN(numeroProfessor)-1) WHERE RIGHT(numeroProfessor, 1) = ']';

--ProfessorNDEISI
-- Para a coluna departamentoAfeto
UPDATE ProfessorNDEISI SET departamentoAfeto = LTRIM(RTRIM(departamentoAfeto));
UPDATE ProfessorNDEISI SET departamentoAfeto = SUBSTRING(departamentoAfeto, 2, LEN(departamentoAfeto)) WHERE LEFT(departamentoAfeto, 1) = '"';
UPDATE ProfessorNDEISI SET departamentoAfeto = SUBSTRING(departamentoAfeto, 1, LEN(departamentoAfeto)-1) WHERE RIGHT(departamentoAfeto, 1) = '"';
UPDATE ProfessorNDEISI SET departamentoAfeto = SUBSTRING(departamentoAfeto, 2, LEN(departamentoAfeto)) WHERE LEFT(departamentoAfeto, 1) = '[';
UPDATE ProfessorNDEISI SET departamentoAfeto = SUBSTRING(departamentoAfeto, 1, LEN(departamentoAfeto)-1) WHERE RIGHT(departamentoAfeto, 1) = ']';

-- Para a coluna email
UPDATE ProfessorNDEISI SET email = LTRIM(RTRIM(email));
UPDATE ProfessorNDEISI SET email = SUBSTRING(email, 2, LEN(email)) WHERE LEFT(email, 1) = '"';
UPDATE ProfessorNDEISI SET email = SUBSTRING(email, 1, LEN(email)-1) WHERE RIGHT(email, 1) = '"';
UPDATE ProfessorNDEISI SET email = SUBSTRING(email, 2, LEN(email)) WHERE LEFT(email, 1) = '[';
UPDATE ProfessorNDEISI SET email = SUBSTRING(email, 1, LEN(email)-1) WHERE RIGHT(email, 1) = ']';

-- Para a coluna idProfessor
UPDATE ProfessorNDEISI SET idProfessor = LTRIM(RTRIM(idProfessor));
UPDATE ProfessorNDEISI SET idProfessor = SUBSTRING(idProfessor, 2, LEN(idProfessor)) WHERE LEFT(idProfessor, 1) = '"';
UPDATE ProfessorNDEISI SET idProfessor = SUBSTRING(idProfessor, 1, LEN(idProfessor)-1) WHERE RIGHT(idProfessor, 1) = '"';
UPDATE ProfessorNDEISI SET idProfessor = SUBSTRING(idProfessor, 2, LEN(idProfessor)) WHERE LEFT(idProfessor, 1) = '[';
UPDATE ProfessorNDEISI SET idProfessor = SUBSTRING(idProfessor, 1, LEN(idProfessor)-1) WHERE RIGHT(idProfessor, 1) = ']';

-- Para a coluna nome
UPDATE ProfessorNDEISI SET nome = LTRIM(RTRIM(nome));
UPDATE ProfessorNDEISI SET nome = SUBSTRING(nome, 2, LEN(nome)) WHERE LEFT(nome, 1) = '"';
UPDATE ProfessorNDEISI SET nome = SUBSTRING(nome, 1, LEN(nome)-1) WHERE RIGHT(nome, 1) = '"';
UPDATE ProfessorNDEISI SET nome = SUBSTRING(nome, 2, LEN(nome)) WHERE LEFT(nome, 1) = '[';
UPDATE ProfessorNDEISI SET nome = SUBSTRING(nome, 1, LEN(nome)-1) WHERE RIGHT(nome, 1) = ']';

--Tecnologia
UPDATE Tecnologia SET nome = LTRIM(RTRIM(nome));
UPDATE Tecnologia SET nome = SUBSTRING(nome, 2, LEN(nome)) WHERE LEFT(nome, 1) = '"';
UPDATE Tecnologia SET nome = SUBSTRING(nome, 1, LEN(nome)-1) WHERE RIGHT(nome, 1) = '"';
UPDATE Tecnologia SET nome = SUBSTRING(nome, 2, LEN(nome)) WHERE LEFT(nome, 1) = '[';
UPDATE Tecnologia SET nome = SUBSTRING(nome, 1, LEN(nome)-1) WHERE RIGHT(nome, 1) = ']';
--TFC
-- Para a coluna Titulo
UPDATE TFC SET Titulo = LTRIM(RTRIM(Titulo));
UPDATE TFC SET Titulo = SUBSTRING(Titulo, 2, LEN(Titulo)) WHERE LEFT(Titulo, 1) = '"';
UPDATE TFC SET Titulo = SUBSTRING(Titulo, 1, LEN(Titulo)-1) WHERE RIGHT(Titulo, 1) = '"';
UPDATE TFC SET Titulo = SUBSTRING(Titulo, 2, LEN(Titulo)) WHERE LEFT(Titulo, 1) = '[';
UPDATE TFC SET Titulo = SUBSTRING(Titulo, 1, LEN(Titulo)-1) WHERE RIGHT(Titulo, 1) = ']';

-- Para a coluna anoLetivo
UPDATE TFC SET anoLetivo = LTRIM(RTRIM(anoLetivo));
UPDATE TFC SET anoLetivo = SUBSTRING(anoLetivo, 2, LEN(anoLetivo)) WHERE LEFT(anoLetivo, 1) = '"';
UPDATE TFC SET anoLetivo = SUBSTRING(anoLetivo, 1, LEN(anoLetivo)-1) WHERE RIGHT(anoLetivo, 1) = '"';
UPDATE TFC SET anoLetivo = SUBSTRING(anoLetivo, 2, LEN(anoLetivo)) WHERE LEFT(anoLetivo, 1) = '[';
UPDATE TFC SET anoLetivo = SUBSTRING(anoLetivo, 1, LEN(anoLetivo)-1) WHERE RIGHT(anoLetivo, 1) = ']';

-- Para a coluna avaliacaoProposta
UPDATE TFC SET avaliacaoProposta = LTRIM(RTRIM(avaliacaoProposta));
UPDATE TFC SET avaliacaoProposta = SUBSTRING(avaliacaoProposta, 2, LEN(avaliacaoProposta)) WHERE LEFT(avaliacaoProposta, 1) = '"';
UPDATE TFC SET avaliacaoProposta = SUBSTRING(avaliacaoProposta, 1, LEN(avaliacaoProposta)-1) WHERE RIGHT(avaliacaoProposta, 1) = '"';
UPDATE TFC SET avaliacaoProposta = SUBSTRING(avaliacaoProposta, 2, LEN(avaliacaoProposta)) WHERE LEFT(avaliacaoProposta, 1) = '[';
UPDATE TFC SET avaliacaoProposta = SUBSTRING(avaliacaoProposta, 1, LEN(avaliacaoProposta)-1) WHERE RIGHT(avaliacaoProposta, 1) = ']';

-- Para a coluna coorientador
UPDATE TFC SET coorientador = LTRIM(RTRIM(coorientador));
UPDATE TFC SET coorientador = SUBSTRING(coorientador, 2, LEN(coorientador)) WHERE LEFT(coorientador, 1) = '"';
UPDATE TFC SET coorientador = SUBSTRING(coorientador, 1, LEN(coorientador)-1) WHERE RIGHT(coorientador, 1) = '"';
UPDATE TFC SET coorientador = SUBSTRING(coorientador, 2, LEN(coorientador)) WHERE LEFT(coorientador, 1) = '[';
UPDATE TFC SET coorientador = SUBSTRING(coorientador, 1, LEN(coorientador)-1) WHERE RIGHT(coorientador, 1) = ']';
-- Para a coluna dataEstado
UPDATE TFC SET dataEstado = LTRIM(RTRIM(dataEstado));
UPDATE TFC SET dataEstado = SUBSTRING(dataEstado, 2, LEN(dataEstado)) WHERE LEFT(dataEstado, 1) = '"';
UPDATE TFC SET dataEstado = SUBSTRING(dataEstado, 1, LEN(dataEstado)-1) WHERE RIGHT(dataEstado, 1) = '"';
UPDATE TFC SET dataEstado = SUBSTRING(dataEstado, 2, LEN(dataEstado)) WHERE LEFT(dataEstado, 1) = '[';
UPDATE TFC SET dataEstado = SUBSTRING(dataEstado, 1, LEN(dataEstado)-1) WHERE RIGHT(dataEstado, 1) = ']';

-- Para a coluna dataProposta
UPDATE TFC SET dataProposta = LTRIM(RTRIM(dataProposta));
UPDATE TFC SET dataProposta = SUBSTRING(dataProposta, 2, LEN(dataProposta)) WHERE LEFT(dataProposta, 1) = '"';
UPDATE TFC SET dataProposta = SUBSTRING(dataProposta, 1, LEN(dataProposta)-1) WHERE RIGHT(dataProposta, 1) = '"';
UPDATE TFC SET dataProposta = SUBSTRING(dataProposta, 2, LEN(dataProposta)) WHERE LEFT(dataProposta, 1) = '[';
UPDATE TFC SET dataProposta = SUBSTRING(dataProposta, 1, LEN(dataProposta)-1) WHERE RIGHT(dataProposta, 1) = ']';
-- Para a coluna estado
UPDATE TFC SET estado = LTRIM(RTRIM(estado));
UPDATE TFC SET estado = SUBSTRING(estado, 2, LEN(estado)) WHERE LEFT(estado, 1) = '"';
UPDATE TFC SET estado = SUBSTRING(estado, 1, LEN(estado)-1) WHERE RIGHT(estado, 1) = '"';
UPDATE TFC SET estado = SUBSTRING(estado, 2, LEN(estado)) WHERE LEFT(estado, 1) = '[';
UPDATE TFC SET estado = SUBSTRING(estado, 1, LEN(estado)-1) WHERE RIGHT(estado, 1) = ']';

-- Para a coluna idtfc
UPDATE TFC SET idtfc = LTRIM(RTRIM(idtfc));
UPDATE TFC SET idtfc = SUBSTRING(idtfc, 2, LEN(idtfc)) WHERE LEFT(idtfc, 1) = '"';
UPDATE TFC SET idtfc = SUBSTRING(idtfc, 1, LEN(idtfc)-1) WHERE RIGHT(idtfc, 1) = '"';
UPDATE TFC SET idtfc = SUBSTRING(idtfc, 2, LEN(idtfc)) WHERE LEFT(idtfc, 1) = '[';
UPDATE TFC SET idtfc = SUBSTRING(idtfc, 1, LEN(idtfc)-1) WHERE RIGHT(idtfc, 1) = ']';

-- Para a coluna motivoRecusa
UPDATE TFC SET motivoRecusa = LTRIM(RTRIM(motivoRecusa));
UPDATE TFC SET motivoRecusa = SUBSTRING(motivoRecusa, 2, LEN(motivoRecusa)) WHERE LEFT(motivoRecusa, 1) = '"';
UPDATE TFC SET motivoRecusa = SUBSTRING(motivoRecusa, 1, LEN(motivoRecusa)-1) WHERE RIGHT(motivoRecusa, 1) = '"';
UPDATE TFC SET motivoRecusa = SUBSTRING(motivoRecusa, 2, LEN(motivoRecusa)) WHERE LEFT(motivoRecusa, 1) = '[';
UPDATE TFC SET motivoRecusa = SUBSTRING(motivoRecusa, 1, LEN(motivoRecusa)-1) WHERE RIGHT(motivoRecusa, 1) = ']';

-- Para a coluna orientador
UPDATE TFC SET orientador = LTRIM(RTRIM(orientador));
UPDATE TFC SET orientador = SUBSTRING(orientador, 2, LEN(orientador)) WHERE LEFT(orientador, 1) = '"';
UPDATE TFC SET orientador = SUBSTRING(orientador, 1, LEN(orientador)-1) WHERE RIGHT(orientador, 1) = '"';
UPDATE TFC SET orientador = SUBSTRING(orientador, 2, LEN(orientador)) WHERE LEFT(orientador, 1) = '[';
UPDATE TFC SET orientador = SUBSTRING(orientador, 1, LEN(orientador)-1) WHERE RIGHT(orientador, 1) = ']';
-- Para a coluna preponente
UPDATE TFC SET preponente = LTRIM(RTRIM(preponente));
UPDATE TFC SET preponente = SUBSTRING(preponente, 2, LEN(preponente)) WHERE LEFT(preponente, 1) = '"';
UPDATE TFC SET preponente = SUBSTRING(preponente, 1, LEN(preponente)-1) WHERE RIGHT(preponente, 1) = '"';
UPDATE TFC SET preponente = SUBSTRING(preponente, 2, LEN(preponente)) WHERE LEFT(preponente, 1) = '[';
UPDATE TFC SET preponente = SUBSTRING(preponente, 1, LEN(preponente)-1) WHERE RIGHT(preponente, 1) = ']';

-- Para a coluna orientadorProposto
UPDATE TFC SET orientadorProposto = LTRIM(RTRIM(orientadorProposto));
UPDATE TFC SET orientadorProposto = SUBSTRING(orientadorProposto, 2, LEN(orientadorProposto)) WHERE LEFT(orientadorProposto, 1) = '"';
UPDATE TFC SET orientadorProposto = SUBSTRING(orientadorProposto, 1, LEN(orientadorProposto)-1) WHERE RIGHT(orientadorProposto, 1) = '"';
UPDATE TFC SET orientadorProposto = SUBSTRING(orientadorProposto, 2, LEN(orientadorProposto)) WHERE LEFT(orientadorProposto, 1) = '[';
UPDATE TFC SET orientadorProposto = SUBSTRING(orientadorProposto, 1, LEN(orientadorProposto)-1) WHERE RIGHT(orientadorProposto, 1) = ']';

-- Para a coluna tecnologias
UPDATE TFC SET tecnologias = LTRIM(RTRIM(tecnologias));
UPDATE TFC SET tecnologias = SUBSTRING(tecnologias, 2, LEN(tecnologias)) WHERE LEFT(tecnologias, 1) = '"';
UPDATE TFC SET tecnologias = SUBSTRING(tecnologias, 1, LEN(tecnologias)-1) WHERE RIGHT(tecnologias, 1) = '"';
UPDATE TFC SET tecnologias = SUBSTRING(tecnologias, 2, LEN(tecnologias)) WHERE LEFT(tecnologias, 1) = '[';
UPDATE TFC SET tecnologias = SUBSTRING(tecnologias, 1, LEN(tecnologias)-1) WHERE RIGHT(tecnologias, 1) = ']';

--4.3
--verificar quais os valores que existem nos dados
SELECT distinct estado FROM Inscricao
--verificar quais e que sao diferentes dos do enunciado
SELECT distinct estado FROM Inscricao WHERE estado NOT IN ('Aguarda Atribuição', 'Atribuído', 'Não Atribuído', 'Atribuído', 'Anulado') OR estado IS NULL;
--contagem 
SELECT count(estado) FROM Inscricao WHERE estado NOT IN ('Aguarda Atribuição', 'Atribuído', 'Não Atribuído', 'Atribuído', 'Anulado') OR estado IS NULL;
SELECT count(estado) FROM Inscricao 

--mapeamento dos estados do enunciados para as colunas incorretas tabela inscricao
BEGIN TRANSACTION TransactionUpdateEstadoInscricao;
UPDATE Inscricao SET estado = 'Aguarda Atribuição' WHERE estado = 'A Aguardar Atribuição';
UPDATE Inscricao SET estado = 'Atribuído' WHERE estado = 'Atribuido';
UPDATE Inscricao SET estado = 'Não Atribuído' WHERE estado = 'Não Atribuido';
UPDATE Inscricao SET estado = 'Anulado' WHERE estado IS NULL;

--validacao de que os estados tao certos
SELECT distinct estado FROM Inscricao WHERE estado NOT IN ('Aguarda Atribuição', 'Atribuído', 'Não Atribuído', 'Atribuído', 'Anulado') OR estado IS NULL;
SELECT distinct estado FROM Inscricao

COMMIT TRANSACTION TransactionUpdateEstadoInscricao;
--ROLLBACK TRANSACTION TransactionUpdateEstadoInscricao;

   
SELECT count(estado) FROM TFC WHERE estado NOT IN ('Aguarda Aprovação', 'Recusado', 'Aguarda Atribuição', 'Atribuído', 'Publicado', 'Indisponível', 'Anulado') OR estado IS NULL;
SELECT distinct estado FROM TFC WHERE estado NOT IN ('Aguarda Aprovação', 'Recusado', 'Aguarda Atribuição', 'Atribuído', 'Publicado', 'Indisponível', 'Anulado') OR estado IS NULL;

BEGIN TRANSACTION TransactionUpdateEstadoTFC;
UPDATE TFC SET estado = 'Aguarda Aprovação' WHERE estado = 'A Aguardar Aprovação';
UPDATE TFC SET estado = 'Aguarda Atribuição' WHERE TRIM(estado) = 'A Aguardar Atribuição';
UPDATE TFC SET estado = 'Atribuído' WHERE TRIM(estado) = 'Atribuido';
UPDATE TFC SET estado = 'Não Atribuído' WHERE TRIM(estado) = 'Nao Atribuido';
UPDATE TFC SET estado = 'Indisponível' WHERE TRIM(estado) = 'Indisponivel';
UPDATE TFC SET estado = 'Anulado' WHERE estado NOT IN ('Aguarda Aprovação', 'Recusado', 'Aguarda Atribuição', 'Atribuído', 'Publicado', 'Indisponível', 'Anulado') OR estado IS NULL;

SELECT count(estado) FROM TFC WHERE estado NOT IN ('Aguarda Aprovação', 'Recusado', 'Aguarda Atribuição', 'Atribuído', 'Publicado', 'Indisponível', 'Anulado') OR estado IS NULL;
SELECT estado FROM TFC WHERE estado NOT IN ('Aguarda Aprovação', 'Recusado', 'Aguarda Atribuição', 'Atribuído', 'Publicado', 'Indisponível', 'Anulado') OR estado IS NULL;
SELECT distinct estado FROM TFC 

COMMIT TRANSACTION TransactionUpdateEstadoTFC;
--ROLLBACK TRANSACTION TransactionUpdateEstadoTFC;

--5.1
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

--5.1.1
--TFC
SELECT idtfc AS NumRepetidos FROM TFC GROUP BY idtfc HAVING COUNT(idtfc) > 1;
--5.1.2
-- Aluno
SELECT numeroAluno, COUNT(numeroAluno) AS NumRepetidos FROM Aluno GROUP BY numeroAluno HAVING COUNT(numeroAluno) > 1;

-- ProfessorDEISI
SELECT numeroProfessor, COUNT(numeroProfessor) AS NumRepetidos FROM ProfessorDEISI GROUP BY numeroProfessor HAVING COUNT(numeroProfessor) > 1;

-- ProfessorNDEISI
SELECT idProfessor, COUNT(idProfessor) AS NumRepetidos FROM ProfessorNDEISI GROUP BY idProfessor HAVING COUNT(idProfessor) > 1;

--5.1.3
-- Aluno em mais do que um grupo
SELECT idNumeroAluno, COUNT(*) AS NumRepetidos FROM ( SELECT idNumeroAluno1 AS idNumeroAluno FROM Grupo UNION ALL SELECT idNumeroAluno2 AS idNumeroAluno FROM Grupo ) AS Alunos GROUP BY idNumeroAluno HAVING COUNT(*) > 1;

--5.2

-- TFC
select count(*)from dbo.TFC --336
-- Inserir registros com idtfc igual para testar
INSERT INTO TFC VALUES
(999, 'TFC1', 'Ano1', 'Avaliacao1', 'Coorientador1', '2023-01-01', '2023-01-15', 'Descrição1', 1, 'Estado1', 1, 'IDTFC3', 'Motivo1', 5, 'Orientador1', 'OrientadorProposto1', 'Preponente1', 1, 'Tecnologias1'),
(999, 'TFC2', 'Ano2', 'Avaliacao2', 'Coorientador2', '2023-02-01', '2023-02-15', 'Descrição2', 2, 'Estado2', 2, 'IDTFC3', 'Motivo2', 7, 'Orientador2', 'OrientadorProposto2', 'Preponente2', 2, 'Tecnologias2'),
(999, 'TFC3', 'Ano3', 'Avaliacao3', 'Coorientador3', '2023-03-01', '2023-03-15', 'Descrição3', 3, 'Estado3', 3, 'IDTFC3', 'Motivo3', 8, 'Orientador3', 'OrientadorProposto3', 'Preponente3', 1, 'Tecnologias3'),
(999, 'TFC4', 'Ano4', 'Avaliacao4', 'Coorientador4', '2023-04-01', '2023-04-15', 'Descrição4', 4, 'Estado4', 4, 'IDTFC4', 'Motivo4', 10, 'Orientador4', 'OrientadorProposto4', 'Preponente4', 2, 'Tecnologias4'),
(999, 'TFC5', 'Ano5', 'Avaliacao5', 'Coorientador5', '2023-05-01', '2023-05-15', 'Descrição5', 5, 'Estado5', 5, 'IDTFC4', 'Motivo5', 12, 'Orientador5', 'OrientadorProposto5', 'Preponente5', 2, 'Tecnologias5');

SELECT idtfc AS NumRepetidos FROM TFC GROUP BY idtfc HAVING COUNT(idtfc) > 1;

-- Adiciona a coluna temporária
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TFC' AND COLUMN_NAME = 'id_temp')
BEGIN
    ALTER TABLE TFC
    ADD id_temp INT;
END;

select count(*)from dbo.TFC --341

BEGIN TRANSACTION RemoveDuplicates;

	DECLARE @counter INT = 1;

	-- Update and assign id_temp using a named transaction
	UPDATE dbo.TFC
	SET @counter = id_temp = @counter + 1;

	-- Delete duplicates within the named transaction
	DELETE t1
	FROM dbo.TFC t1
	JOIN dbo.TFC t2 ON t1.idtfc = t2.idtfc AND t1.id_temp < t2.id_temp;

--validar que duplicados foram eliminados
SELECT * FROM TFC WHERE idtfc like 'IDTFC%'
COMMIT TRANSACTION RemoveDuplicates;
delete from tfc where idtfc like 'IDTFC%'


-- Aluno
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Aluno' AND COLUMN_NAME = 'id_temp')
BEGIN
    ALTER TABLE Aluno
    ADD id_temp INT;
END;

SELECT numeroAluno, COUNT(numeroAluno) AS NumRepetidos FROM Aluno GROUP BY numeroAluno HAVING COUNT(numeroAluno) > 1;


BEGIN TRANSACTION RemoveDuplicates;

	DECLARE @counterAluno INT = 1;

	UPDATE Aluno
	SET @counterAluno = id_temp = @counterAluno + 1;

	DELETE t1
	FROM Aluno t1
	JOIN Aluno t2 ON t1.numeroAluno = t2.numeroAluno AND t1.id_temp < t2.id_temp;

COMMIT TRANSACTION RemoveDuplicates;

             
-- ProfessorDEISI
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'ProfessorDEISI' AND COLUMN_NAME = 'id_temp')
BEGIN
    ALTER TABLE ProfessorDEISI
    ADD id_temp INT;
END;

BEGIN TRANSACTION RemoveDuplicatesProfessorDEISI;
DECLARE @counterProfessorDEISI INT = 1;

	UPDATE ProfessorDEISI
	SET @counterProfessorDEISI = id_temp = @counterProfessorDEISI + 1;

	DELETE t1
	FROM ProfessorDEISI t1
	JOIN ProfessorDEISI t2 ON t1.numeroProfessor = t2.numeroProfessor AND t1.id_temp < t2.id_temp;

COMMIT TRANSACTION RemoveDuplicatesProfessorDEISI;



-- ProfessorNDEISI
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'ProfessorNDEISI' AND COLUMN_NAME = 'id_temp')
BEGIN
    ALTER TABLE ProfessorNDEISI
    ADD id_temp INT;
END;

BEGIN TRANSACTION RemoveDuplicatesProfessorNDEISI;

DECLARE @counterProfessorNDEISI INT = 1;
	UPDATE ProfessorNDEISI
	SET @counterProfessorNDEISI = id_temp = @counterProfessorNDEISI + 1;

	DELETE t1
	FROM ProfessorNDEISI t1
	JOIN ProfessorNDEISI t2 ON t1.idProfessor = t2.idProfessor AND t1.id_temp < t2.id_temp;

COMMIT TRANSACTION RemoveDuplicatesProfessorNDEISI;


-- Grupo
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Grupo' AND COLUMN_NAME = 'id_temp')
BEGIN
    ALTER TABLE Grupo
    ADD id_temp INT;
END;
select * from Grupo
SELECT idNumeroAluno, COUNT(*) AS NumRepetidos FROM ( SELECT idNumeroAluno1 AS idNumeroAluno FROM Grupo UNION ALL SELECT idNumeroAluno2 AS idNumeroAluno FROM Grupo ) AS Alunos GROUP BY idNumeroAluno HAVING COUNT(*) > 1;

-- Create a temporary table
CREATE TABLE TempDuplicadosGrupo (
    idNumeroAluno VARCHAR(255),
    Count INT
);

-- Insert values into the temporary table
INSERT INTO TempDuplicadosGrupo (idNumeroAluno, Count)
SELECT idNumeroAluno, COUNT(*) AS Count
FROM (
    SELECT idNumeroAluno1 AS idNumeroAluno FROM Grupo
    UNION ALL 
    SELECT idNumeroAluno2 AS idNumeroAluno FROM Grupo
) AS Alunos
GROUP BY idNumeroAluno
HAVING COUNT(*) > 1;

SELECT * FROM TempDuplicadosGrupo;
BEGIN TRANSACTION RemoveDuplicatesGrupo;

UPDATE Grupo
SET id_temp = TempDuplicadosGrupo.Count
FROM (
    SELECT idNumeroAluno1 AS idNumeroAluno FROM Grupo
    UNION ALL 
    SELECT idNumeroAluno2 AS idNumeroAluno FROM Grupo
) AS Alunos
JOIN TempDuplicadosGrupo ON Alunos.idNumeroAluno = TempDuplicadosGrupo.idNumeroAluno;

DELETE FROM Grupo
WHERE EXISTS (
    SELECT 1
    FROM (
        SELECT idNumeroAluno1 AS idNumeroAluno, MAX(id_temp) AS id_temp
        FROM Grupo
        GROUP BY idNumeroAluno1
        HAVING COUNT(*) > 1
        UNION ALL
        SELECT idNumeroAluno2 AS idNumeroAluno, MAX(id_temp) AS id_temp
        FROM Grupo
        GROUP BY idNumeroAluno2
        HAVING COUNT(*) > 1
    ) AS Duplicates
    WHERE (Grupo.idNumeroAluno1 = Duplicates.idNumeroAluno AND Grupo.id_temp = Duplicates.id_temp)
       OR (Grupo.idNumeroAluno2 = Duplicates.idNumeroAluno AND Grupo.id_temp = Duplicates.id_temp)
);

--validar que foram eliminados duplicados, nao eliminou todos
SELECT idNumeroAluno, COUNT(*) AS NumRepetidos FROM ( SELECT idNumeroAluno1 AS idNumeroAluno FROM Grupo UNION ALL SELECT idNumeroAluno2 AS idNumeroAluno FROM Grupo ) AS Alunos GROUP BY idNumeroAluno HAVING COUNT(*) > 1;


COMMIT TRANSACTION RemoveDuplicatesGrupo
--ROLLBACK TRANSACTION RemoveDuplicatesGrupo

--drop tabela temporaria
DROP TABLE TempDuplicadosGrupo;

-- 5.3 
-- Tabelas afetadas pelo idTFC

-- Valida TFCCurso
SELECT count(*) FROM TFCCurso WHERE idTFC NOT IN (SELECT id FROM TFC);
-- Valida TFCTecnologia
SELECT count(*) FROM TFCTecnologia WHERE idTFC NOT IN (SELECT id FROM TFC);
-- Valida Inscricao
SELECT count(*) FROM Inscricao WHERE idTFC NOT IN (SELECT idTFC FROM TFC);
-- Valida HistoricoTFC
SELECT count(*) FROM HistoricoTFC WHERE idTFC NOT IN (SELECT idTFC FROM TFC);

BEGIN TRANSACTION VerificarCoerenciaIdTFC;

	DELETE FROM TFCCurso WHERE idTFC NOT IN (SELECT id FROM TFC);

	DELETE FROM TFCTecnologia WHERE idTFC NOT IN (SELECT id FROM TFC);

	DELETE FROM Inscricao WHERE idTFC NOT IN (SELECT idTFC FROM TFC);

	DELETE FROM HistoricoTFC WHERE idTFC NOT IN (SELECT idTFC FROM TFC);

-- Valida TFCCurso
SELECT count(*) FROM TFCCurso WHERE idTFC NOT IN (SELECT id FROM TFC);
-- Valida TFCTecnologia
SELECT count(*) FROM TFCTecnologia WHERE idTFC NOT IN (SELECT id FROM TFC);
-- Valida Inscricao
SELECT count(*) FROM Inscricao WHERE idTFC NOT IN (SELECT idTFC FROM TFC);
-- Valida HistoricoTFC
SELECT count(*) FROM HistoricoTFC WHERE idTFC NOT IN (SELECT idTFC FROM TFC);

COMMIT TRANSACTION VerificarCoerencia;

-- numeroProfessor

SELECT count(*) FROM TFC WHERE orientador NOT IN (SELECT numeroProfessor FROM ProfessorDEISI);
SELECT count(*) FROM TFC WHERE orientadorProposto NOT IN (SELECT numeroProfessor FROM ProfessorDEISI);

BEGIN TRANSACTION VerificarNumeroProfessor;
            DELETE FROM TFC WHERE orientador NOT IN (SELECT numeroProfessor FROM ProfessorDEISI)
            DELETE FROM TFC WHERE orientadorProposto NOT IN (SELECT numeroProfessor FROM ProfessorDEISI)

SELECT count(*) FROM TFC WHERE orientador NOT IN (SELECT numeroProfessor FROM ProfessorDEISI);
SELECT count(*) FROM TFC WHERE orientadorProposto NOT IN (SELECT numeroProfessor FROM ProfessorDEISI);

 COMMIT TRANSACTION VerificarCoerencia;


-- idNumeroAluno1 e idNumeroAluno2 numeroAluno

 SELECT count(*) FROM AvaliacaoDisciplinaAluno WHERE idNumeroAluno NOT IN (SELECT numeroAluno FROM Aluno);
 SELECT count(*) FROM Grupo WHERE idNumeroAluno1 NOT IN (SELECT numeroAluno FROM Aluno);
 SELECT count(*) FROM Grupo WHERE idNumeroAluno2 NOT IN (SELECT numeroAluno FROM Aluno);

BEGIN TRANSACTION VerificarNumAluno;
	 DELETE FROM AvaliacaoDisciplinaAluno WHERE idNumeroAluno NOT IN (SELECT numeroAluno FROM Aluno)
	 DELETE FROM Grupo WHERE idNumeroAluno1 NOT IN (SELECT numeroAluno FROM Aluno)
	 DELETE FROM Grupo WHERE idNumeroAluno2 NOT IN (SELECT numeroAluno FROM Aluno)

 SELECT count(*) FROM AvaliacaoDisciplinaAluno WHERE idNumeroAluno NOT IN (SELECT numeroAluno FROM Aluno);
 SELECT count(*) FROM Grupo WHERE idNumeroAluno1 NOT IN (SELECT numeroAluno FROM Aluno);
 SELECT count(*) FROM Grupo WHERE idNumeroAluno2 NOT IN (SELECT numeroAluno FROM Aluno);

 COMMIT TRANSACTION VerificarNumAluno;


-- idGrupo
 SELECT count(*) FROM TFC WHERE idGrupo NOT IN (SELECT id FROM Grupo)

BEGIN TRANSACTION VerificaridGrupo;

            DELETE FROM TFC WHERE idGrupo NOT IN (SELECT id FROM Grupo)

 SELECT count(*) FROM TFC WHERE idGrupo NOT IN (SELECT id FROM Grupo)

 COMMIT TRANSACTION VerificaridGrupo;


                