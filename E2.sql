--Lucas Botelho a22201202
--Tiago Mota a22207337
--Marcos Gil a22102606
--Gonçalo Neves a22204044
USE tfc;


--Etapa 2
--6 
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
    ALTER TABLE TFCDisciplina ADD CONSTRAINT PK_TFCDisciplina PRIMARY KEY (id);
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
    ALTER TABLE TFCTecnologia ADD CONSTRAINT PK_TFCTecnologia PRIMARY KEY (id);
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

--10

 --informações da tabela TFC onde o idGrupo é nulo e, ao mesmo tempo e
 --há pelo menos uma entrada na tabela Inscricao associada a esse trabalho

SELECT
    TFC.id AS idTFC,
    TFC.titulo,
    TFC.idGrupo AS idGrupoOriginal,
    (SELECT TOP 1 idNumeroGrupo FROM Inscricao WHERE Inscricao.idTFC = TFC.idtfc AND idNumeroGrupo IS NOT NULL) AS NovoIdGrupo
FROM
    TFC
WHERE
    TFC.idGrupo IS NULL
    AND EXISTS (SELECT 1 FROM Inscricao WHERE Inscricao.idTFC = TFC.idtfc AND idNumeroGrupo IS NOT NULL);

BEGIN TRANSACTION UpdateGrupos
	UPDATE TFC
	SET idGrupo = (SELECT TOP 1 idNumeroGrupo FROM Inscricao WHERE Inscricao.idTFC = TFC.idtfc AND idNumeroGrupo IS NOT NULL)
	WHERE
    TFC.idGrupo IS NULL
    AND EXISTS (SELECT 1 FROM Inscricao WHERE Inscricao.idTFC = TFC.idtfc AND idNumeroGrupo IS NOT NULL);

	SELECT
		TFC.id AS idTFC,
		TFC.titulo,
		TFC.idGrupo AS idGrupoOriginal,
		(SELECT TOP 1 idNumeroGrupo FROM Inscricao WHERE Inscricao.idTFC = TFC.idtfc AND idNumeroGrupo IS NOT NULL) AS NovoIdGrupo
	FROM
		TFC
	WHERE
		TFC.idGrupo IS NULL
		AND EXISTS (SELECT 1 FROM Inscricao WHERE Inscricao.idTFC = TFC.idtfc AND idNumeroGrupo IS NOT NULL);

	delete from TFC WHERE idGrupo not in (select id from Grupo);

	select * from tfc where idGrupo not in (select id from Grupo);

COMMIT TRANSACTION UpdateGrupos

BEGIN TRANSACTION;

SELECT * 
FROM Inscricao
WHERE idTFC IN (SELECT idTFC FROM TFC WHERE idGrupo IS NULL);

-- Remova as inscrições associadas a TFCs sem grupo
DELETE FROM Inscricao
WHERE idTFC IN (SELECT idTFC FROM TFC WHERE idGrupo IS NULL);

-- Remova os TFCs sem grupo
DELETE FROM TFC WHERE idGrupo IS NULL;

SELECT * FROM TFC

COMMIT TRANSACTION;

-- 11 E 12. Criar FKs
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



-- TFCTecnologia -> Tecnologia & TFCTecnologia -> TFC

BEGIN TRANSACTION UpdateKeys	
DELETE FROM TFCTecnologia
WHERE idTecnologia IN (
	SELECT TFCTecnologia.idTecnologia
	FROM TFCTecnologia
	LEFT JOIN Tecnologia ON TFCTecnologia.idTecnologia = Tecnologia.id
	WHERE Tecnologia.id IS NULL
);
COMMIT TRANSACTION UpdateKeys

alter table TFCTecnologia add temIdTfc bigint;
GO
UPDATE TFCTecnologia SET temIdTfc = idTFC;

DROP INDEX index_tfc_tecnologia_idTFC ON TFCTecnologia;
alter table TFCTecnologia drop column idTFC;
GO
alter table TFCTecnologia add idTFC varchar(255);
GO

BEGIN TRANSACTION UpdateKeysTFCTec
UPDATE TFCTecnologia
SET idTFC = TFC.idTFC
FROM TFC
WHERE TFCTecnologia.temIdTfc = TFC.id;
COMMIT TRANSACTION UpdateKeysTFCTec
alter table TFCTecnologia drop column temIdTfc;
GO

ALTER TABLE TFCTecnologia
ADD CONSTRAINT FK_TFCTecnologia_Tecnologia FOREIGN KEY (idTecnologia)
REFERENCES Tecnologia(id);

ALTER TABLE TFCTecnologia
ADD CONSTRAINT FK_TFCTecnologia_TFC FOREIGN KEY (idTfc)
REFERENCES TFC(idTfc);

-- AvaliacaoDisciciplinaAluno -> Aluno

ALTER TABLE AvaliacaoDisciplinaAluno ADD tempNumALuno bigint;
GO
UPDATE AvaliacaoDisciplinaAluno SET tempNumALuno = idNumeroAluno;

DROP INDEX index_avaliacao_disciplina_aluno_idNumeroAluno ON AvaliacaoDisciplinaAluno;

ALTER TABLE AvaliacaoDisciplinaAluno DROP COLUMN idNumeroAluno;
GO
ALTER TABLE AvaliacaoDisciplinaAluno ADD idNumeroAluno varchar(255);
 GO

BEGIN TRANSACTION AtualizarKeysAvalDisAl
UPDATE AvaliacaoDisciplinaAluno
SET idNumeroAluno = Aluno.numeroAluno
FROM Aluno
WHERE AvaliacaoDisciplinaAluno.id = Aluno.id;
COMMIT TRANSACTION AtualizarKeysAvalDisAl

-- Apagar dados que nao sao validos
DELETE FROM AvaliacaoDisciplinaAluno where idNumeroAluno is null;

ALTER TABLE AvaliacaoDisciplinaAluno DROP COLUMN tempNumALuno;
GO

ALTER TABLE AvaliacaoDisciplinaAluno
ADD CONSTRAINT FK_Aluno FOREIGN KEY (idNumeroAluno)
REFERENCES Aluno (numeroAluno);

-- TFCDisciplina -> TFC

ALTER TABLE TFCDisciplina ADD tempIdTFC bigint;
GO
UPDATE TFCDisciplina SET tempIdTFC = numeroTFC;

DROP INDEX index_tfc_disciplina_numeroTFC ON TFCDisciplina;

ALTER TABLE TFCDisciplina DROP COLUMN numeroTFC;
GO
ALTER TABLE TFCDisciplina ADD numeroTFC varchar(255);
GO
BEGIN TRANSACTION AtualizarKeysTFCDisciplina
UPDATE TFCDisciplina
SET numeroTFC = TFC.idtfc
FROM TFC
WHERE TFCDisciplina.numeroTFC = TFC.idtfc;
COMMIT TRANSACTION AtualizarKeysTFCDisciplina

-- Apagar dados que nao sao validos
DELETE FROM TFCDisciplina where numeroTFC is null;
ALTER TABLE TFCDisciplina DROP COLUMN tempIdTFC;
GO
ALTER TABLE TFCDisciplina
ADD CONSTRAINT tfcdisciplina_tfc_fk
FOREIGN KEY (numeroTFC)
REFERENCES TFC(idtfc);

-- TFC -> Grupo
ALTER TABLE TFC
ADD CONSTRAINT tfc_grupo_fk
FOREIGN KEY (idGrupo)
REFERENCES Grupo(id);

-- TFCCurso -> TFC
ALTER TABLE TFCCurso
ADD CONSTRAINT tfccurso_idtfc_fk
FOREIGN KEY (idTFC)
REFERENCES TFC(idtfc);

-- TFCCurso -> Curso
ALTER TABLE TFCCurso
ADD CONSTRAINT curso_tfccurso_fk
FOREIGN KEY (idCurso)
REFERENCES Curso(id);

-- HistoricoTFC -> TFC

SELECT * FROM HistoricoTFC WHERE idTFC NOT IN (SELECT idtfc FROM TFC)
DELETE FROM HistoricoTFC
WHERE idTFC NOT IN (SELECT idtfc FROM TFC);

ALTER TABLE HistoricoTFC
ADD CONSTRAINT tfc_tfchistorico_fk
FOREIGN KEY (idTFC)
REFERENCES TFC(idtfc);

-- Disciplina -> Curso
ALTER TABLE Disciplina
ADD CONSTRAINT disciplina_curso_fk
FOREIGN KEY (cursoAssociado)
REFERENCES Curso(id);

-- TFCDisciplina -> Disciplina
ALTER TABLE TFCDisciplina
ADD CONSTRAINT tfcdisc_disc_fk
FOREIGN KEY (idNumeroDisciplina)
REFERENCES Disciplina(id);

-- AvaliacaoDisciciplinaAluno -> Disciplina
ALTER TABLE AvaliacaoDisciplinaAluno
ADD CONSTRAINT tfcaval_disc_fk
FOREIGN KEY (idNumeroDisciplina)
REFERENCES Disciplina(id);

-- Inscricao -> Aluno 
ALTER TABLE Inscricao
ADD CONSTRAINT inscr_aluno_fk
FOREIGN KEY (numeroAluno)
REFERENCES Aluno(numeroAluno);

-- Grupo -> Aluno 1
ALTER TABLE Grupo
ADD CONSTRAINT grupo_aluno1_fk
FOREIGN KEY (idNumeroAluno1)
REFERENCES Aluno(numeroAluno);

-- Grupo -> Aluno 2
ALTER TABLE Grupo
ADD CONSTRAINT grupo_aluno2_fk
FOREIGN KEY (idNumeroAluno2)
REFERENCES Aluno(numeroAluno);

-- Inscricao -> TFC
select * from Inscricao where idTFC not in (select idTFC from tfc)
DELETE FROM Inscricao WHERE idTFC NOT IN (SELECT idtfc FROM TFC);

ALTER TABLE Inscricao
ADD CONSTRAINT inscricao_tfc_fk
FOREIGN KEY (idTFC)
REFERENCES TFC(idtfc);

-- HistoricoTFC -> Utilizador
BEGIN TRANSACTION UpdateUtilizadores

UPDATE HistoricoTFC
SET utilizador = (
    SELECT TOP 1 numeroProfessor
    FROM ProfessorDEISI
)
WHERE utilizador NOT IN (
    SELECT idIdentificacao
    FROM Utilizador
) AND
utilizador in (select nome from ProfessorDEISI
where nome in (select distinct(utilizador) from HistoricoTFC
where utilizador not in (select idIdentificacao from Utilizador)));

delete from HistoricoTFC where utilizador = (select TOP  1 utilizador from HistoricoTFC
where utilizador not in (select idIdentificacao from Utilizador))

select distinct(utilizador) from HistoricoTFC
where utilizador not in (select idIdentificacao from Utilizador) 

COMMIT TRANSACTION UpdateUtilizadores

ALTER TABLE HistoricoTFC
ADD CONSTRAINT histtfc_util_fk
FOREIGN KEY (utilizador)
REFERENCES Utilizador(idIdentificacao);

-- TFC -> ProfessorDEISI Orientador
ALTER TABLE TFC
ADD CONSTRAINT tfc_profdeisi_fk
FOREIGN KEY (orientador)
REFERENCES ProfessorDEISI(numeroProfessor);

-- TFC -> ProfessorDEISI Coorientador
ALTER TABLE TFC
ADD CONSTRAINT tfc_profdeisici_fk
FOREIGN KEY (coorientador)
REFERENCES ProfessorDEISI(numeroProfessor);

-- TFC -> Empresa 

-- Atualizar entidades que nao dao match para null
BEGIN TRANSACTION UpdateEntidadeValues
UPDATE TFC SET entidade = null WHERE entidade IS NOT NULL AND entidade NOT IN (SELECT id FROM Empresa_EntidadeExterna);
COMMIT TRANSACTION UpdateEntidadeValues;

ALTER TABLE TFC
ADD CONSTRAINT tfc_empresa_fk
FOREIGN KEY (entidade)
REFERENCES Empresa_EntidadeExterna(id);

--13 

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Aluno' AND COLUMN_NAME = 'estado')
BEGIN
    ALTER TABLE Aluno
    ADD estado VARCHAR(255);
END;
GO


SELECT estado FROM Aluno --tudo a null
--validar quais os alunos que vao ter valido ou excluido
SELECT Aluno.*, Grupo.*, TFC.*, CASE WHEN TFC.idGrupo IS NOT NULL THEN 'Válido' ELSE 'Excluído' END AS estado
FROM Aluno
LEFT JOIN Grupo ON Aluno.numeroAluno = Grupo.idNumeroAluno1 OR Aluno.numeroAluno = Grupo.idNumeroAluno2
LEFT JOIN TFC ON Grupo.id = TFC.idGrupo;

BEGIN TRANSACTION DefinirEstado;

	UPDATE Aluno SET estado = CASE WHEN idGrupo IS NOT NULL THEN 'Válido' ELSE 'Excluído' END FROM Aluno
	LEFT JOIN Grupo ON Aluno.numeroAluno = Grupo.idNumeroAluno1 OR Aluno.numeroAluno = Grupo.idNumeroAluno2
	LEFT JOIN TFC ON Grupo.id = idGrupo;


	SELECT estado FROM Aluno --alunos ja tem estado atribuido

COMMIT TRANSACTION DefinirEstado;


--14

---- [estado-tfc]
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'EstadoTFC')
BEGIN
    CREATE TABLE EstadoTFC (
        id INT NOT NULL PRIMARY KEY,
        nome VARCHAR(255) NOT NULL);
END;
IF NOT EXISTS (
    SELECT * 
    FROM EstadoTFC 
    WHERE id = 1
)
BEGIN
    INSERT INTO EstadoTFC (id, nome) 
    VALUES (1, 'Aguarda Aprovação');
    INSERT INTO EstadoTFC (id, nome) 
    VALUES (2, 'Recusado');
    INSERT INTO EstadoTFC (id, nome) 
    VALUES (3, 'Aguarda Atribuição');
    INSERT INTO EstadoTFC (id, nome) 
    VALUES (4, 'Atribuído');
    INSERT INTO EstadoTFC (id, nome) 
    VALUES (5, 'Publicado');
    INSERT INTO EstadoTFC (id, nome) 
    VALUES (6, 'Indisponível');
    INSERT INTO EstadoTFC (id, nome) 
    VALUES (7, 'Anulado');
END

GO

SELECT * FROM EstadoTFC

---- [estado-inscricoes]
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'EstadoInscricoes')
BEGIN
    CREATE TABLE EstadoInscricoes (
        id INT NOT NULL PRIMARY KEY,
        nome VARCHAR(255) NOT NULL);
END;
IF NOT EXISTS (
    SELECT * 
    FROM EstadoInscricoes 
    WHERE id = 1
)
BEGIN
    INSERT INTO EstadoInscricoes (id, nome) 
    VALUES (1, 'Aguarda Atribuição');
    INSERT INTO EstadoInscricoes (id, nome) 
    VALUES (2, 'Atribuído');
    INSERT INTO EstadoInscricoes (id, nome) 
    VALUES (3, 'Não Atribuído');
END
GO

---- [estado-aluno]
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'EstadoAluno')
BEGIN
    CREATE TABLE EstadoAluno (
        id INT NOT NULL PRIMARY KEY,
        nome VARCHAR(255) NOT NULL);
END;
IF NOT EXISTS (
    SELECT * 
    FROM EstadoAluno 
    WHERE id = 1
)
BEGIN
    INSERT INTO EstadoAluno (id, nome) 
    VALUES (1, 'Em Validação');
    INSERT INTO EstadoAluno (id, nome) 
    VALUES (2, 'Válido');
    INSERT INTO EstadoAluno (id, nome) 
    VALUES (3, 'Excluído');
END


--start Atualizar estado dos alunos
-- Adicionar uma coluna temporária para armazenar os estados atuais como varchar
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Aluno' AND COLUMN_NAME = 'estadoTemp')
BEGIN
    ALTER TABLE Aluno
    ADD estadoTemp VARCHAR(255);
END;
GO

-- Atualizar a coluna temporária com os valores atuais da coluna estado
UPDATE Aluno SET estadoTemp = estado;
UPDATE Aluno SET estado = NULL;
-- Alterar o tipo de dados da coluna estado para int
ALTER TABLE Aluno ALTER COLUMN estado INT;
GO


SELECT * FROM Aluno;

-- Atualizar a tabela Aluno com os IDs dos estados correspondentes
BEGIN TRANSACTION UpdateEstadoALuno;
	UPDATE Aluno
	SET estado = ea.id
	FROM Aluno a
	JOIN EstadoAluno ea ON a.estadoTemp = ea.nome;

	select distinct estado from Aluno

COMMIT TRANSACTION UpdateEstadoALuno

-- Remover a coluna temporária
ALTER TABLE Aluno DROP COLUMN estadoTemp;
--end atualizar estado dos alunos

--- start Atualizar estado dos tfc
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TFC' AND COLUMN_NAME = 'estadoTemp')
BEGIN
    ALTER TABLE TFC
    ADD estadoTemp VARCHAR(255);
END;
GO

-- Atualizar a coluna temporária com os valores atuais da coluna estado
UPDATE TFC SET estadoTemp = estado;
UPDATE TFC SET estado = NULL;
-- Alterar o tipo de dados da coluna estado para int
ALTER TABLE TFC ALTER COLUMN estado INT;
GO

-- Selecionar todos os registros da tabela TFC
SELECT * FROM TFC;

-- Atualizar a tabela TFC com os IDs dos estados correspondentes
BEGIN TRANSACTION UpdateEstadoTFC;
    UPDATE TFC
    SET estado = et.id
    FROM TFC t
    JOIN EstadoTFC et ON t.estadoTemp = et.nome;

    SELECT DISTINCT estado FROM TFC;

COMMIT TRANSACTION UpdateEstadoTFC;

-- Remover a coluna temporária
ALTER TABLE TFC DROP COLUMN estadoTemp;

--end atualizar estado dos tfc

--- start Atualizar estado dos inscricao
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Inscricao' AND COLUMN_NAME = 'estadoTemp')
BEGIN
    ALTER TABLE Inscricao
    ADD estadoTemp VARCHAR(255);
END;
GO

-- Atualizar a coluna temporária com os valores atuais da coluna estado
UPDATE Inscricao SET estadoTemp = estado;
UPDATE Inscricao SET estado = NULL;
-- Alterar o tipo de dados da coluna estado para int
ALTER TABLE Inscricao ALTER COLUMN estado INT;
GO

-- Selecionar todos os registros da tabela Inscricao
SELECT * FROM Inscricao;

-- Atualizar a tabela Inscricao com os IDs dos estados correspondentes
BEGIN TRANSACTION UpdateEstadoInscricao;
    UPDATE Inscricao
    SET estado = et.id
    FROM Inscricao t
    JOIN EstadoInscricoes et ON t.estadoTemp = et.nome;

    SELECT DISTINCT estado FROM Inscricao;

COMMIT TRANSACTION UpdateEstadoInscricoes;

-- Remover a coluna temporária
ALTER TABLE Inscricao DROP COLUMN estadoTemp;

--end atualizar estado dos Inscricao


IF NOT EXISTS (
    SELECT 1
    FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
    WHERE CONSTRAINT_NAME = 'inscricao_estado_fk'
)
BEGIN
    ALTER TABLE Inscricao
    ADD CONSTRAINT inscricao_estado_fk
    FOREIGN KEY (estado)
    REFERENCES EstadoInscricoes(id);
END;

IF NOT EXISTS (
    SELECT 1
    FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
    WHERE CONSTRAINT_NAME = 'aluno_estado_fk'
)
BEGIN
    ALTER TABLE Aluno
    ADD CONSTRAINT aluno_estado_fk
    FOREIGN KEY (estado)
    REFERENCES EstadoAluno(id);
END;


IF NOT EXISTS (
    SELECT 1
    FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
    WHERE CONSTRAINT_NAME = 'tfc_estado_fk'
)
BEGIN
    ALTER TABLE TFC
    ADD CONSTRAINT tfc_estado_fk
    FOREIGN KEY (estado)
    REFERENCES EstadoTFC(id);
END;



