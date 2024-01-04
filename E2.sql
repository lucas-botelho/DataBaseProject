--Lucas Botelho a22201202
--Tiago Mota a22207337
--Marcos Gil a22102606
--Gonçalo Neves a22204044
USE tfc;


--Etapa 2
--6 
--Validacao dos dados antes das constraints
----Todas as disciplinas tem um curso associados
--SELECT
--    (SELECT COUNT(*) FROM Disciplina WHERE cursoAssociado NOT IN (SELECT id FROM Curso)) AS NotInCount,
--    (SELECT COUNT(*) FROM Disciplina WHERE cursoAssociado IS NULL) AS NullCount;

--BEGIN TRANSACTION DeleteNotInOrNull;
--    DELETE FROM Disciplina WHERE cursoAssociado NOT IN (SELECT id FROM Curso) or cursoAssociado IS NULL;

--	SELECT
--		(SELECT COUNT(*) FROM Disciplina WHERE cursoAssociado NOT IN (SELECT id FROM Curso)) AS NotInCount,
--		(SELECT COUNT(*) FROM Disciplina WHERE cursoAssociado IS NULL) AS NullCount;

-- COMMIT TRANSACTION DeleteNotInOrNull;

-- GO
 
-- --Todos tfccurso tem idcurso
--SELECT
--    (SELECT COUNT(*) FROM TFCCurso WHERE idCurso NOT IN (SELECT id FROM Curso)) AS NotInCount,
--    (SELECT COUNT(*) FROM TFCCurso WHERE idCurso IS NULL) AS NullCount;

--BEGIN TRANSACTION DeleteNotInOrNull;
--    DELETE FROM Disciplina WHERE cursoAssociado NOT IN (SELECT id FROM Curso) or cursoAssociado IS NULL;

--	SELECT
--    (SELECT COUNT(*) FROM TFCCurso WHERE idCurso NOT IN (SELECT id FROM Curso)) AS NotInCount,
--    (SELECT COUNT(*) FROM TFCCurso WHERE idCurso IS NULL) AS NullCount;

-- COMMIT TRANSACTION DeleteNotInOrNull;

-- GO 

--  --Todos tfTecnologia tem idtecnologia
--SELECT
--    (SELECT COUNT(*) FROM TFCTecnologia WHERE idTecnologia NOT IN (SELECT id FROM Tecnologia)) AS NotInCount,
--    (SELECT COUNT(*) FROM TFCTecnologia WHERE idTecnologia IS NULL) AS NullCount;
--	--dois registos em tfctecnologia tem ids que nao existem em tecnologia. tem de ser apagados

--BEGIN TRANSACTION DeleteNotInOrNull;
--    DELETE FROM TFCTecnologia WHERE idTecnologia NOT IN (SELECT id FROM Tecnologia) or idTecnologia IS NULL;

--	SELECT
--    (SELECT COUNT(*) FROM TFCTecnologia WHERE idTecnologia NOT IN (SELECT id FROM Tecnologia)) AS NotInCount,
--    (SELECT COUNT(*) FROM TFCTecnologia WHERE idTecnologia IS NULL) AS NullCount;

-- COMMIT TRANSACTION DeleteNotInOrNull;

-- GO 
  
--  --Todos tfcdisciplina tem idNumeroDisciplina
--SELECT
--    (SELECT COUNT(*) FROM TFCDisciplina WHERE idNumeroDisciplina NOT IN (SELECT id FROM Disciplina)) AS NotInCount,
--    (SELECT COUNT(*) FROM TFCDisciplina WHERE idNumeroDisciplina IS NULL) AS NullCount;

--BEGIN TRANSACTION DeleteNotInOrNull;
--    DELETE FROM TFCDisciplina WHERE idNumeroDisciplina NOT IN (SELECT id FROM Disciplina) or idNumeroDisciplina IS NULL;
	   
--   SELECT
--    (SELECT COUNT(*) FROM TFCDisciplina WHERE idNumeroDisciplina NOT IN (SELECT id FROM Disciplina)) AS NotInCount,
--    (SELECT COUNT(*) FROM TFCDisciplina WHERE idNumeroDisciplina IS NULL) AS NullCount;

-- COMMIT TRANSACTION DeleteNotInOrNull;

-- GO
 
--   --Todos avaliacaodisciplinaluno tem idNumeroDisciplina
--SELECT
--    (SELECT COUNT(*) FROM AvaliacaoDisciplinaAluno WHERE idNumeroDisciplina NOT IN (SELECT id FROM Disciplina)) AS NotInCount,
--    (SELECT COUNT(*) FROM AvaliacaoDisciplinaAluno WHERE idNumeroDisciplina IS NULL) AS NullCount;

--BEGIN TRANSACTION DeleteNotInOrNull;
--    DELETE FROM AvaliacaoDisciplinaAluno WHERE idNumeroDisciplina NOT IN (SELECT id FROM Disciplina) or idNumeroDisciplina IS NULL;
	   
--	SELECT
--    (SELECT COUNT(*) FROM AvaliacaoDisciplinaAluno WHERE idNumeroDisciplina NOT IN (SELECT id FROM Disciplina)) AS NotInCount,
--    (SELECT COUNT(*) FROM AvaliacaoDisciplinaAluno WHERE idNumeroDisciplina IS NULL) AS NullCount;

   
-- COMMIT TRANSACTION DeleteNotInOrNull;

-- GO 

--    --Apagar inscricoes que nao tem alunos
--SELECT
--    (SELECT COUNT(*) FROM Inscricao WHERE numeroAluno NOT IN (SELECT numeroAluno FROM Aluno)) AS NotInCount,
--    (SELECT COUNT(*) FROM Inscricao WHERE numeroAluno IS NULL) AS NullCount;

--BEGIN TRANSACTION DeleteNotInOrNull;
--    DELETE FROM Inscricao WHERE numeroAluno NOT IN (SELECT numeroAluno FROM Aluno) or numeroAluno IS NULL;
	   
--	SELECT
--    (SELECT COUNT(*) FROM Inscricao WHERE numeroAluno NOT IN (SELECT numeroAluno FROM Aluno)) AS NotInCount,
--    (SELECT COUNT(*) FROM Inscricao WHERE numeroAluno IS NULL) AS NullCount;
   
-- COMMIT TRANSACTION DeleteNotInOrNull;

-- GO 

----Apagar inscricoes que nao tem grupo
--SELECT
--    (SELECT COUNT(*) FROM Inscricao WHERE idNumeroGrupo NOT IN (SELECT id FROM Grupo)) AS NotInCount,
--    (SELECT COUNT(*) FROM Inscricao WHERE idNumeroGrupo IS NULL) AS NullCount;

--BEGIN TRANSACTION DeleteNotInOrNull;
--    DELETE FROM Inscricao WHERE idNumeroGrupo NOT IN (SELECT id FROM Grupo) or idNumeroGrupo IS NULL;
	   
--  SELECT
--    (SELECT COUNT(*) FROM Inscricao WHERE idNumeroGrupo NOT IN (SELECT id FROM Grupo)) AS NotInCount,
--    (SELECT COUNT(*) FROM Inscricao WHERE idNumeroGrupo IS NULL) AS NullCount;

-- COMMIT TRANSACTION DeleteNotInOrNull;

-- GO 

-- --Apagar apagar tfc que nao tem empresa
--SELECT
--    (SELECT COUNT(*) FROM TFC WHERE entidade NOT IN (SELECT id FROM Empresa_EntidadeExterna)) AS NotInCount,
--    (SELECT COUNT(*) FROM TFC WHERE entidade IS NULL) AS NullCount;
--	--ha 18 tfc que a entidade nao existe na empresa entidade

--BEGIN TRANSACTION DeleteNotInOrNull;
--    DELETE FROM TFC WHERE entidade NOT IN (SELECT id FROM Empresa_EntidadeExterna) or entidade IS NULL;
	   
--	SELECT
--		(SELECT COUNT(*) FROM TFC WHERE entidade NOT IN (SELECT id FROM Empresa_EntidadeExterna)) AS NotInCount,
--		(SELECT COUNT(*) FROM TFC WHERE entidade IS NULL) AS NullCount;

-- COMMIT TRANSACTION DeleteNotInOrNull;

-- GO 
-- select * from tfc

-- Aluno
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'PK_Aluno_numeroAluno' AND object_id = OBJECT_ID('Aluno'))
BEGIN
    ALTER TABLE Aluno ADD CONSTRAINT PK_Aluno_numeroAluno PRIMARY KEY (numeroAluno);
END;
GO

--AvaliacaoDisciplinaAluno
--ALTER TABLE AvaliacaoDisciplinaAluno ADD CONSTRAINT PK_AvaliacaoDisciplinaAluno_id PRIMARY KEY (id);

IF NOT EXISTS (
    SELECT 1
    FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
    WHERE CONSTRAINT_NAME = 'PK_AvaliacaoDisciplinaAluno'
      AND TABLE_NAME = 'AvaliacaoDisciplinaAluno'
)
BEGIN
    ALTER TABLE AvaliacaoDisciplinaAluno ADD CONSTRAINT PK_AvaliacaoDisciplinaAluno PRIMARY KEY (id);
END;
-- Curso
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'PK_Curso' AND TABLE_NAME = 'Curso')
BEGIN
    ALTER TABLE Curso ADD CONSTRAINT PK_Curso PRIMARY KEY (id);
END;

-- Disciplina
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'PK_Disciplina' AND TABLE_NAME = 'Disciplina')
BEGIN
    ALTER TABLE Disciplina ADD CONSTRAINT PK_Disciplina PRIMARY KEY (id);
END;

-- Empresa_EntidadeExterna 
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'PK_Empresa_EntidadeExterna' AND TABLE_NAME = 'Empresa_EntidadeExterna')
BEGIN
    ALTER TABLE Empresa_EntidadeExterna ADD CONSTRAINT PK_Empresa_EntidadeExterna PRIMARY KEY (id);
END;
-- Grupo
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'PK_Grupo' AND TABLE_NAME = 'Grupo')
BEGIN
    ALTER TABLE Grupo ADD CONSTRAINT PK_Grupo PRIMARY KEY (id);
END;

-- HistoricoTFC
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'PK_HistoricoTFC' AND TABLE_NAME = 'HistoricoTFC')
BEGIN
    ALTER TABLE HistoricoTFC ADD CONSTRAINT PK_HistoricoTFC PRIMARY KEY (id);
END;

-- Inscricao
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'PK_Inscricao' AND TABLE_NAME = 'Inscricao')
BEGIN
    ALTER TABLE Inscricao ADD CONSTRAINT PK_Inscricao PRIMARY KEY (id);
END;
-- ProfessorDEISI
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'PK_ProfessorDEISI' AND TABLE_NAME = 'ProfessorDEISI')
BEGIN
    ALTER TABLE ProfessorDEISI ADD CONSTRAINT PK_ProfessorDEISI PRIMARY KEY (numeroProfessor);
END;

ALTER TABLE ProfessorNDEISI ALTER COLUMN idProfessor varchar(255) NOT NULL;
go
-- ProfessorNDEISI
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'PK_ProfessorNDEISI' AND TABLE_NAME = 'ProfessorNDEISI')
BEGIN
    ALTER TABLE ProfessorNDEISI ADD CONSTRAINT PK_ProfessorNDEISI PRIMARY KEY (idProfessor);
END;

-- Tecnologia
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'PK_Tecnologia' AND TABLE_NAME = 'Tecnologia')
BEGIN
    ALTER TABLE Tecnologia ADD CONSTRAINT PK_Tecnologia PRIMARY KEY (id);
END;

-- TFC 
ALTER TABLE TFC ALTER COLUMN idTFC varchar(255) NOT NULL;
go
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'PK_TFC' AND TABLE_NAME = 'TFC')
BEGIN
    ALTER TABLE TFC ADD CONSTRAINT PK_TFC PRIMARY KEY (idTFC);
END;

-- TFCCurso
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'PK_TFCCurso' AND TABLE_NAME = 'TFCCurso')
BEGIN
    ALTER TABLE TFCCurso ADD CONSTRAINT PK_TFCCurso PRIMARY KEY (id);
END;

-- TFCDisciplina 

SELECT idNumeroDisciplina, numeroTFC, COUNT(*)
FROM TFCDisciplina
GROUP BY idNumeroDisciplina, numeroTFC
HAVING COUNT(*) > 1;

WITH DuplicateCTE AS (
    SELECT
        id,
        idNumeroDisciplina,
        numeroTFC,
        ROW_NUMBER() OVER (PARTITION BY idNumeroDisciplina, numeroTFC ORDER BY id) AS RowNum
    FROM TFCDisciplina
)
DELETE FROM DuplicateCTE
WHERE RowNum > 1;

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'PK_TFCDisciplina' AND TABLE_NAME = 'TFCDisciplina')
BEGIN
    ALTER TABLE TFCDisciplina ADD CONSTRAINT PK_TFCDisciplina PRIMARY KEY (idNumeroDisciplina, numeroTFC);
END;

-- TFCTecnologia 
SELECT idTFC, idTecnologia, COUNT(*)
FROM TFCTecnologia
GROUP BY idTFC, idTecnologia
HAVING COUNT(*) > 1;

WITH DuplicateCTE AS (
    SELECT
        id,
        idTFC,
        idTecnologia,
        ROW_NUMBER() OVER (PARTITION BY idTFC, idTecnologia ORDER BY id) AS RowNum
    FROM TFCTecnologia
)
DELETE FROM DuplicateCTE
WHERE RowNum > 1;

-- TFCTecnologia
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'PK_TFCTecnologia' AND TABLE_NAME = 'TFCTecnologia')
BEGIN
    ALTER TABLE TFCTecnologia ADD CONSTRAINT PK_TFCTecnologia PRIMARY KEY (idTFC, idTecnologia);
END;

ALTER TABLE Utilizador ALTER COLUMN idIdentificacao varchar(255) NOT NULL;
go
-- Utilizador
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'PK_Utilizador_idIdentificacao' AND TABLE_NAME = 'Utilizador')
BEGIN
    ALTER TABLE Utilizador ADD CONSTRAINT PK_Utilizador_idIdentificacao PRIMARY KEY (idIdentificacao);
END;

--7 
--adicionar coluna
-- Aluno
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE COLUMN_NAME = 'ECTS' AND TABLE_NAME = 'Aluno')
BEGIN
    ALTER TABLE Aluno ADD ECTS INT NOT NULL DEFAULT 0;
END;

 GO
 -- 10 alunos com entre 0 a 180 ects
 UPDATE TOP (10) Aluno SET ECTS = ROUND(RAND(CONVERT(VARBINARY, NEWID())) * 180, 0);
 select * from Aluno where ECTS > 0; --10 RESULTADOS

 SELECT * FROM AvaliacaoDisciplinaAluno
--8
BEGIN TRY
    BEGIN TRANSACTION;
	INSERT INTO AvaliacaoDisciplinaAluno (id, idNumeroAluno, idNumeroDisciplina, nota)
    SELECT 
	-- Meter id igual ao numero da linha do resultado
        ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS id,
        Al.id AS idNumeroAluno,
        TD.idNumeroDisciplina AS idNumeroDisciplina,
        --nota entre 10 e 20
		CAST((RAND(CONVERT(VARBINARY, NEWID())) * 10 + 10) AS INT) AS nota
    FROM TFCDisciplina TD INNER JOIN
        TFC T ON TD.numeroTFC = T.id INNER JOIN
        Grupo Gru ON T.id = Gru.id INNER JOIN
        Aluno Al ON Gru.idNumeroAluno1 = Al.numeroAluno OR Gru.idNumeroAluno2 = Al.numeroAluno
    WHERE
        Al.ECTS > 0; 
    COMMIT TRANSACTION; 
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;
END CATCH;

select * from AvaliacaoDisciplinaAluno where nota > 0;

select * from AvaliacaoDisciplinaAluno where nota < 10 -- 0 results

UPDATE AvaliacaoDisciplinaAluno SET nota = 8 WHERE id % 6 = 0;

select * from AvaliacaoDisciplinaAluno where nota < 10 -- 2 results



--9 - Adicionar restrições
-- AvaliacaoDisciplinaAluno nota entre 0 e 20
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.CHECK_CONSTRAINTS WHERE CONSTRAINT_NAME = 'CH_RangeNota')
BEGIN
    ALTER TABLE AvaliacaoDisciplinaAluno
    ADD CONSTRAINT CH_RangeNota CHECK (nota >= 0 AND nota <= 20);
END;

--chaves unicas
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'UK_Curso_nome' AND TABLE_NAME = 'Curso')
BEGIN
    ALTER TABLE Curso ADD CONSTRAINT UK_Curso_nome UNIQUE (nome);
END;
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'UK_Tecnologia_nome' AND TABLE_NAME = 'Tecnologia')
BEGIN
    ALTER TABLE Tecnologia ADD CONSTRAINT UK_Tecnologia_nome UNIQUE (nome);
END;
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'UK_Disciplina_nome' AND TABLE_NAME = 'Disciplina')
BEGIN
    ALTER TABLE Disciplina ADD CONSTRAINT UK_Disciplina_nome UNIQUE (nome);
END;
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'UK_Grupo_idNumeroAluno1' AND TABLE_NAME = 'Grupo')
BEGIN
    ALTER TABLE Grupo ADD CONSTRAINT UK_Grupo_idNumeroAluno1 UNIQUE (idNumeroAluno1);
END;
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'UK_Grupo_idNumeroAluno2' AND TABLE_NAME = 'Grupo')
BEGIN
    ALTER TABLE Grupo ADD CONSTRAINT UK_Grupo_idNumeroAluno2 UNIQUE (idNumeroAluno2);
END;
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'UK_ProfessorNDEISI_email' AND TABLE_NAME = 'ProfessorNDEISI')
BEGIN
    ALTER TABLE ProfessorNDEISI ADD CONSTRAINT UK_ProfessorNDEISI_email UNIQUE (email);
END;
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'UK_ProfessorNDEISI_numeroContato' AND TABLE_NAME = 'ProfessorNDEISI')
BEGIN
    ALTER TABLE ProfessorNDEISI ADD CONSTRAINT UK_ProfessorNDEISI_numeroContato UNIQUE (numeroContato);
END;

GO


IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE COLUMN_NAME = 'temIdTfc' AND TABLE_NAME = 'TFCCurso')
BEGIN
    ALTER TABLE TFCCurso ADD temIdTfc BIGINT;
END;

GO

UPDATE TFCCurso SET temIdTfc = idTFC;

DROP INDEX IF EXISTS index_tfc_id ON TFC;
DROP INDEX IF EXISTS index_tfc_curso_idTfc ON TFCCurso;

GO
alter table TFCCurso drop column idTFC
GO
alter table TFCCurso add idTFC varchar(255)
GO

--contagem de atualizacoes que vao ter de ser feitas
select count(*) from TFC JOIN TFCCurso on TFC.id = TFCCurso.temIdTfc --334

BEGIN TRANSACTION UpdateKeysTFCCur
	UPDATE TFCCurso SET idTFC = TFC.idTFC FROM TFC WHERE TFCCurso.temIdTfc = TFC.id;
	--contagem de atualizacoes que foram feitas
	select count(*) from TFC JOIN TFCCurso on TFC.idTFC = TFCCurso.idTFC --334

	
 COMMIT TRANSACTION UpdateKeysTFCCur

 SELECT * FROM TFCCurso

--alter table TFCCurso drop column temIdTfc

go