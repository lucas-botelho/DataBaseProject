-- <> create database <>
-------------------------
IF NOT EXISTS (SELECT name  FROM master.dbo.sysdatabases WHERE name = 'tfc')
BEGIN
    CREATE DATABASE tfc;
END;
GO

USE tfc;

-- <> create tables <> --
-------------------------
---- curso
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Curso')
BEGIN
	CREATE TABLE Curso (
		id BIGINT NULL,
		nome VARCHAR(255) NULL);
END;
---- tecnologia
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Tecnologia')
BEGIN
	CREATE TABLE Tecnologia (
		id BIGINT NULL,
		nome VARCHAR(255) NULL);
END;
---- disciplina
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Disciplina')
BEGIN
	CREATE TABLE Disciplina (
		id BIGINT NULL,
		cursoAssociado BIGINT NULL,
		nome VARCHAR(255) NULL);
END;
---- aluno
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Aluno')
BEGIN
	CREATE TABLE Aluno (
		id BIGINT NULL,
		curso VARCHAR(255) NULL,
		email VARCHAR(255) NULL,
		nome VARCHAR(255) NULL,
		numeroAluno VARCHAR(255) NULL,
		numeroContato INT NULL);
END;
---- avaliacao-disciplina-aluno
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'AvaliacaoDisciplinaAluno')
BEGIN
	CREATE TABLE AvaliacaoDisciplinaAluno (
		id BIGINT NULL,
		idNumeroAluno BIGINT NULL,
		idNumeroDisciplina BIGINT NULL,
		nota INT NULL);
END;
---- grupo
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Grupo')
BEGIN
	CREATE TABLE Grupo (
		id BIGINT NULL,
		confirmaAluno1 TINYINT NULL,
		confirmaAluno2 TINYINT NULL,
		idNumeroAluno1 VARCHAR(255) NULL,
		idNumeroAluno2 VARCHAR(255) NULL);
END;
---- utilizador
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Utilizador')
BEGIN
	CREATE TABLE Utilizador (
		id BIGINT NULL,
		coordenador TINYINT NULL,
		idIdentificacao VARCHAR(255) NULL,
		tipoUtilizador VARCHAR(255) NULL);
END;
---- inscricao
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Inscricao')
BEGIN
	CREATE TABLE Inscricao (
		id BIGINT NULL,
		estado VARCHAR(255) NULL,
		idNumeroGrupo BIGINT NULL,
		idTFC VARCHAR(255) NULL,
		numeroAluno VARCHAR(255) NULL,
		ordemEscolha INT NULL,
		registoDeInscricao DATETIME NULL,
		publicado TINYINT NULL,
		anoLetivo VARCHAR(255) NULL);
END;
---- professor-deisi
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'ProfessorDEISI')
BEGIN
	CREATE TABLE ProfessorDEISI (
		id BIGINT NULL,
		email VARCHAR(255) NULL,
		nome VARCHAR(255) NULL,
		numeroContato INT NULL,
		numeroProfessor VARCHAR(255) NULL);
END;
---- professor-n-deisi
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'ProfessorNDEISI')
BEGIN
	CREATE TABLE ProfessorNDEISI (
		id BIGINT NULL,
		departamentoAfeto VARCHAR(255) NULL,
		email VARCHAR(255) NULL,
		idProfessor VARCHAR(255) NULL,
		nome VARCHAR(255) NULL,
		numeroContato INT NULL);
END;
---- empresa-entidade-externa
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Empresa_EntidadeExterna')
BEGIN
	CREATE TABLE Empresa_EntidadeExterna (
		id BIGINT NULL,
		email VARCHAR(255) NULL,
		idEmpresa VARCHAR(255) NULL,
		interlocutor VARCHAR(255) NULL,
		morada VARCHAR(255) NULL,
		nome VARCHAR(255) NULL,
		numeroContato INT NULL);
END;
---- tfc
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'TFC')
BEGIN
	CREATE TABLE TFC (
		id BIGINT NULL,
		titulo VARCHAR(255) NULL,
		anoletivo VARCHAR(255) NULL,
		avaliacaoProposta VARCHAR(255) NULL,
		coorientador VARCHAR(255) NULL,
		dataEstado VARCHAR(255) NULL,
		dataProposta VARCHAR(255) NULL,
		descricao TEXT NULL,
		entidade BIGINT NULL,
		estado VARCHAR(255) NULL,
		idGrupo BIGINT NULL,
		idtfc VARCHAR(255) NULL,
		motivoRecusa VARCHAR(255) NULL,
		numeroInscricoes INT NULL,
		orientador VARCHAR(255) NULL,
		orientadorProposto VARCHAR(255) NULL,
		preponente VARCHAR(255) NULL,
		semestre INT NULL,
		tecnologias VARCHAR(255) NULL);
END;
---- tfc-curso
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'TFCCurso')
BEGIN
	CREATE TABLE TFCCurso (
		id BIGINT NULL,
		idCurso BIGINT NULL,
		idTFC BIGINT NULL);
END;
---- tfc-tecnologia
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'TFCTecnologia')
BEGIN
	CREATE TABLE TFCTecnologia (
		id BIGINT NULL,
		idTFC BIGINT NULL,
		idTecnologia BIGINT NULL);
END;
---- tfc-disciplina
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'TFCDisciplina')
BEGIN
	CREATE TABLE TFCDisciplina (
		id BIGINT NULL,
		idNumeroDisciplina BIGINT NULL,
		numeroTFC BIGINT NULL);
END;
---- historico-tfc
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'HistoricoTFC')
BEGIN
	CREATE TABLE HistoricoTFC (
		id BIGINT NULL,
		avaliacao VARCHAR(255) NULL,
		dataMudancaEstado VARCHAR(255) NULL,
		estado VARCHAR(255) NULL,
		idTFC VARCHAR(255) NULL,
		idTFCNumerico BIGINT NULL,
		utilizador VARCHAR(255) NULL);
END;

GO

-- limpar BD

--curso
select count(*) from Curso WHERE id IS NULL or nome IS NULL; 
DELETE FROM Curso WHERE nome IS NULL or id IS NULL;
select count(*) from Curso WHERE id IS NULL or nome IS NULL; 
--tecnologia
select count(*) from Tecnologia WHERE id IS NULL or nome IS NULL; 
DELETE FROM Tecnologia WHERE nome IS NULL or id IS NULL;
select count(*) from Tecnologia WHERE id IS NULL or nome IS NULL; 
--disciplina
select count(*) from Disciplina WHERE id IS NULL or cursoAssociado is null or nome IS NULL; 
DELETE FROM Disciplina WHERE id IS NULL or cursoAssociado is null or nome IS NULL; 
select count(*) from Disciplina WHERE id IS NULL or cursoAssociado is null or nome IS NULL; 
--aluno
select count(*) from Aluno WHERE id IS NULL or nome is null or numeroAluno IS NULL; 
DELETE FROM Aluno WHERE id IS NULL or nome is null or numeroAluno IS NULL; 
select count(*) from Aluno WHERE id IS NULL or nome is null or numeroAluno IS NULL; 
--avaliacaodisciplinaaluno
select count(*) from AvaliacaoDisciplinaAluno WHERE id IS NULL or idNumeroAluno is null or idNumeroDisciplina IS NULL or nota IS NULL; 
DELETE FROM AvaliacaoDisciplinaAluno WHERE id IS NULL or idNumeroAluno is null or idNumeroDisciplina IS NULL or nota IS NULL; 
select count(*) from AvaliacaoDisciplinaAluno WHERE id IS NULL or idNumeroAluno is null or idNumeroDisciplina IS NULL or nota IS NULL; 
--tfcdisciplina
select count(*) from TFCDisciplina WHERE id IS NULL or idNumeroDisciplina is null or numeroTFC is null; 
DELETE FROM TFCDisciplina WHERE id IS NULL or idNumeroDisciplina is null or numeroTFC is null; 
select count(*) from TFCDisciplina WHERE id IS NULL or idNumeroDisciplina is null or numeroTFC is null; 
--tfctecnologia
select count(*) from TFCTecnologia WHERE id IS NULL or idTFC is null or idTecnologia is null; 
DELETE FROM  TFCTecnologia WHERE id IS NULL or idTFC is null or idTecnologia is null; 
select count(*) from TFCTecnologia WHERE id IS NULL or idTFC is null or idTecnologia is null; 
--tfccurso
select count(*) from TFCCurso WHERE id IS NULL or idTFC is null or idCurso is null; 
DELETE FROM  TFCCurso WHERE id IS NULL or idTFC is null or idCurso is null; 
select count(*) from TFCCurso WHERE id IS NULL or idTFC is null or idCurso is null; 
--inscricao
select count(*) from Inscricao WHERE id IS NULL or idTFC is null;
DELETE FROM  Inscricao WHERE id IS NULL or idTFC is null;
select count(*) from Inscricao WHERE id IS NULL or idTFC is null;
--historicotfc
select count(*) from HistoricoTFC WHERE id IS NULL or idTFC is null OR estado is null or idTFCNumerico IS NULL OR utilizador IS NULL;
DELETE FROM  HistoricoTFC WHERE id IS NULL or idTFC is null OR estado is null or idTFCNumerico IS NULL OR utilizador IS NULL;
select count(*) from HistoricoTFC WHERE id IS NULL or idTFC is null OR estado is null or idTFCNumerico IS NULL OR utilizador IS NULL;
--grupo
select count(*) from Grupo WHERE id IS NULL or confirmaAluno1 is null OR idNumeroAluno1 is null;
DELETE FROM Grupo WHERE id IS NULL or confirmaAluno1 is null OR idNumeroAluno1 is null;
select count(*) from Grupo WHERE id IS NULL or confirmaAluno1 is null OR idNumeroAluno1 is null;
--tfc
select count(*) from TFC WHERE id IS NULL ;
DELETE FROM TFC WHERE id IS NULL ;
select count(*) from  TFC WHERE id IS NULL ;
--professorndeisi
select count(*) from ProfessorNDEISI WHERE id IS NULL or departamentoAfeto IS NULL or email  IS NULL or numeroContato IS NULL or nome IS NULL;
DELETE FROM ProfessorNDEISI WHERE id IS NULL or departamentoAfeto IS NULL or email  IS NULL or numeroContato IS NULL or nome IS NULL;
select count(*) from ProfessorNDEISI WHERE id IS NULL or departamentoAfeto IS NULL or email  IS NULL or numeroContato IS NULL or nome IS NULL;
--professordeisi
select count(*) from ProfessorDEISI WHERE id IS NULL or nome IS NULL or numeroProfessor  IS NULL ;
DELETE FROM ProfessorDEISI WHERE id IS NULL or nome IS NULL or numeroProfessor  IS NULL ;
select count(*) from ProfessorDEISI WHERE id IS NULL or nome IS NULL or numeroProfessor  IS NULL ;
--empresa
select count(*) from Empresa_EntidadeExterna WHERE id IS NULL or nome IS NULL ;
DELETE FROM Empresa_EntidadeExterna WHERE id IS NULL or nome IS NULL ;
select count(*) from Empresa_EntidadeExterna WHERE id IS NULL or nome IS NULL ;
--utilizador
select count(*) from Utilizador WHERE id IS NULL ;
DELETE FROM Utilizador WHERE id IS NULL;
select count(*) from Utilizador WHERE id IS NULL ;


--alter tables para meter not nulls
BEGIN TRY
    BEGIN TRANSACTION;
		ALTER TABLE Curso ALTER COLUMN id bigint NOT NULL;
		ALTER TABLE Curso ALTER COLUMN nome VARCHAR(255) NOT NULL;

		ALTER TABLE Tecnologia ALTER COLUMN id BIGINT NOT NULL;
		ALTER TABLE Tecnologia ALTER COLUMN nome VARCHAR(255) NOT NULL;

		ALTER TABLE Disciplina ALTER COLUMN id BIGINT NOT NULL;
		ALTER TABLE Disciplina ALTER COLUMN cursoAssociado BIGINT NOT NULL;
		ALTER TABLE Disciplina ALTER COLUMN nome VARCHAR(255) NOT NULL;

		ALTER TABLE Aluno ALTER COLUMN id BIGINT NOT NULL;
		ALTER TABLE Aluno ALTER COLUMN nome VARCHAR(255) NOT NULL;
		ALTER TABLE Aluno ALTER COLUMN numeroAluno varchar(255) NOT NULL;

		ALTER TABLE AvaliacaoDisciplinaAluno ALTER COLUMN id bigint NOT NULL;
		ALTER TABLE AvaliacaoDisciplinaAluno ALTER COLUMN idNumeroAluno bigint NOT NULL;
		ALTER TABLE AvaliacaoDisciplinaAluno ALTER COLUMN idNumeroDisciplina bigint NOT NULL;
		ALTER TABLE AvaliacaoDisciplinaAluno ALTER COLUMN nota int NOT NULL;

		--tfcdisciplina
		ALTER TABLE TFCDisciplina ALTER COLUMN id bigint NOT NULL;
		ALTER TABLE TFCDisciplina ALTER COLUMN idNumeroDisciplina bigint NOT NULL;
		ALTER TABLE TFCDisciplina ALTER COLUMN numeroTFC bigint NOT NULL;

		--tfctecnologia
		ALTER TABLE TFCTecnologia ALTER COLUMN id bigint NOT NULL;
		ALTER TABLE TFCTecnologia ALTER COLUMN idTFC bigint NOT NULL;
		ALTER TABLE TFCTecnologia ALTER COLUMN idTecnologia bigint NOT NULL;

		--tfccurso
		ALTER TABLE TFCCurso ALTER COLUMN id bigint NOT NULL;
		ALTER TABLE TFCCurso ALTER COLUMN idTFC bigint NOT NULL;
		ALTER TABLE TFCCurso ALTER COLUMN idCurso bigint NOT NULL;

		ALTER TABLE Utilizador ALTER COLUMN id bigint NOT NULL;

		ALTER TABLE Inscricao ALTER COLUMN id BIGINT NOT NULL;
		ALTER TABLE Inscricao ALTER COLUMN idTFC varchar(255) NOT NULL;

		ALTER TABLE HistoricoTFC ALTER COLUMN id BIGINT NOT NULL;
		ALTER TABLE HistoricoTFC ALTER COLUMN idTFC VARCHAR(255) NOT NULL;
		ALTER TABLE HistoricoTFC ALTER COLUMN estado VARCHAR(255) NOT NULL;
		ALTER TABLE HistoricoTFC ALTER COLUMN idTFCNumerico BIGINT NOT NULL;
		ALTER TABLE HistoricoTFC ALTER COLUMN utilizador VARCHAR(255) NOT NULL;

		ALTER TABLE Grupo ALTER COLUMN id BIGINT NOT NULL;
		ALTER TABLE Grupo ALTER COLUMN confirmaAluno1 TINYINT NOT NULL;
		ALTER TABLE Grupo ALTER COLUMN idNumeroAluno1 VARCHAR(255) NOT NULL;

		ALTER TABLE TFC ALTER COLUMN id BIGINT NOT NULL;

		ALTER TABLE ProfessorNDEISI ALTER COLUMN id BIGINT NOT NULL;
		ALTER TABLE ProfessorNDEISI ALTER COLUMN departamentoAfeto VARCHAR(255) NOT NULL;
		ALTER TABLE ProfessorNDEISI ALTER COLUMN email VARCHAR(255) NOT NULL;
		ALTER TABLE ProfessorNDEISI ALTER COLUMN nome VARCHAR(255) NOT NULL;
		ALTER TABLE ProfessorNDEISI ALTER COLUMN numeroContato INT NOT NULL;

		ALTER TABLE ProfessorDEISI ALTER COLUMN id BIGINT NOT NULL;
		ALTER TABLE ProfessorDEISI ALTER COLUMN nome VARCHAR(255) NOT NULL;
		ALTER TABLE ProfessorDEISI ALTER COLUMN numeroProfessor VARCHAR(255) NOT NULL;

		ALTER TABLE Empresa_EntidadeExterna ALTER COLUMN id BIGINT NOT NULL;
		ALTER TABLE Empresa_EntidadeExterna ALTER COLUMN nome VARCHAR(255) NOT NULL;
		COMMIT TRANSACTION; 
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;
END CATCH;

GO
--3 criar indices

---- curso
IF NOT EXISTS (
    SELECT *
    FROM sys.indexes
    WHERE name = 'index_curso_id' AND object_id = OBJECT_ID('Curso') or
		  name = 'index_curso_nome' AND object_id = OBJECT_ID('Curso')		
)
BEGIN
    CREATE INDEX index_curso_id ON Curso(id);
	CREATE INDEX index_curso_nome ON Curso(nome);
END;
---- tecnologia
IF NOT EXISTS (
    SELECT *
    FROM sys.indexes
    WHERE name = 'index_tecnologia_id' AND object_id = OBJECT_ID('Tecnologia') or
		  name = 'index_tecnologia_nome' AND object_id = OBJECT_ID('Tecnologia')		
)
BEGIN
    CREATE INDEX index_tecnologia_id ON Tecnologia(id);
	CREATE INDEX index_tecnologia_nome ON Tecnologia(nome);
END;
---- disciplina
IF NOT EXISTS (
    SELECT *
    FROM sys.indexes
    WHERE name = 'index_disciplina_id' AND object_id = OBJECT_ID('Disciplina') or
		  name = 'index_disciplina_curso_associado' AND object_id = OBJECT_ID('Disciplina')	or
		  name = 'index_disciplina_nome' AND object_id = OBJECT_ID('Disciplina')
)
BEGIN
    CREATE INDEX index_disciplina_id ON Disciplina(id);
	CREATE INDEX index_disciplina_curso_associado ON Disciplina(cursoAssociado);
	CREATE INDEX index_disciplina_nome ON Disciplina(nome);
END;
---- tfccurso
IF NOT EXISTS (
    SELECT *
    FROM sys.indexes
    WHERE name = 'index_tfc_curso_id' AND object_id = OBJECT_ID('TFCCurso') or
		  name = 'index_tfc_curso_idCurso' AND object_id = OBJECT_ID('TFCCurso') or
		  name = 'index_tfc_curso_idTfc' AND object_id = OBJECT_ID('TFCCurso')
)
BEGIN
    CREATE INDEX index_tfc_curso_id ON TFCCurso(id);
	CREATE INDEX index_tfc_curso_idCurso ON TFCCurso(idCurso);
	CREATE INDEX index_tfc_curso_idTfc ON TFCCurso(idTFC);
END;
---- tfctecnologia
IF NOT EXISTS (
    SELECT *
    FROM sys.indexes
    WHERE name = 'index_tfc_tecnologia_id' AND object_id = OBJECT_ID('TFCTecnologia') or
		  name = 'index_tfc_tecnologia_idTFC' AND object_id = OBJECT_ID('TFCTecnologia') or
		  name = 'index_tfc_tecnologia_idTecnologia' AND object_id = OBJECT_ID('TFCTecnologia')
)
BEGIN
    CREATE INDEX index_tfc_tecnologia_id ON TFCTecnologia(id);
	CREATE INDEX index_tfc_tecnologia_idTFC ON TFCTecnologia(idTFC);
	CREATE INDEX index_tfc_tecnologia_idTecnologia ON TFCTecnologia(idTecnologia);
END;
---- tfcdisciplina
IF NOT EXISTS (
    SELECT *
    FROM sys.indexes
    WHERE name = 'index_tfc_disciplina_id' AND object_id = OBJECT_ID('TFCDisciplina') or
		  name = 'index_tfc_disciplina_idNumeroDisciplina' AND object_id = OBJECT_ID('TFCDisciplina') or
		  name = 'index_tfc_disciplina_numeroTFC' AND object_id = OBJECT_ID('TFCDisciplina')
)
BEGIN
    CREATE INDEX index_tfc_disciplina_id ON TFCDisciplina(id);
	CREATE INDEX index_tfc_disciplina_idNumeroDisciplina ON TFCDisciplina(idNumeroDisciplina);
	CREATE INDEX index_tfc_disciplina_numeroTFC ON TFCDisciplina(numeroTFC);
END;
---- avalicao disciplina aluno
IF NOT EXISTS (
    SELECT *
    FROM sys.indexes
    WHERE name = 'index_avaliacao_disciplina_aluno_id' AND object_id = OBJECT_ID('AvaliacaoDisciplinaAluno') or
		  name = 'index_avaliacao_disciplina_aluno_idNumeroAluno' AND object_id = OBJECT_ID('AvaliacaoDisciplinaAluno') or
		  name = 'index_avaliacao_disciplina_aluno_idNumeroDisciplina' AND object_id = OBJECT_ID('AvaliacaoDisciplinaAluno') or
		  name = 'index_avaliacao_disciplina_aluno_nota' AND object_id = OBJECT_ID('AvaliacaoDisciplinaAluno')
)
BEGIN
    CREATE INDEX index_avaliacao_disciplina_aluno_id ON AvaliacaoDisciplinaAluno(id);
	CREATE INDEX index_avaliacao_disciplina_aluno_idNumeroAluno ON AvaliacaoDisciplinaAluno(idNumeroAluno);
	CREATE INDEX index_avaliacao_disciplina_aluno_idNumeroDisciplina ON AvaliacaoDisciplinaAluno(idNumeroDisciplina);
	CREATE INDEX index_avaliacao_disciplina_aluno_nota ON AvaliacaoDisciplinaAluno(nota);
END;
---- aluno
IF NOT EXISTS (
    SELECT *
    FROM sys.indexes
    WHERE name = 'index_aluno_id' AND object_id = OBJECT_ID('Aluno') or
		  name = 'index_aluno_nome' AND object_id = OBJECT_ID('Aluno') or
		  name = 'index_aluno_numeroAluno' AND object_id = OBJECT_ID('Aluno')
)
BEGIN
    CREATE INDEX index_aluno_id ON Aluno(id);
	CREATE INDEX index_aluno_nome ON Aluno(nome);
	CREATE INDEX index_aluno_numeroAluno ON Aluno(numeroAluno);
END;
---- inscricao
IF NOT EXISTS (
    SELECT *
    FROM sys.indexes
    WHERE name = 'index_inscricao_id' AND object_id = OBJECT_ID('Inscricao') or
		  name = 'index_inscricao_idTFC' AND object_id = OBJECT_ID('Inscricao')
)
BEGIN
    CREATE INDEX index_inscricao_id ON Inscricao(id);
	CREATE INDEX index_inscricao_idTFC ON Inscricao(idTFC);
END;
---- historico tfc
IF NOT EXISTS (
    SELECT *
    FROM sys.indexes
    WHERE name = 'index_historico_tfc_id' AND object_id = OBJECT_ID('HistoricoTFC') or
		  name = 'index_historico_tfc_estado' AND object_id = OBJECT_ID('HistoricoTFC') or
		  name = 'index_historico_tfc_idTFC' AND object_id = OBJECT_ID('HistoricoTFC') or
		  name = 'index_historico_tfc_idTFCNumerico' AND object_id = OBJECT_ID('HistoricoTFC') or
		  name = 'index_historico_tfc_utilizador' AND object_id = OBJECT_ID('HistoricoTFC')
)
BEGIN
    CREATE INDEX index_historico_tfc_id ON HistoricoTFC(id);
	CREATE INDEX index_historico_tfc_estado ON HistoricoTFC(estado);
	CREATE INDEX index_historico_tfc_idTFC ON HistoricoTFC(idTFC);
	CREATE INDEX index_historico_tfc_idTFCNumerico ON HistoricoTFC(idTFCNumerico);
	CREATE INDEX index_historico_tfc_utilizador ON HistoricoTFC(utilizador);
END;
---- grupo
IF NOT EXISTS (
    SELECT *
    FROM sys.indexes
    WHERE name = 'index_grupo_id' AND object_id = OBJECT_ID('Grupo') or
		  name = 'index_grupo_confirmaAluno1' AND object_id = OBJECT_ID('Grupo') or
		  name = 'index_grupo_idNumeroAluno1' AND object_id = OBJECT_ID('Grupo')
)
BEGIN
    CREATE INDEX index_grupo_id ON Grupo(id);
	CREATE INDEX index_grupo_confirmaAluno1 ON Grupo(confirmaAluno1);
	CREATE INDEX index_grupo_idNumeroAluno1 ON Grupo(idNumeroAluno1);
END;

---- tfc
IF NOT EXISTS (
    SELECT *
    FROM sys.indexes
    WHERE name = 'index_tfc_id' AND object_id = OBJECT_ID('TFC') 
)
BEGIN
    CREATE INDEX index_tfc_id ON TFC(id);
END;

---- ProfessorNDEISI
IF NOT EXISTS (
    SELECT *
    FROM sys.indexes
    WHERE name = 'index_professorndeisi_id' AND object_id = OBJECT_ID('ProfessorNDEISI')  or
		  name = 'index_professorndeisi_departamentoafeto' AND object_id = OBJECT_ID('ProfessorNDEISI')  or
		  name = 'index_professorndeisi_email' AND object_id = OBJECT_ID('ProfessorNDEISI')  or
		  name = 'index_professorndeisi_nome' AND object_id = OBJECT_ID('ProfessorNDEISI')  or
		  name = 'index_professorndeisi_numContacto' AND object_id = OBJECT_ID('ProfessorNDEISI') 
)
BEGIN
    CREATE INDEX index_professorndeisi_id ON ProfessorNDEISI(id);
    CREATE INDEX index_professorndeisi_departamentoafeto ON ProfessorNDEISI(departamentoAfeto);
    CREATE INDEX index_professorndeisi_email ON ProfessorNDEISI(email);
    CREATE INDEX index_professorndeisi_nome ON ProfessorNDEISI(nome);
    CREATE INDEX index_professorndeisi_numContacto ON ProfessorNDEISI(numeroContato);
END;

---- EntidadeEmpresa
IF NOT EXISTS (
    SELECT *
    FROM sys.indexes
    WHERE name = 'index_EntidadeEmpresa_id' AND object_id = OBJECT_ID('Empresa_EntidadeExterna')  or
		  name = 'index_EntidadeEmpresa_nome' AND object_id = OBJECT_ID('Empresa_EntidadeExterna')
)
BEGIN
    CREATE INDEX index_EntidadeEmpresa_id ON Empresa_EntidadeExterna(id);
    CREATE INDEX index_EntidadeEmpresa_nome ON Empresa_EntidadeExterna(nome);
END;

---- ProfessorDEISI
IF NOT EXISTS (
    SELECT *
    FROM sys.indexes
    WHERE name = 'index_professorndeisi_id' AND object_id = OBJECT_ID('ProfessorDEISI')  or
		  name = 'index_professorndeisi_nome' AND object_id = OBJECT_ID('ProfessorDEISI')  or
		  name = 'index_professorndeisi_numProfessor' AND object_id = OBJECT_ID('ProfessorDEISI') 
)
BEGIN
    CREATE INDEX index_professorndeisi_id ON ProfessorDEISI(id);
    CREATE INDEX index_professorndeisi_email ON ProfessorDEISI(email);
    CREATE INDEX index_professorndeisi_numProfessor ON ProfessorDEISI(numeroContato);
END;

---- Utilizador
IF NOT EXISTS (
    SELECT *
    FROM sys.indexes
    WHERE name = 'index_Utilizador_id' AND object_id = OBJECT_ID('Utilizador')
)
BEGIN
    CREATE INDEX index_Utilizador_id ON Utilizador(id);
END;

GO

--4.1 e 4.2

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
--contagem de errados 628
SELECT count(estado) FROM Inscricao WHERE estado NOT IN ('Aguarda Atribuição', 'Atribuído', 'Não Atribuído', 'Atribuído', 'Anulado') OR estado IS NULL;
--contagem de certos 633
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

GO

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

-- Adiciona a coluna temporária
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TFC' AND COLUMN_NAME = 'id_temp')
BEGIN
    ALTER TABLE TFC
    ADD id_temp INT NULL;
END;

GO

INSERT INTO TFC VALUES
(999, 'TFC1', 'Ano1', 'Avaliacao1', 'Coorientador1', '2023-01-01', '2023-01-15', 'Descrição1', 1, 'Estado1', 1, 'IDTFC3', 'Motivo1', 5, 'Orientador1', 'OrientadorProposto1', 'Preponente1', 1, 'Tecnologias1', NULL),
(999, 'TFC2', 'Ano2', 'Avaliacao2', 'Coorientador2', '2023-02-01', '2023-02-15', 'Descrição2', 2, 'Estado2', 2, 'IDTFC3', 'Motivo2', 7, 'Orientador2', 'OrientadorProposto2', 'Preponente2', 2, 'Tecnologias2', NULL),
(999, 'TFC3', 'Ano3', 'Avaliacao3', 'Coorientador3', '2023-03-01', '2023-03-15', 'Descrição3', 3, 'Estado3', 3, 'IDTFC3', 'Motivo3', 8, 'Orientador3', 'OrientadorProposto3', 'Preponente3', 1, 'Tecnologias3', NULL),
(999, 'TFC4', 'Ano4', 'Avaliacao4', 'Coorientador4', '2023-04-01', '2023-04-15', 'Descrição4', 4, 'Estado4', 4, 'IDTFC4', 'Motivo4', 10, 'Orientador4', 'OrientadorProposto4', 'Preponente4', 2, 'Tecnologias4', NULL),
(999, 'TFC5', 'Ano5', 'Avaliacao5', 'Coorientador5', '2023-05-01', '2023-05-15', 'Descrição5', 5, 'Estado5', 5, 'IDTFC4', 'Motivo5', 12, 'Orientador5', 'OrientadorProposto5', 'Preponente5', 2, 'Tecnologias5', NULL);

SELECT idtfc AS NumRepetidos FROM TFC GROUP BY idtfc HAVING COUNT(idtfc) > 1;

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
SELECT * FROM TFC WHERE idtfc like 'IDTFC%' --Garantir que os dados de teste foram apagados

-- Aluno
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Aluno' AND COLUMN_NAME = 'id_temp')
BEGIN
    ALTER TABLE Aluno
    ADD id_temp INT;
END;

GO

SELECT numeroAluno, COUNT(numeroAluno) AS NumRepetidos FROM Aluno GROUP BY numeroAluno HAVING COUNT(numeroAluno) > 1;

BEGIN TRANSACTION RemoveDuplicates;

	DECLARE @counterAluno INT = 1;

	UPDATE Aluno
	SET @counterAluno = id_temp = @counterAluno + 1;

	DELETE t1
	FROM Aluno t1
	JOIN Aluno t2 ON t1.numeroAluno = t2.numeroAluno AND t1.id_temp < t2.id_temp;

	SELECT numeroAluno AS NumRepetidos FROM Aluno GROUP BY numeroAluno HAVING COUNT(numeroAluno) > 1;

COMMIT TRANSACTION RemoveDuplicates;


-- ProfessorDEISI
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'ProfessorDEISI' AND COLUMN_NAME = 'id_temp')
BEGIN
    ALTER TABLE ProfessorDEISI
    ADD id_temp INT;
END;

GO

BEGIN TRANSACTION RemoveDuplicatesProfessorDEISI;
DECLARE @counterProfessorDEISI INT = 1;

	UPDATE ProfessorDEISI
	SET @counterProfessorDEISI = id_temp = @counterProfessorDEISI + 1;

	DELETE t1
	FROM ProfessorDEISI t1
	JOIN ProfessorDEISI t2 ON t1.numeroProfessor = t2.numeroProfessor AND t1.id_temp < t2.id_temp;
	
	SELECT numeroProfessor AS NumRepetidos FROM ProfessorDEISI GROUP BY numeroProfessor HAVING COUNT(numeroProfessor) > 1;

COMMIT TRANSACTION RemoveDuplicatesProfessorDEISI;


-- ProfessorNDEISI
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'ProfessorNDEISI' AND COLUMN_NAME = 'id_temp')
BEGIN
    ALTER TABLE ProfessorNDEISI
    ADD id_temp INT;
END;

GO
BEGIN TRANSACTION RemoveDuplicatesProfessorNDEISI;

DECLARE @counterProfessorNDEISI INT = 1;
	UPDATE ProfessorNDEISI
	SET @counterProfessorNDEISI = id_temp = @counterProfessorNDEISI + 1;

	DELETE t1
	FROM ProfessorNDEISI t1
	JOIN ProfessorNDEISI t2 ON t1.idProfessor = t2.idProfessor AND t1.id_temp < t2.id_temp;

	SELECT idProfessor AS NumRepetidos FROM ProfessorNDEISI GROUP BY idProfessor HAVING COUNT(idProfessor) > 1;

COMMIT TRANSACTION RemoveDuplicatesProfessorNDEISI;


-- Grupo
--alunos que estao repetidos no grupo e numero de vezes repetidas
SELECT idNumeroAluno, COUNT(*) AS NumRepetidos FROM ( SELECT idNumeroAluno1 AS idNumeroAluno FROM Grupo UNION ALL SELECT idNumeroAluno2 AS idNumeroAluno FROM Grupo ) AS Alunos GROUP BY idNumeroAluno HAVING COUNT(*) > 1;

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Grupo' AND COLUMN_NAME = 'id_temp')
BEGIN
    ALTER TABLE Grupo
    ADD id_temp INT;
END;

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'TempDuplicadosGrupo')
BEGIN
    -- Create a temporary table
	CREATE TABLE TempDuplicadosGrupo (
		idNumeroAluno VARCHAR(255),
		Count INT
	);
END;
GO

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

--drop tabela temporaria
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'TempDuplicadosGrupo')
BEGIN
    DROP TABLE TempDuplicadosGrupo;
END;


--5.3.1
-- Valida Inscricao
SELECT count(*) FROM Inscricao WHERE idTFC NOT IN (SELECT idTFC FROM TFC);
-- Valida HistoricoTFC
SELECT count(*) FROM HistoricoTFC WHERE idTFC NOT IN (SELECT idTFC FROM TFC);

BEGIN TRANSACTION VerificarCoerenciaIdTFC;

	DELETE FROM Inscricao WHERE idTFC NOT IN (SELECT idTFC FROM TFC);
	DELETE FROM HistoricoTFC WHERE idTFC NOT IN (SELECT idTFC FROM TFC);

-- Valida Inscricao
SELECT count(*) FROM Inscricao WHERE idTFC NOT IN (SELECT idTFC FROM TFC);
-- Valida HistoricoTFC
SELECT count(*) FROM HistoricoTFC WHERE idTFC NOT IN (SELECT idTFC FROM TFC);

COMMIT TRANSACTION VerificarCoerencia;

GO


--5.3.2
SELECT
    (SELECT COUNT(*) FROM TFC WHERE orientador NOT IN (SELECT numeroProfessor FROM ProfessorDEISI)) AS NotInCount,
    (SELECT COUNT(*) FROM TFC WHERE orientador IS NULL) AS NullCount;

SELECT
    (SELECT COUNT(*) FROM TFC WHERE orientadorProposto NOT IN (SELECT numeroProfessor FROM ProfessorDEISI)) AS NotInCount,
    (SELECT COUNT(*) FROM TFC WHERE orientadorProposto IS NULL) AS NullCount;

BEGIN TRANSACTION VerificarNumeroProfessor;
    DELETE FROM TFC WHERE orientador NOT IN (SELECT numeroProfessor FROM ProfessorDEISI) or orientador IS NULL;
    DELETE FROM TFC WHERE orientadorProposto NOT IN (SELECT numeroProfessor FROM ProfessorDEISI) or orientadorProposto IS NULL;

	SELECT
		(SELECT COUNT(*) FROM TFC WHERE orientador NOT IN (SELECT numeroProfessor FROM ProfessorDEISI)) AS NotInCount,
		(SELECT COUNT(*) FROM TFC WHERE orientador IS NULL) AS NullCount;

	SELECT
		(SELECT COUNT(*) FROM TFC WHERE orientadorProposto NOT IN (SELECT numeroProfessor FROM ProfessorDEISI)) AS NotInCount,
		(SELECT COUNT(*) FROM TFC WHERE orientadorProposto IS NULL) AS NullCount;

 COMMIT TRANSACTION VerificarNumeroProfessor;

 GO 

 SELECT COUNT(*) FROM Inscricao WHERE idTFC NOT IN (SELECT idTFC FROM TFC); --579 inscricoes que nao existem em TFC
 SELECT COUNT(*) FROM HistoricoTFC WHERE idTFC NOT IN (SELECT idTFC FROM TFC); --439 HistoricoTFC que nao existem em TFC

 BEGIN TRANSACTION LimparDependentesTFC;
    DELETE FROM Inscricao WHERE idTFC NOT IN (SELECT idTFC FROM TFC);
    DELETE FROM HistoricoTFC WHERE idTFC NOT IN (SELECT idTFC FROM TFC);

	 SELECT COUNT(*) FROM Inscricao WHERE idTFC NOT IN (SELECT idTFC FROM TFC); --0 inscricoes que nao existem em TFC
	 SELECT COUNT(*) FROM HistoricoTFC WHERE idTFC NOT IN (SELECT idTFC FROM TFC); --0 HistoricoTFC que nao existem em TFC

COMMIT TRANSACTION LimparDependentesTFC;


GO

--5.3.3 Todas as referências a alunos têm que existir em [Aluno].[numeroAluno]
--		mesmo com identificação de grupo e [Grupo].[id] 
/*SELECT
    (SELECT COUNT(*) FROM AvaliacaoDisciplinaAluno WHERE idNumeroAluno NOT IN (SELECT numeroAluno FROM Aluno)) AS NotInCount,
    (SELECT COUNT(*) FROM AvaliacaoDisciplinaAluno WHERE idNumeroAluno IS NULL) AS NullCount;
*/
--Validar onde e que os numeros de aluno estao mal
SELECT
    (SELECT COUNT(*) FROM Inscricao WHERE numeroAluno NOT IN (SELECT numeroAluno FROM Aluno)) AS NotInCount,
    (SELECT COUNT(*) FROM Inscricao WHERE numeroAluno IS NULL) AS NullCount;

SELECT
    (SELECT COUNT(*) FROM Grupo WHERE idNumeroAluno1 NOT IN (SELECT numeroAluno FROM Aluno)) AS NotInCount,
    (SELECT COUNT(*) FROM Grupo WHERE idNumeroAluno1 IS NULL) AS NullCount;

SELECT
    (SELECT COUNT(*) FROM Grupo WHERE idNumeroAluno2 NOT IN (SELECT numeroAluno FROM Aluno)) AS NotInCount,
    (SELECT COUNT(*) FROM Grupo WHERE idNumeroAluno2 IS NULL) AS NullCount;


--Apagar referencias a alunos que estao mal
BEGIN TRANSACTION VerificarNumeroAluno;
    DELETE FROM Inscricao WHERE numeroAluno NOT IN (SELECT numeroAluno FROM Aluno) or numeroAluno IS NULL;
    DELETE FROM Grupo WHERE idNumeroAluno1 NOT IN (SELECT numeroAluno FROM Aluno) or idNumeroAluno1 IS NULL;
    DELETE FROM Grupo WHERE idNumeroAluno2 NOT IN (SELECT numeroAluno FROM Aluno) or idNumeroAluno2 IS NULL;

	SELECT
		(SELECT COUNT(*) FROM Inscricao WHERE numeroAluno NOT IN (SELECT numeroAluno FROM Aluno)) AS NotInCount,
		(SELECT COUNT(*) FROM Inscricao WHERE numeroAluno IS NULL) AS NullCount;

	SELECT
		(SELECT COUNT(*) FROM Grupo WHERE idNumeroAluno1 NOT IN (SELECT numeroAluno FROM Aluno)) AS NotInCount,
		(SELECT COUNT(*) FROM Grupo WHERE idNumeroAluno1 IS NULL) AS NullCount;

	SELECT
		(SELECT COUNT(*) FROM Grupo WHERE idNumeroAluno2 NOT IN (SELECT numeroAluno FROM Aluno)) AS NotInCount,
		(SELECT COUNT(*) FROM Grupo WHERE idNumeroAluno2 IS NULL) AS NullCount;

 COMMIT TRANSACTION VerificarNumeroAluno;


SELECT
	(SELECT count(*) FROM TFC WHERE idGrupo NOT IN (SELECT id FROM Grupo)) AS NotInCount,
	(SELECT count(*) FROM TFC WHERE idGrupo is null) AS NullCount;

SELECT
	(SELECT count(*) FROM Inscricao WHERE idNumeroGrupo NOT IN (SELECT id FROM Grupo)) AS NotInCount,
	(SELECT count(*) FROM Inscricao WHERE idNumeroGrupo is null) AS NullCount;

	--Apagar tfcs e inscricoes que nao tenham grupos validos
BEGIN TRANSACTION VerificarNumeroAluno;
    DELETE FROM TFC WHERE idGrupo NOT IN (SELECT id FROM Grupo) or idGrupo IS NULL;
    DELETE FROM Inscricao WHERE idNumeroGrupo NOT IN (SELECT id FROM Grupo) or idNumeroGrupo IS NULL;

	SELECT
		(SELECT count(*) FROM TFC WHERE idGrupo NOT IN (SELECT id FROM Grupo)) AS NotInCount,
		(SELECT count(*) FROM TFC WHERE idGrupo is null) AS NullCount;

	SELECT
		(SELECT count(*) FROM Inscricao WHERE idNumeroGrupo NOT IN (SELECT id FROM Grupo)) AS NotInCount,
		(SELECT count(*) FROM Inscricao WHERE idNumeroGrupo is null) AS NullCount;

 COMMIT TRANSACTION VerificarNumeroAluno;