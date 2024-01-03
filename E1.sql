-- <> create database <> --
---------------------------
---------------------------
---------------------------
---------------------------
IF NOT EXISTS (SELECT name  FROM master.dbo.sysdatabases WHERE name = 'tfc')
BEGIN
    CREATE DATABASE tfc;
END;
GO

USE tfc;

-- <> create tables <> --
-------------------------
-------------------------
-------------------------
-------------------------
---- [curso]
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Curso')
BEGIN
	CREATE TABLE Curso (
		id BIGINT NULL,
		nome VARCHAR(255) NULL);
END;
---- [tecnologia]
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Tecnologia')
BEGIN
	CREATE TABLE Tecnologia (
		id BIGINT NULL,
		nome VARCHAR(255) NULL);
END;
---- [disciplina]
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Disciplina')
BEGIN
	CREATE TABLE Disciplina (
		id BIGINT NULL,
		cursoAssociado BIGINT NULL,
		nome VARCHAR(255) NULL);
END;
---- [aluno]
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
---- [avaliacao-disciplina-aluno]
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'AvaliacaoDisciplinaAluno')
BEGIN
	CREATE TABLE AvaliacaoDisciplinaAluno (
		id BIGINT NULL,
		idNumeroAluno BIGINT NULL,
		idNumeroDisciplina BIGINT NULL,
		nota INT NULL);
END;
---- [grupo]
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Grupo')
BEGIN
	CREATE TABLE Grupo (
		id BIGINT NULL,
		confirmaAluno1 TINYINT NULL,
		confirmaAluno2 TINYINT NULL,
		idNumeroAluno1 VARCHAR(255) NULL,
		idNumeroAluno2 VARCHAR(255) NULL);
END;
---- [utilizador]
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'Utilizador')
BEGIN
	CREATE TABLE Utilizador (
		id BIGINT NULL,
		coordenador TINYINT NULL,
		idIdentificacao VARCHAR(255) NULL,
		tipoUtilizador VARCHAR(255) NULL);
END;
---- [inscricao]
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
---- [professor-deisi]
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'ProfessorDEISI')
BEGIN
	CREATE TABLE ProfessorDEISI (
		id BIGINT NULL,
		email VARCHAR(255) NULL,
		nome VARCHAR(255) NULL,
		numeroContato INT NULL,
		numeroProfessor VARCHAR(255) NULL);
END;
---- [professor-n-deisi]
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
---- [empresa-entidade-externa]
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
---- [tfc]
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
---- [tfc-curso]
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'TFCCurso')
BEGIN
	CREATE TABLE TFCCurso (
		id BIGINT NULL,
		idCurso BIGINT NULL,
		idTFC BIGINT NULL);
END;
---- [tfc-tecnologia]
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'TFCTecnologia')
BEGIN
	CREATE TABLE TFCTecnologia (
		id BIGINT NULL,
		idTFC BIGINT NULL,
		idTecnologia BIGINT NULL);
END;
---- [tfc-disciplina]
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'TFCDisciplina')
BEGIN
	CREATE TABLE TFCDisciplina (
		id BIGINT NULL,
		idNumeroDisciplina BIGINT NULL,
		numeroTFC BIGINT NULL);
END;
---- [historico-tfc]
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

-- <> clean bad data <> --
--------------------------
--------------------------
--------------------------
--------------------------
---- [curso]
SELECT COUNT(*) AS '[CLEAN-BAD-DATA:CURSO:BEFORE]' FROM Curso WHERE id IS NULL 
                                                              OR nome IS NULL; 

DELETE FROM Curso WHERE nome IS NULL 
                  OR id IS NULL;

SELECT COUNT(*) AS '[CLEAN-BAD-DATA:CURSO:AFTER]' FROM Curso WHERE id IS NULL 
                                                             OR nome IS NULL; 

---- [tecnologia]
SELECT COUNT(*) AS '[CLEAN-BAD-DATA:TECNOLOGIA:BEFORE]' FROM Tecnologia WHERE id IS NULL 
                                                                        OR nome IS NULL; 

DELETE FROM Tecnologia WHERE nome IS NULL 
                       OR id IS NULL;

SELECT COUNT(*) AS '[CLEAN-BAD-DATA:TECNOLOGIA:AFTER]' FROM Tecnologia WHERE id IS NULL 
                                                                       OR nome IS NULL; 

---- [disciplina]
SELECT COUNT(*) AS '[CLEAN-BAD-DATA:DISCIPLINA:BEFORE]' FROM Disciplina WHERE id IS NULL 
                                                                        OR cursoAssociado IS NULL 
                                                                        OR nome IS NULL; 

DELETE FROM Disciplina WHERE id IS NULL 
                       OR cursoAssociado IS NULL 
                       OR nome IS NULL; 

SELECT COUNT(*) AS '[CLEAN-BAD-DATA:DISCIPLINA:AFTER]' FROM Disciplina WHERE id IS NULL 
                                                                       OR cursoAssociado IS NULL 
                                                                       OR nome IS NULL; 

---- [aluno]
SELECT COUNT(*) AS '[CLEAN-BAD-DATA:ALUNO:BEFORE]' FROM Aluno WHERE id IS NULL 
                                                             OR nome IS NULL 
                                                             OR numeroAluno IS NULL; 

DELETE FROM Aluno WHERE id IS NULL 
                  OR nome IS NULL 
                  OR numeroAluno IS NULL; 

SELECT COUNT(*) AS '[CLEAN-BAD-DATA:ALUNO:AFTER]' FROM Aluno WHERE id IS NULL 
                                                             OR nome IS NULL 
                                                             OR numeroAluno IS NULL; 

---- [avaliacao-disciplina-aluno]
SELECT COUNT(*) AS '[CLEAN-BAD-DATA:DISCIPLINA:BEFORE]' FROM AvaliacaoDisciplinaAluno WHERE id IS NULL 
                                                                                      OR idNumeroAluno IS NULL 
                                                                                      OR idNumeroDisciplina IS NULL 
                                                                                      OR nota IS NULL; 

DELETE FROM AvaliacaoDisciplinaAluno WHERE id IS NULL 
                                     OR idNumeroAluno IS NULL 
                                     OR idNumeroDisciplina IS NULL 
                                     OR nota IS NULL; 

SELECT COUNT(*) AS '[CLEAN-BAD-DATA:DISCIPLINA:AFTER]' FROM AvaliacaoDisciplinaAluno WHERE id IS NULL 
                                                                                     OR idNumeroAluno IS NULL
                                                                                     OR idNumeroDisciplina IS NULL
                                                                                     OR nota IS NULL;

---- [tfc-disciplina]
SELECT COUNT(*) AS '[CLEAN-BAD-DATA:TFC-DISCIPLINA:BEFORE]' FROM TFCDisciplina WHERE id IS NULL 
                                                                               OR idNumeroDisciplina IS NULL 
                                                                               OR numeroTFC IS NULL; 

DELETE FROM TFCDisciplina WHERE id IS NULL 
                          OR idNumeroDisciplina IS NULL
                          OR numeroTFC IS NULL; 

SELECT COUNT(*) AS '[CLEAN-BAD-DATA:TFC-DISCIPLINA:AFTER]' FROM TFCDisciplina WHERE id IS NULL 
                                                                              OR idNumeroDisciplina IS NULL 
                                                                              OR numeroTFC IS NULL;

---- [tfc-tecnologia]
SELECT COUNT(*) AS '[CLEAN-BAD-DATA:TFC-TECNOLOGIA:BEFORE]' FROM TFCTecnologia WHERE id IS NULL 
                                                                               OR idTFC IS NULL 
                                                                               OR idTecnologia IS NULL; 

DELETE FROM TFCTecnologia WHERE id IS NULL 
                          OR idTFC IS NULL 
                          OR idTecnologia IS NULL; 

SELECT COUNT(*) AS '[CLEAN-BAD-DATA:TFC-TECNOLOGIA:AFTER]' FROM TFCTecnologia WHERE id IS NULL
                                                                              OR idTFC IS NULL 
                                                                              OR idTecnologia IS NULL;

---- [tfc-curso]
SELECT COUNT(*) AS '[CLEAN-BAD-DATA:TFC-CURSO:BEFORE]' FROM TFCCurso WHERE id IS NULL 
                                                                     OR idTFC IS NULL 
                                                                     OR idCurso IS NULL; 

DELETE FROM TFCCurso WHERE id IS NULL 
                     OR idTFC IS NULL 
                     OR idCurso IS NULL; 

SELECT COUNT(*) AS '[CLEAN-BAD-DATA:TFC-CURSO:AFTER]' FROM TFCCurso WHERE id IS NULL 
                                                                    OR idTFC IS NULL
                                                                    OR idCurso IS NULL; 

---- [inscricao]
SELECT COUNT(*) AS '[CLEAN-BAD-DATA:INSCRICAO:BEFORE]' FROM Inscricao WHERE id IS NULL 
                                                                      OR idTFC IS NULL;

DELETE FROM Inscricao WHERE id IS NULL 
                      OR idTFC IS NULL;

SELECT COUNT(*) AS '[CLEAN-BAD-DATA:INSCRICAO:AFTER]' FROM Inscricao WHERE id IS NULL
                                                                     OR idTFC IS NULL;

---- [historico-tfc]
SELECT COUNT(*) AS '[CLEAN-BAD-DATA:HISTORICO-TFC:BEFORE]' FROM HistoricoTFC WHERE id IS NULL 
                                                                             OR idTFC IS NULL 
                                                                             OR estado IS NULL 
                                                                             OR idTFCNumerico IS NULL 
                                                                             OR utilizador IS NULL;

DELETE FROM  HistoricoTFC WHERE id IS NULL 
                          OR idTFC IS NULL 
                          OR estado IS NULL 
                          OR idTFCNumerico IS NULL 
                          OR utilizador IS NULL;

SELECT COUNT(*) AS '[CLEAN-BAD-DATA:HISTORICO-TFC:AFTER]' FROM HistoricoTFC WHERE id IS NULL
                                                                            OR idTFC IS NULL 
                                                                            OR estado IS NULL 
                                                                            OR idTFCNumerico IS NULL 
                                                                            OR utilizador IS NULL;

---- [grupo]
SELECT COUNT(*) AS '[CLEAN-BAD-DATA:GRUPO:BEFORE]' FROM Grupo WHERE id IS NULL 
                                                              OR confirmaAluno1 IS NULL
                                                              OR idNumeroAluno1 IS NULL;

DELETE FROM Grupo WHERE id IS NULL 
                  OR confirmaAluno1 IS NULL
                  OR idNumeroAluno1 IS NULL;

SELECT COUNT(*) AS '[CLEAN-BAD-DATA:GRUPO:AFTER]' FROM Grupo WHERE id IS NULL 
                                                             OR confirmaAluno1 IS null
                                                             OR idNumeroAluno1 IS NULL;
---- [tfc]
SELECT COUNT(*) AS '[CLEAN-BAD-DATA:TFC:BEFORE]' FROM TFC WHERE id IS NULL;

DELETE FROM TFC WHERE id IS NULL;

SELECT COUNT(*) AS '[CLEAN-BAD-DATA:TFC:AFTER]' FROM TFC WHERE id IS NULL;

---- [professor-n-deisi]
SELECT COUNT(*) AS '[CLEAN-BAD-DATA:PROFESSOR-N-DEISI:BEFORE]' FROM ProfessorNDEISI WHERE id IS NULL 
                                                                                    OR departamentoAfeto IS NULL 
                                                                                    OR email IS NULL
                                                                                    OR numeroContato IS NULL
                                                                                    OR nome IS NULL;

DELETE FROM ProfessorNDEISI WHERE id IS NULL 
                            OR departamentoAfeto IS NULL 
                            OR email IS NULL
                            OR numeroContato IS NULL
                            OR nome IS NULL;

SELECT COUNT(*) AS '[CLEAN-BAD-DATA:PROFESSOR-N-DEISI:AFTER]' FROM ProfessorNDEISI WHERE id IS NULL 
                                                                                   OR departamentoAfeto IS NULL
                                                                                   OR email IS NULL 
                                                                                   OR numeroContato IS NULL
                                                                                   OR nome IS NULL;

---- [professor-deisi]
SELECT COUNT(*) AS '[CLEAN-BAD-DATA:PROFESSOR-DEISI:BEFORE]' FROM ProfessorDEISI WHERE id IS NULL
                                                                                 OR nome IS NULL
                                                                                 OR numeroProfessor IS NULL;

DELETE FROM ProfessorDEISI WHERE id IS NULL
                           OR nome IS NULL 
                           OR numeroProfessor IS NULL;

SELECT COUNT(*) AS '[CLEAN-BAD-DATA:PROFESSOR-DEISI:AFTER]' FROM ProfessorDEISI WHERE id IS NULL 
                                                                                OR nome IS NULL
                                                                                OR numeroProfessor IS NULL;

---- [empresa-entidade-externa]
SELECT COUNT(*) AS '[CLEAN-BAD-DATA:EMPRESA-ENTIDADE-EXTERNA:BEFORE]' FROM Empresa_EntidadeExterna WHERE id IS NULL
                                                                                                   OR nome IS NULL;

DELETE FROM Empresa_EntidadeExterna WHERE id IS NULL 
                                    OR nome IS NULL;

SELECT COUNT(*) AS '[CLEAN-BAD-DATA:EMPRESA-ENTIDADE-EXTERNA:AFTER]' FROM Empresa_EntidadeExterna WHERE id IS NULL 
                                                                                                  OR nome IS NULL;

---- [utilizador]
SELECT COUNT(*) AS '[CLEAN-BAD-DATA:UTILIZADOR:BEFORE]' FROM Utilizador WHERE id IS NULL;

DELETE FROM Utilizador WHERE id IS NULL;

SELECT count(*) AS '[CLEAN-BAD-DATA:UTILIZADOR:AFTER]' FROM Utilizador WHERE id IS NULL;


-- <> update tables : set not nullable columns <> --
----------------------------------------------------
----------------------------------------------------
----------------------------------------------------
----------------------------------------------------
BEGIN TRY
    BEGIN TRANSACTION;
        ---- [curso]
		ALTER TABLE Curso ALTER COLUMN id BIGINT NOT NULL;
		ALTER TABLE Curso ALTER COLUMN nome VARCHAR(255) NOT NULL;

        ---- [tecnologia]
		ALTER TABLE Tecnologia ALTER COLUMN id BIGINT NOT NULL;
		ALTER TABLE Tecnologia ALTER COLUMN nome VARCHAR(255) NOT NULL;

        ---- [disciplina]
		ALTER TABLE Disciplina ALTER COLUMN id BIGINT NOT NULL;
		ALTER TABLE Disciplina ALTER COLUMN cursoAssociado BIGINT NOT NULL;
		ALTER TABLE Disciplina ALTER COLUMN nome VARCHAR(255) NOT NULL;

        ---- [aluno]
		ALTER TABLE Aluno ALTER COLUMN id BIGINT NOT NULL;
		ALTER TABLE Aluno ALTER COLUMN nome VARCHAR(255) NOT NULL;
		ALTER TABLE Aluno ALTER COLUMN numeroAluno VARCHAR(255) NOT NULL;

        ---- [avaliacao-disciplina-aluno]
		ALTER TABLE AvaliacaoDisciplinaAluno ALTER COLUMN id BIGINT NOT NULL;
		ALTER TABLE AvaliacaoDisciplinaAluno ALTER COLUMN idNumeroAluno BIGINT NOT NULL;
		ALTER TABLE AvaliacaoDisciplinaAluno ALTER COLUMN idNumeroDisciplina BIGINT NOT NULL;
		ALTER TABLE AvaliacaoDisciplinaAluno ALTER COLUMN nota INT NOT NULL;

        ---- [tfc-disciplina]
		ALTER TABLE TFCDisciplina ALTER COLUMN id BIGINT NOT NULL;
		ALTER TABLE TFCDisciplina ALTER COLUMN idNumeroDisciplina BIGINT NOT NULL;
		ALTER TABLE TFCDisciplina ALTER COLUMN numeroTFC BIGINT NOT NULL;

		---- [tfc-tecnologia]
		ALTER TABLE TFCTecnologia ALTER COLUMN id BIGINT NOT NULL;
		ALTER TABLE TFCTecnologia ALTER COLUMN idTFC BIGINT NOT NULL;
		ALTER TABLE TFCTecnologia ALTER COLUMN idTecnologia BIGINT NOT NULL;

		---- [tfc-curso]
		ALTER TABLE TFCCurso ALTER COLUMN id BIGINT NOT NULL;
		ALTER TABLE TFCCurso ALTER COLUMN idTFC BIGINT NOT NULL;
		ALTER TABLE TFCCurso ALTER COLUMN idCurso BIGINT NOT NULL;

        ---- [utilizador]
		ALTER TABLE Utilizador ALTER COLUMN id BIGINT NOT NULL;

        ---- [inscricao]
		ALTER TABLE Inscricao ALTER COLUMN id BIGINT NOT NULL;
		ALTER TABLE Inscricao ALTER COLUMN idTFC VARCHAR(255) NOT NULL;

        ---- [historico-tfc]
		ALTER TABLE HistoricoTFC ALTER COLUMN id BIGINT NOT NULL;
		ALTER TABLE HistoricoTFC ALTER COLUMN idTFC VARCHAR(255) NOT NULL;
		ALTER TABLE HistoricoTFC ALTER COLUMN estado VARCHAR(255) NOT NULL;
		ALTER TABLE HistoricoTFC ALTER COLUMN idTFCNumerico BIGINT NOT NULL;
		ALTER TABLE HistoricoTFC ALTER COLUMN utilizador VARCHAR(255) NOT NULL;

        ---- [grupo]
		ALTER TABLE Grupo ALTER COLUMN id BIGINT NOT NULL;
		ALTER TABLE Grupo ALTER COLUMN confirmaAluno1 TINYINT NOT NULL;
		ALTER TABLE Grupo ALTER COLUMN idNumeroAluno1 VARCHAR(255) NOT NULL;

        ---- [tfc]
		ALTER TABLE TFC ALTER COLUMN id BIGINT NOT NULL;

        ---- [professor-n-deisi]
		ALTER TABLE ProfessorNDEISI ALTER COLUMN id BIGINT NOT NULL;
		ALTER TABLE ProfessorNDEISI ALTER COLUMN departamentoAfeto VARCHAR(255) NOT NULL;
		ALTER TABLE ProfessorNDEISI ALTER COLUMN email VARCHAR(255) NOT NULL;
		ALTER TABLE ProfessorNDEISI ALTER COLUMN nome VARCHAR(255) NOT NULL;
		ALTER TABLE ProfessorNDEISI ALTER COLUMN numeroContato INT NOT NULL;

        ---- [professor-deisi]
		ALTER TABLE ProfessorDEISI ALTER COLUMN id BIGINT NOT NULL;
		ALTER TABLE ProfessorDEISI ALTER COLUMN nome VARCHAR(255) NOT NULL;
		ALTER TABLE ProfessorDEISI ALTER COLUMN numeroProfessor VARCHAR(255) NOT NULL;

        ---- [empresa-entidade-externa]
		ALTER TABLE Empresa_EntidadeExterna ALTER COLUMN id BIGINT NOT NULL;
		ALTER TABLE Empresa_EntidadeExterna ALTER COLUMN nome VARCHAR(255) NOT NULL;

    COMMIT TRANSACTION; 
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;
END CATCH;

GO

-- <> update tables : create index's <> --
------------------------------------------
------------------------------------------
------------------------------------------
------------------------------------------
---- [curso]
IF NOT EXISTS (
    SELECT *
    FROM sys.indexes
    WHERE name = 'index_curso_id' AND object_id = OBJECT_ID('Curso') OR
		  name = 'index_curso_nome' AND object_id = OBJECT_ID('Curso'))
    BEGIN
        CREATE INDEX index_curso_id ON Curso(id);
        CREATE INDEX index_curso_nome ON Curso(nome);
    END;

---- [tecnologia]
IF NOT EXISTS (
    SELECT *
    FROM sys.indexes
    WHERE name = 'index_tecnologia_id' AND object_id = OBJECT_ID('Tecnologia') OR
		  name = 'index_tecnologia_nome' AND object_id = OBJECT_ID('Tecnologia'))
    BEGIN
        CREATE INDEX index_tecnologia_id ON Tecnologia(id);
        CREATE INDEX index_tecnologia_nome ON Tecnologia(nome);
    END;

---- [disciplina]
IF NOT EXISTS (
    SELECT *
    FROM sys.indexes
    WHERE name = 'index_disciplina_id' AND object_id = OBJECT_ID('Disciplina') OR
		  name = 'index_disciplina_curso_associado' AND object_id = OBJECT_ID('Disciplina')	OR
		  name = 'index_disciplina_nome' AND object_id = OBJECT_ID('Disciplina'))
    BEGIN
        CREATE INDEX index_disciplina_id ON Disciplina(id);
        CREATE INDEX index_disciplina_curso_associado ON Disciplina(cursoAssociado);
        CREATE INDEX index_disciplina_nome ON Disciplina(nome);
    END;

---- [tfc-curso]
IF NOT EXISTS (
    SELECT *
    FROM sys.indexes
    WHERE name = 'index_tfc_curso_id' AND object_id = OBJECT_ID('TFCCurso') OR
		  name = 'index_tfc_curso_idCurso' AND object_id = OBJECT_ID('TFCCurso') OR
		  name = 'index_tfc_curso_idTfc' AND object_id = OBJECT_ID('TFCCurso'))
    BEGIN
        CREATE INDEX index_tfc_curso_id ON TFCCurso(id);
        CREATE INDEX index_tfc_curso_idCurso ON TFCCurso(idCurso);
        CREATE INDEX index_tfc_curso_idTfc ON TFCCurso(idTFC);
    END;

---- [tfc-tecnologia]
IF NOT EXISTS (
    SELECT *
    FROM sys.indexes
    WHERE name = 'index_tfc_tecnologia_id' AND object_id = OBJECT_ID('TFCTecnologia') OR
		  name = 'index_tfc_tecnologia_idTFC' AND object_id = OBJECT_ID('TFCTecnologia') OR
		  name = 'index_tfc_tecnologia_idTecnologia' AND object_id = OBJECT_ID('TFCTecnologia'))
    BEGIN
        CREATE INDEX index_tfc_tecnologia_id ON TFCTecnologia(id);
        CREATE INDEX index_tfc_tecnologia_idTFC ON TFCTecnologia(idTFC);
        CREATE INDEX index_tfc_tecnologia_idTecnologia ON TFCTecnologia(idTecnologia);
    END;

---- [tfc-disciplina]
IF NOT EXISTS (
    SELECT *
    FROM sys.indexes
    WHERE name = 'index_tfc_disciplina_id' AND object_id = OBJECT_ID('TFCDisciplina') OR
		  name = 'index_tfc_disciplina_idNumeroDisciplina' AND object_id = OBJECT_ID('TFCDisciplina') OR
		  name = 'index_tfc_disciplina_numeroTFC' AND object_id = OBJECT_ID('TFCDisciplina'))
    BEGIN
        CREATE INDEX index_tfc_disciplina_id ON TFCDisciplina(id);
        CREATE INDEX index_tfc_disciplina_idNumeroDisciplina ON TFCDisciplina(idNumeroDisciplina);
        CREATE INDEX index_tfc_disciplina_numeroTFC ON TFCDisciplina(numeroTFC);
    END;

---- [avaliacao-disciplina-aluno]
IF NOT EXISTS (
    SELECT *
    FROM sys.indexes
    WHERE name = 'index_avaliacao_disciplina_aluno_id' AND object_id = OBJECT_ID('AvaliacaoDisciplinaAluno') OR
		  name = 'index_avaliacao_disciplina_aluno_idNumeroAluno' AND object_id = OBJECT_ID('AvaliacaoDisciplinaAluno') OR
		  name = 'index_avaliacao_disciplina_aluno_idNumeroDisciplina' AND object_id = OBJECT_ID('AvaliacaoDisciplinaAluno') OR
		  name = 'index_avaliacao_disciplina_aluno_nota' AND object_id = OBJECT_ID('AvaliacaoDisciplinaAluno'))
    BEGIN
        CREATE INDEX index_avaliacao_disciplina_aluno_id ON AvaliacaoDisciplinaAluno(id);
        CREATE INDEX index_avaliacao_disciplina_aluno_idNumeroAluno ON AvaliacaoDisciplinaAluno(idNumeroAluno);
        CREATE INDEX index_avaliacao_disciplina_aluno_idNumeroDisciplina ON AvaliacaoDisciplinaAluno(idNumeroDisciplina);
        CREATE INDEX index_avaliacao_disciplina_aluno_nota ON AvaliacaoDisciplinaAluno(nota);
    END;

---- [aluno]
IF NOT EXISTS (
    SELECT *
    FROM sys.indexes
    WHERE name = 'index_aluno_id' AND object_id = OBJECT_ID('Aluno') OR
		  name = 'index_aluno_nome' AND object_id = OBJECT_ID('Aluno') OR
		  name = 'index_aluno_numeroAluno' AND object_id = OBJECT_ID('Aluno'))
    BEGIN
        CREATE INDEX index_aluno_id ON Aluno(id);
        CREATE INDEX index_aluno_nome ON Aluno(nome);
        CREATE INDEX index_aluno_numeroAluno ON Aluno(numeroAluno);
    END;

---- [inscricao]
IF NOT EXISTS (
    SELECT *
    FROM sys.indexes
    WHERE name = 'index_inscricao_id' AND object_id = OBJECT_ID('Inscricao') OR
		  name = 'index_inscricao_idTFC' AND object_id = OBJECT_ID('Inscricao'))
    BEGIN
        CREATE INDEX index_inscricao_id ON Inscricao(id);
        CREATE INDEX index_inscricao_idTFC ON Inscricao(idTFC);
    END;

---- [historico-tfc]
IF NOT EXISTS (
    SELECT *
    FROM sys.indexes
    WHERE name = 'index_historico_tfc_id' AND object_id = OBJECT_ID('HistoricoTFC') OR
		  name = 'index_historico_tfc_estado' AND object_id = OBJECT_ID('HistoricoTFC') OR
		  name = 'index_historico_tfc_idTFC' AND object_id = OBJECT_ID('HistoricoTFC') OR
		  name = 'index_historico_tfc_idTFCNumerico' AND object_id = OBJECT_ID('HistoricoTFC') OR
		  name = 'index_historico_tfc_utilizador' AND object_id = OBJECT_ID('HistoricoTFC'))
    BEGIN
        CREATE INDEX index_historico_tfc_id ON HistoricoTFC(id);
        CREATE INDEX index_historico_tfc_estado ON HistoricoTFC(estado);
        CREATE INDEX index_historico_tfc_idTFC ON HistoricoTFC(idTFC);
        CREATE INDEX index_historico_tfc_idTFCNumerico ON HistoricoTFC(idTFCNumerico);
        CREATE INDEX index_historico_tfc_utilizador ON HistoricoTFC(utilizador);
    END;

---- [grupo]
IF NOT EXISTS (
    SELECT *
    FROM sys.indexes
    WHERE name = 'index_grupo_id' AND object_id = OBJECT_ID('Grupo') OR
		  name = 'index_grupo_confirmaAluno1' AND object_id = OBJECT_ID('Grupo') OR
		  name = 'index_grupo_idNumeroAluno1' AND object_id = OBJECT_ID('Grupo'))
    BEGIN
        CREATE INDEX index_grupo_id ON Grupo(id);
        CREATE INDEX index_grupo_confirmaAluno1 ON Grupo(confirmaAluno1);
        CREATE INDEX index_grupo_idNumeroAluno1 ON Grupo(idNumeroAluno1);
    END;

---- [tfc]
IF NOT EXISTS (
    SELECT *
    FROM sys.indexes
    WHERE name = 'index_tfc_id' AND object_id = OBJECT_ID('TFC'))
    BEGIN
        CREATE INDEX index_tfc_id ON TFC(id);
    END;

---- [professor-n-deisi]
IF NOT EXISTS (
    SELECT *
    FROM sys.indexes
    WHERE name = 'index_professorndeisi_id' AND object_id = OBJECT_ID('ProfessorNDEISI') OR
		  name = 'index_professorndeisi_departamentoafeto' AND object_id = OBJECT_ID('ProfessorNDEISI') OR
		  name = 'index_professorndeisi_email' AND object_id = OBJECT_ID('ProfessorNDEISI') OR
		  name = 'index_professorndeisi_nome' AND object_id = OBJECT_ID('ProfessorNDEISI') OR
		  name = 'index_professorndeisi_numContacto' AND object_id = OBJECT_ID('ProfessorNDEISI'))
    BEGIN
        CREATE INDEX index_professorndeisi_id ON ProfessorNDEISI(id);
        CREATE INDEX index_professorndeisi_departamentoafeto ON ProfessorNDEISI(departamentoAfeto);
        CREATE INDEX index_professorndeisi_email ON ProfessorNDEISI(email);
        CREATE INDEX index_professorndeisi_nome ON ProfessorNDEISI(nome);
        CREATE INDEX index_professorndeisi_numContacto ON ProfessorNDEISI(numeroContato);
    END;

---- [entidade-empresa]
IF NOT EXISTS (
    SELECT *
    FROM sys.indexes
    WHERE name = 'index_EntidadeEmpresa_id' AND object_id = OBJECT_ID('Empresa_EntidadeExterna') OR
		  name = 'index_EntidadeEmpresa_nome' AND object_id = OBJECT_ID('Empresa_EntidadeExterna'))
    BEGIN
        CREATE INDEX index_EntidadeEmpresa_id ON Empresa_EntidadeExterna(id);
        CREATE INDEX index_EntidadeEmpresa_nome ON Empresa_EntidadeExterna(nome);
    END;

---- [professor-deisi]
IF NOT EXISTS (
    SELECT *
    FROM sys.indexes
    WHERE name = 'index_professorndeisi_id' AND object_id = OBJECT_ID('ProfessorDEISI') OR
		  name = 'index_professorndeisi_nome' AND object_id = OBJECT_ID('ProfessorDEISI') OR
		  name = 'index_professorndeisi_numProfessor' AND object_id = OBJECT_ID('ProfessorDEISI'))
    BEGIN
        CREATE INDEX index_professorndeisi_id ON ProfessorDEISI(id);
        CREATE INDEX index_professorndeisi_email ON ProfessorDEISI(email);
        CREATE INDEX index_professorndeisi_numProfessor ON ProfessorDEISI(numeroContato);
    END;

---- [utilizador]
IF NOT EXISTS (
    SELECT *
    FROM sys.indexes
    WHERE name = 'index_Utilizador_id' AND object_id = OBJECT_ID('Utilizador'))
    BEGIN
        CREATE INDEX index_Utilizador_id ON Utilizador(id);
    END;

GO

-- <> improve data quality [ex: 4.1/4.2] <> --
----------------------------------------------
----------------------------------------------
----------------------------------------------
----------------------------------------------
-- <> remove empty spaces <> -----------------
DROP PROCEDURE IF EXISTS sp_remove_empty_spaces;
GO
CREATE PROCEDURE sp_remove_empty_spaces
    @TableName NVARCHAR(100),
    @ColumnName NVARCHAR(100),
    @QueryResult INT OUTPUT
AS
BEGIN
    DECLARE @SQL_UPDATE NVARCHAR(1000);
    DECLARE @SQL_RESULT NVARCHAR(1000);

    SET @SQL_UPDATE = N' UPDATE ' + QUOTENAME(@TableName) + 
                      N' SET ' + QUOTENAME(@ColumnName) + ' = LTRIM(RTRIM(' + QUOTENAME(@ColumnName) + '))';

	SET @SQL_RESULT = N' SELECT @QueryResult = COUNT(*)' +
					  N' FROM ' + QUOTENAME(@TableName) + 
                      N' WHERE ' + QUOTENAME(@ColumnName) + ' LIKE '' %'' OR ' + QUOTENAME(@ColumnName) + ' LIKE ''% ''';

    EXEC sp_executesql @SQL_UPDATE;
    EXEC sp_executesql @SQL_RESULT, N'@QueryResult INT OUTPUT', @QueryResult OUTPUT;
END;
---- [curso]
GO
DECLARE @Result INT;
EXEC sp_remove_empty_spaces 'Curso', 'nome', @Result OUTPUT;
SELECT @Result AS '[IMP.DATA-QUALITY:CURSO@nome:CURRENT-EMPTY-SPACES]';
GO
---- [tecnologia]
DECLARE @Result INT;
EXEC sp_remove_empty_spaces 'Tecnologia', 'nome', @Result OUTPUT;
SELECT @Result AS '[IMP.DATA-QUALITY:TECNOLOGIA@nome:CURRENT-EMPTY-SPACES]';
GO
---- [disciplina]
DECLARE @Result INT;
EXEC sp_remove_empty_spaces 'Disciplina', 'nome', @Result OUTPUT;
SELECT @Result AS '[IMP.DATA-QUALITY:DISCIPLINA@nome:CURRENT-EMPTY-SPACES]';
GO
---- [aluno]
DECLARE @Result INT;
EXEC sp_remove_empty_spaces 'Aluno', 'curso', @Result OUTPUT;
SELECT @Result AS '[IMP.DATA-QUALITY:ALUNO@curso:CURRENT-EMPTY-SPACES]';
GO
DECLARE @Result INT;
EXEC sp_remove_empty_spaces 'Aluno', 'email', @Result OUTPUT;
SELECT @Result AS '[IMP.DATA-QUALITY:ALUNO@email:CURRENT-EMPTY-SPACES]';
GO
DECLARE @Result INT;
EXEC sp_remove_empty_spaces 'Aluno', 'nome', @Result OUTPUT;
SELECT @Result AS '[IMP.DATA-QUALITY:ALUNO@nome:CURRENT-EMPTY-SPACES]';
GO
DECLARE @Result INT;
EXEC sp_remove_empty_spaces 'Aluno', 'numeroAluno', @Result OUTPUT;
SELECT @Result AS '[IMP.DATA-QUALITY:ALUNO@numeroAluno:CURRENT-EMPTY-SPACES]';
GO
---- [grupo]
DECLARE @Result INT;
EXEC sp_remove_empty_spaces 'Grupo', 'idNumeroAluno1', @Result OUTPUT;
SELECT @Result AS '[IMP.DATA-QUALITY:GRUPO@idNumeroAluno1:CURRENT-EMPTY-SPACES]';
GO
DECLARE @Result INT;
EXEC sp_remove_empty_spaces 'Grupo', 'idNumeroAluno2', @Result OUTPUT;
SELECT @Result AS '[IMP.DATA-QUALITY:GRUPO@idNumeroAluno2:CURRENT-EMPTY-SPACES]';
GO
---- [inscricao]
DECLARE @Result INT;
EXEC sp_remove_empty_spaces 'Inscricao', 'estado', @Result OUTPUT;
SELECT @Result AS '[IMP.DATA-QUALITY:INSCRICAO@estado:CURRENT-EMPTY-SPACES]';
GO
DECLARE @Result INT;
EXEC sp_remove_empty_spaces 'Inscricao', 'idTFC', @Result OUTPUT;
SELECT @Result AS '[IMP.DATA-QUALITY:INSCRICAO@idTFC:CURRENT-EMPTY-SPACES]';
GO
DECLARE @Result INT;
EXEC sp_remove_empty_spaces 'Inscricao', 'numeroAluno', @Result OUTPUT;
SELECT @Result AS '[IMP.DATA-QUALITY:INSCRICAO@numeroAluno:CURRENT-EMPTY-SPACES]';
GO
DECLARE @Result INT;
EXEC sp_remove_empty_spaces 'Inscricao', 'anoLetivo', @Result OUTPUT;
SELECT @Result AS '[IMP.DATA-QUALITY:INSCRICAO@anoLetivo:CURRENT-EMPTY-SPACES]';
GO
---- [professor-deisi]
DECLARE @Result INT;
EXEC sp_remove_empty_spaces 'ProfessorDeisi', 'email', @Result OUTPUT;
SELECT @Result AS '[IMP.DATA-QUALITY:PROFESSOR-DEISI@email:CURRENT-EMPTY-SPACES]';
GO
DECLARE @Result INT;
EXEC sp_remove_empty_spaces 'ProfessorDeisi', 'nome', @Result OUTPUT;
SELECT @Result AS '[IMP.DATA-QUALITY:PROFESSOR-DEISI@nome:CURRENT-EMPTY-SPACES]';
GO
DECLARE @Result INT;
EXEC sp_remove_empty_spaces 'ProfessorDeisi', 'numeroProfessor', @Result OUTPUT;
SELECT @Result AS '[IMP.DATA-QUALITY:PROFESSOR-DEISI@numeroProfessor:CURRENT-EMPTY-SPACES]';
GO
---- [professor-n-deisi]
DECLARE @Result INT;
EXEC sp_remove_empty_spaces 'ProfessorNDEISI', 'departamentoAfeto', @Result OUTPUT;
SELECT @Result AS '[IMP.DATA-QUALITY:PROFESSOR-N-DEISI@departamentoAfeto:CURRENT-EMPTY-SPACES]';
GO
DECLARE @Result INT;
EXEC sp_remove_empty_spaces 'ProfessorNDEISI', 'email', @Result OUTPUT;
SELECT @Result AS '[IMP.DATA-QUALITY:PROFESSOR-N-DEISI@email:CURRENT-EMPTY-SPACES]';
GO
DECLARE @Result INT;
EXEC sp_remove_empty_spaces 'ProfessorNDEISI', 'idProfessor', @Result OUTPUT;
SELECT @Result AS '[IMP.DATA-QUALITY:PROFESSOR-N-DEISI@idProfessor:CURRENT-EMPTY-SPACES]';
GO
DECLARE @Result INT;
EXEC sp_remove_empty_spaces 'ProfessorNDEISI', 'nome', @Result OUTPUT;
SELECT @Result AS '[IMP.DATA-QUALITY:PROFESSOR-N-DEISI@nome:CURRENT-EMPTY-SPACES]';
GO
---- [empresa-entidade-externa]
DECLARE @Result INT;
EXEC sp_remove_empty_spaces 'Empresa_EntidadeExterna', 'email', @Result OUTPUT;
SELECT @Result AS '[IMP.DATA-QUALITY:EMPRESA-ENTIDADE-EXTERNA@email:CURRENT-EMPTY-SPACES]';
GO
---- [tfc]
DECLARE @Result INT;
EXEC sp_remove_empty_spaces 'TFC', 'Titulo', @Result OUTPUT;
SELECT @Result AS '[IMP.DATA-QUALITY:TFC@Titulo:CURRENT-EMPTY-SPACES]';
GO
DECLARE @Result INT;
EXEC sp_remove_empty_spaces 'TFC', 'anoLetivo', @Result OUTPUT;
SELECT @Result AS '[IMP.DATA-QUALITY:TFC@anoLetivo:CURRENT-EMPTY-SPACES]';
GO
DECLARE @Result INT;
EXEC sp_remove_empty_spaces 'TFC', 'avaliacaoProposta', @Result OUTPUT;
SELECT @Result AS '[IMP.DATA-QUALITY:TFC@avaliacaoProposta:CURRENT-EMPTY-SPACES]';
GO
DECLARE @Result INT;
EXEC sp_remove_empty_spaces 'TFC', 'coorientador', @Result OUTPUT;
SELECT @Result AS '[IMP.DATA-QUALITY:TFC@coorientador:CURRENT-EMPTY-SPACES]';
GO
DECLARE @Result INT;
EXEC sp_remove_empty_spaces 'TFC', 'dataEstado', @Result OUTPUT;
SELECT @Result AS '[IMP.DATA-QUALITY:TFC@dataEstado:CURRENT-EMPTY-SPACES]';
GO
DECLARE @Result INT;
EXEC sp_remove_empty_spaces 'TFC', 'dataProposta', @Result OUTPUT;
SELECT @Result AS '[IMP.DATA-QUALITY:TFC@dataProposta:CURRENT-EMPTY-SPACES]';
GO
DECLARE @Result INT;
EXEC sp_remove_empty_spaces 'TFC', 'estado', @Result OUTPUT;
SELECT @Result AS '[IMP.DATA-QUALITY:TFC@estado:CURRENT-EMPTY-SPACES]';
GO
DECLARE @Result INT;
EXEC sp_remove_empty_spaces 'TFC', 'idtfc', @Result OUTPUT;
SELECT @Result AS '[IMP.DATA-QUALITY:TFC@idtfc:CURRENT-EMPTY-SPACES]';
GO
DECLARE @Result INT;
EXEC sp_remove_empty_spaces 'TFC', 'motivoRecusa', @Result OUTPUT;
SELECT @Result AS '[IMP.DATA-QUALITY:TFC@motivoRecusa:CURRENT-EMPTY-SPACES]';
GO
DECLARE @Result INT;
EXEC sp_remove_empty_spaces 'TFC', 'orientador', @Result OUTPUT;
SELECT @Result AS '[IMP.DATA-QUALITY:TFC@orientador:CURRENT-EMPTY-SPACES]';
GO
DECLARE @Result INT;
EXEC sp_remove_empty_spaces 'TFC', 'preponente', @Result OUTPUT;
SELECT @Result AS '[IMP.DATA-QUALITY:TFC@preponente:CURRENT-EMPTY-SPACES]';
GO
DECLARE @Result INT;
EXEC sp_remove_empty_spaces 'TFC', 'orientadorProposto', @Result OUTPUT;
SELECT @Result AS '[IMP.DATA-QUALITY:TFC@orientadorProposto:CURRENT-EMPTY-SPACES]';
GO
DECLARE @Result INT;
EXEC sp_remove_empty_spaces 'TFC', 'tecnologias', @Result OUTPUT;
SELECT @Result AS '[IMP.DATA-QUALITY:TFC@tecnologias:CURRENT-EMPTY-SPACES]';
GO
---- [historico-tfc]
DECLARE @Result INT;
EXEC sp_remove_empty_spaces 'HistoricoTFC', 'avaliacao', @Result OUTPUT;
SELECT @Result AS '[IMP.DATA-QUALITY:HistoricoTFC@avaliacao:CURRENT-EMPTY-SPACES]';
GO
DECLARE @Result INT;
EXEC sp_remove_empty_spaces 'HistoricoTFC', 'dataMudancaEstado', @Result OUTPUT;
SELECT @Result AS '[IMP.DATA-QUALITY:HistoricoTFC@dataMudancaEstado:CURRENT-EMPTY-SPACES]';
GO
DECLARE @Result INT;
EXEC sp_remove_empty_spaces 'HistoricoTFC', 'estado', @Result OUTPUT;
SELECT @Result AS '[IMP.DATA-QUALITY:HistoricoTFC@estado:CURRENT-EMPTY-SPACES]';
GO
DECLARE @Result INT;
EXEC sp_remove_empty_spaces 'HistoricoTFC', 'idTFC', @Result OUTPUT;
SELECT @Result AS '[IMP.DATA-QUALITY:HistoricoTFC@idTFC:CURRENT-EMPTY-SPACES]';
GO
DECLARE @Result INT;
EXEC sp_remove_empty_spaces 'HistoricoTFC', 'utilizador', @Result OUTPUT;
SELECT @Result AS '[IMP.DATA-QUALITY:HistoricoTFC@utilizador:CURRENT-EMPTY-SPACES]';
GO
-- <> remove double quotes <> ----------------- [TO BE CONTINUED]

UPDATE Curso SET nome = SUBSTRING(nome, 2, LEN(nome)) WHERE LEFT(nome, 1) = '"';
UPDATE Curso SET nome = SUBSTRING(nome, 1, LEN(nome)-1) WHERE RIGHT(nome, 1) = '"';
--Tira [
 UPDATE Curso SET nome = SUBSTRING(nome, 2, LEN(nome)) WHERE LEFT(nome, 1) = '[';
 UPDATE Curso SET nome = SUBSTRING(nome, 1, LEN(nome)-1) WHERE RIGHT(nome, 1) = '['
--Tira ]
 UPDATE Curso SET nome = SUBSTRING(nome, 2, LEN(nome)) WHERE LEFT(nome, 1) = ']';
 UPDATE Curso SET nome = SUBSTRING(nome, 1, LEN(nome)-1) WHERE RIGHT(nome, 1) = ']'

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
SELECT COUNT(nome) AS NumRepetidos FROM Curso GROUP BY nome HAVING COUNT(nome) > 1;
--Disciplina
SELECT COUNT(nome) AS NumRepetidos FROM Disciplina GROUP BY nome HAVING COUNT(nome) > 1;
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
SELECT idtfc AS NumRepetidos FROM TFC GROUP BY idtfc HAVING COUNT(idtfc) > 1;
COMMIT TRANSACTION RemoveDuplicates;

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


--5.3.3 Grupo
--alunos que estao repetidos no grupo e numero de vezes repetidas
--SELECT idNumeroAluno, COUNT(*) AS NumRepetidos
--FROM ( SELECT idNumeroAluno1 AS idNumeroAluno FROM Grupo UNION ALL SELECT idNumeroAluno2 AS idNumeroAluno FROM Grupo ) AS Alunos
--GROUP BY idNumeroAluno HAVING COUNT(*) > 1;

--BEGIN TRANSACTION RemoveDuplicadosGrupos;
--	update grupo set idNumeroAluno2 = null
--		WHERE idNumeroAluno2 IN (
--			SELECT idNumeroAluno1
--			FROM Grupo
--		)
	
--	DELETE FROM Grupo
--	WHERE idNumeroAluno1 IN (
--		SELECT idNumeroAluno2
--		FROM Grupo
--	);

--	DELETE FROM Grupo
--	WHERE idNumeroAluno1 IN (
--		SELECT idNumeroAluno1
--		FROM Grupo
--		GROUP BY idNumeroAluno1
--		HAVING COUNT(idNumeroAluno1) > 1
--	)
--	OR idNumeroAluno2 IN (
--		SELECT idNumeroAluno2
--		FROM Grupo
--		GROUP BY idNumeroAluno2
--		HAVING COUNT(idNumeroAluno2) > 1
--	);

-- Create temporary table 1 if it does not exist
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'TempTable1')
BEGIN
    CREATE TABLE TempTable1 (
        id BIGINT NULL,
        confirmaAluno1 TINYINT NULL,
        confirmaAluno2 TINYINT NULL,
        idNumeroAluno1 VARCHAR(255) NULL,
        idNumeroAluno2 VARCHAR(255) NULL
    );
END;

-- Create temporary table 2 if it does not exist
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'TempTable2')
BEGIN
    CREATE TABLE TempTable2 (
        id BIGINT NULL,
        confirmaAluno1 TINYINT NULL,
        confirmaAluno2 TINYINT NULL,
        idNumeroAluno1 VARCHAR(255) NULL,
        idNumeroAluno2 VARCHAR(255) NULL
    );
END;

go
-- Insert data into TempTable1
INSERT INTO TempTable1 (id, confirmaAluno1, confirmaAluno2, idNumeroAluno1, idNumeroAluno2)
SELECT id, confirmaAluno1, confirmaAluno2, idNumeroAluno1, idNumeroAluno2
FROM Grupo;

-- Insert data into TempTable2
INSERT INTO TempTable2 (id, confirmaAluno1, confirmaAluno2, idNumeroAluno1, idNumeroAluno2)
SELECT id, confirmaAluno1, confirmaAluno2, idNumeroAluno1, idNumeroAluno2
FROM Grupo;


-- Delete all data from Grupo
DELETE FROM Grupo;

-- Update TempTable2: set idNumeroAluno2 to NULL where it matches idNumeroAluno1 in Grupo
-- Update TempTable2: set idNumeroAluno2 to NULL when it is equal to idNumeroAluno1
UPDATE TempTable2
SET idNumeroAluno2 = NULL
WHERE idNumeroAluno2 = idNumeroAluno1;

-- Delete rows from TempTable2 where idNumeroAluno1 matches idNumeroAluno2 in Grupo
DELETE FROM TempTable2
WHERE idNumeroAluno1 IN (
    SELECT idNumeroAluno2
    FROM Grupo
);

-- Delete duplicate rows from TempTable2 based on idNumeroAluno1 and idNumeroAluno2
DELETE FROM TempTable2
WHERE idNumeroAluno1 IN (
    SELECT idNumeroAluno1
    FROM TempTable2
    GROUP BY idNumeroAluno1
    HAVING COUNT(idNumeroAluno1) > 1
)
OR idNumeroAluno2 IN (
    SELECT idNumeroAluno2
    FROM TempTable2
    GROUP BY idNumeroAluno2
    HAVING COUNT(idNumeroAluno2) > 1
);

DELETE FROM TempTable2
WHERE idNumeroAluno2 IN (
    SELECT idNumeroAluno1
    FROM TempTable2
);

-- Insert data from TempTable2 into Grupo
INSERT INTO Grupo (id, confirmaAluno1, confirmaAluno2, idNumeroAluno1, idNumeroAluno2)
SELECT id, confirmaAluno1, confirmaAluno2, idNumeroAluno1, idNumeroAluno2
FROM TempTable2;

-- Insert data from TempTable1 into Grupo for rows that don't exist
INSERT INTO Grupo (id, confirmaAluno1, confirmaAluno2, idNumeroAluno1, idNumeroAluno2)
SELECT t1.id, t1.confirmaAluno1, t1.confirmaAluno2, t1.idNumeroAluno1, t1.idNumeroAluno2
FROM TempTable1 t1
WHERE NOT EXISTS (
    SELECT 1
    FROM Grupo g
    WHERE g.id = t1.id
    AND g.confirmaAluno1 = t1.confirmaAluno1
    AND g.confirmaAluno2 = t1.confirmaAluno2
    AND g.idNumeroAluno1 = t1.idNumeroAluno1
    AND g.idNumeroAluno2 = t1.idNumeroAluno2
);





	--validar que foram eliminados duplicados
	SELECT idNumeroAluno, COUNT(*) AS NumRepetidos
	FROM ( SELECT idNumeroAluno1 AS idNumeroAluno FROM Grupo UNION ALL SELECT idNumeroAluno2 AS idNumeroAluno FROM Grupo ) AS Alunos
	GROUP BY idNumeroAluno HAVING COUNT(*) > 1;

--COMMIT TRANSACTION RemoveDuplicadosGrupos

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

BEGIN TRANSACTION VerificarNumeroProfessor;
    DELETE FROM TFC WHERE orientador NOT IN (SELECT numeroProfessor FROM ProfessorDEISI) or orientador IS NULL;

	SELECT
		(SELECT COUNT(*) FROM TFC WHERE orientador NOT IN (SELECT numeroProfessor FROM ProfessorDEISI)) AS NotInCount,
		(SELECT COUNT(*) FROM TFC WHERE orientador IS NULL) AS NullCount;

 COMMIT TRANSACTION VerificarNumeroProfessor;
 
 GO 

 
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