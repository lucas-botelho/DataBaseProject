--Lucas Botelho a22201202
--Tiago Mota a22207337
--Marcos Gil a22102606
--Gonçalo Neves a22204044

--Etapa 2
--6 

use tfc

-- Aluno
ALTER TABLE Aluno ADD CONSTRAINT PK_Aluno_numeroAluno PRIMARY KEY (numeroAluno);
--AvaliacaoDisciplinaAluno
ALTER TABLE AvaliacaoDisciplinaAluno ADD CONSTRAINT PK_AvaliacaoDisciplinaAluno_id PRIMARY KEY (id);
-- Curso
ALTER TABLE Curso ADD CONSTRAINT PK_Curso_id PRIMARY KEY (id);
-- Disciplina
ALTER TABLE Disciplina ADD CONSTRAINT PK_Disciplina_id PRIMARY KEY (id);
-- Empresa_EntidadeExterna 
ALTER TABLE Empresa_EntidadeExterna ADD CONSTRAINT PK_Empresa_EntidadeExterna_idEmpresa PRIMARY KEY (id);
-- Grupo 
ALTER TABLE Grupo ADD CONSTRAINT PK_Grupo_id PRIMARY KEY (id);
--HistoricoTFC
ALTER TABLE HistoricoTFC ADD CONSTRAINT PK_HistoricoTFC_id PRIMARY KEY (id);
--Inscricao
ALTER TABLE Inscricao ADD CONSTRAINT PK_Inscricao_id PRIMARY KEY (id);
-- ProfessorDEISI
ALTER TABLE ProfessorDEISI ADD CONSTRAINT PK_ProfessorDEISI_numeroProfessor PRIMARY KEY (numeroProfessor);
-- ProfessorNDEISI
ALTER TABLE ProfessorNDEISI ALTER COLUMN idProfessor varchar(255) NOT NULL;
ALTER TABLE ProfessorNDEISI ADD CONSTRAINT PK_ProfessorNDEISI_idProfessor PRIMARY KEY (idProfessor);
-- Tecnologia
ALTER TABLE Tecnologia ADD CONSTRAINT PK_Tecnologia_id PRIMARY KEY (id);
-- TFC 
ALTER TABLE TFC ADD CONSTRAINT PK_TFC_id PRIMARY KEY (id);
-- TFCCurso 
ALTER TABLE TFCCurso ADD CONSTRAINT PK_TFCCurso_id PRIMARY KEY (id);
-- TFCDisciplina 
ALTER TABLE TFCDisciplina ADD CONSTRAINT PK_TFCDisciplina_id PRIMARY KEY (id);
-- TFCTecnologia 
ALTER TABLE TFCTecnologia ADD CONSTRAINT PK_TFCTecnologia_id PRIMARY KEY (id);
-- Utilizador
ALTER TABLE Utilizador ALTER COLUMN idIdentificacao varchar(255) NOT NULL;
ALTER TABLE Utilizador ADD CONSTRAINT PK_Utilizador_idIdentificacao PRIMARY KEY (idIdentificacao);


--7 
--adicionar coluna
 ALTER TABLE Aluno ADD ECTS INT NOT NULL DEFAULT 0;
 -- 10 alunos com entre 0 a 180 ects
 UPDATE TOP (10) Aluno SET ECTS = ROUND(RAND(CONVERT(VARBINARY, NEWID())) * 180, 0);
 select * from Aluno where ECTS > 0; --10 RESULTADOS

 --8
BEGIN TRANSACTION InserirAvaliacoes;
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

 select * from AvaliacaoDisciplinaAluno where nota > 0;

COMMIT TRANSACTION InserirAvaliacoes;
--ROLLBACK TRANSACTION InserirAvaliacoes


select * from AvaliacaoDisciplinaAluno where nota < 10 -- 0 results

UPDATE AvaliacaoDisciplinaAluno SET nota = 8 WHERE id % 6 = 0;

select * from AvaliacaoDisciplinaAluno where nota < 10 -- 2 results

--9 - Adicionar restrições
-- AvaliacaoDisciplinaAluno nota entre 0 e 20
ALTER TABLE AvaliacaoDisciplinaAluno ADD CONSTRAINT CH_RangeNota CHECK (nota >= 0 AND nota <= 20);

--chaves unicas
ALTER TABLE Curso ADD CONSTRAINT UK_Curso_nome UNIQUE (nome);  
ALTER TABLE Tecnologia ADD CONSTRAINT UK_Tecnologia_nome UNIQUE (nome);
ALTER TABLE Disciplina ADD CONSTRAINT UK_Disciplina_nome UNIQUE (nome);
ALTER TABLE Aluno ADD CONSTRAINT UKAluno_numeroAluno UNIQUE (numeroAluno);
ALTER TABLE Grupo ADD CONSTRAINT UK_Grupo_idNumeroAluno1 UNIQUE (idNumeroAluno1);
ALTER TABLE Grupo ADD CONSTRAINT UK_Grupo_idNumeroAluno2 UNIQUE (idNumeroAluno2);
ALTER TABLE ProfessorNDEISI ADD CONSTRAINT UK_ProfessorNDEISI_email UNIQUE (email);
ALTER TABLE ProfessorNDEISI ADD CONSTRAINT UK_ProfessorNDEISI_idProfessor UNIQUE (idProfessor);
ALTER TABLE ProfessorNDEISI ADD CONSTRAINT UK_ProfessorNDEISI_numeroContato UNIQUE (numeroContato);
ALTER TABLE ProfessorDEISI ADD CONSTRAINT UK_ProfessorDEISI_numeroProfessor UNIQUE (numeroProfessor);
ALTER TABLE Utilizador ADD CONSTRAINT UK_Utilizador_idIdentificacao UNIQUE (idIdentificacao);

--not null nao foi necessario porque foi tratado na etapa 1

--10

--11 e 12
 --AvaliacaoDisciplinaAluno
 select * from AvaliacaoDisciplinaAluno

 --mudar fk em AvaliacaoDisciplinaAluno para varchar(255) e fazer match com o id bigint do id dos alunos

 ALTER TABLE AvaliacaoDisciplinaAluno ADD tempNumALuno bigint;

 UPDATE AvaliacaoDisciplinaAluno SET tempNumALuno = idNumeroAluno;

 DROP INDEX index_AvaliacaoDisciplinaAluno_idNumeroAluno ON AvaliacaoDisciplinaAluno;

 ALTER TABLE AvaliacaoDisciplinaAluno DROP COLUMN idNumeroAluno;

 ALTER TABLE AvaliacaoDisciplinaAluno ADD idNumeroAluno varchar(255);

  select id, idNumeroAluno from AvaliacaoDisciplinaAluno

 SELECT 
    Aluno.id AS AlunoId,
    Aluno.numeroAluno AS AlunoNumeroAluno,
    AvaliacaoDisciplinaAluno.id AS AvaliacaoId
 FROM Aluno JOIN AvaliacaoDisciplinaAluno ON Aluno.id = AvaliacaoDisciplinaAluno.id;
 
 BEGIN TRANSACTION AtualizarKeysAvalDisAl
	UPDATE AvaliacaoDisciplinaAluno
	SET idNumeroAluno = Aluno.numeroAluno
	FROM Aluno
	WHERE AvaliacaoDisciplinaAluno.id = Aluno.id;

	
	select id, idNumeroAluno from AvaliacaoDisciplinaAluno

	 SELECT 
		Aluno.id AS AlunoId,
		Aluno.numeroAluno AS AlunoNumeroAluno,
		AvaliacaoDisciplinaAluno.id AS AvaliacaoId
	 FROM Aluno JOIN AvaliacaoDisciplinaAluno ON Aluno.id = AvaliacaoDisciplinaAluno.id;

 COMMIT TRANSACTION AtualizarKeysAvalDisAl

 --apagar dados que nao sao validos
 DELETE FROM AvaliacaoDisciplinaAluno where idNumeroAluno is null

 ALTER TABLE AvaliacaoDisciplinaAluno DROP COLUMN tempNumALuno;

 --meter fk no idNumeroAluno - numeroAluno 
    ALTER TABLE AvaliacaoDisciplinaAluno
    ADD CONSTRAINT FK_Aluno FOREIGN KEY (idNumeroAluno)
    REFERENCES Aluno (numeroAluno);

	 --meter fk no idNumeroDisciplina - id
    ALTER TABLE AvaliacaoDisciplinaAluno
    ADD CONSTRAINT FK_Disciplina FOREIGN KEY (idNumeroDisciplina)
    REFERENCES Disciplina (id);

    --TFCDisciplina
    ALTER TABLE TFCDisciplina
    ADD CONSTRAINT FK_TFC_Disciplina FOREIGN KEY (idNumeroDisciplina)
    REFERENCES Disciplina (id);


/*Alterar o pk do tfc para idtfc
 alterar fk de TFCCurso e TFCTecnologia para idtfc
*/



--Eliminar Restrições Únicas e Eliminar o Índice
ALTER TABLE TFC DROP CONSTRAINT PK_TFC_id;
DROP INDEX indexTFC_id ON TFC;
DROP INDEX indexTFC_idtfc ON TFC;
--ALTER TABLE TFC DROP CONSTRAINT UK_TFC_idTFC;

-- Alterar a coluna para não permitir nulos
ALTER TABLE TFC ALTER COLUMN idTFC varchar(255) NOT NULL;
-- Adicionar a coluna idTFC como chave primária
ALTER TABLE TFC ADD CONSTRAINT PK_TFC_idTFC PRIMARY KEY (idTFC);



 --ligar TFCCurso ao idTFC correto
 select TFC.id as idTFCerrado, TFC.Titulo as titulotfc, 
		TFCCurso.idTFC as idNoTFCCurso,
		TFCTecnologia.idTFC as idNoTFCTecnologia
	from TFC JOIN TFCCurso on TFC.id = TFCCurso.idTFC
		JOIN TFCTecnologia on TFC.id = TFCCurso.idTFC


alter table TFCCurso add temIdTfc bigint
 UPDATE TFCCurso SET temIdTfc = idTFC;
 alter table TFCCurso drop column idTFC
 alter table TFCCurso add idTFC varchar(255)

 select TFC.id as idTFCerrado, TFC.Titulo as titulotfc, 
		TFCCurso.idTFC as idNoTFCCurso,
		TFCTecnologia.idTFC as idNoTFCTecnologia
	from TFC JOIN TFCCurso on TFC.id = TFCCurso.idTFC

select TFC.id as idTFNoTFCCerrado, TFC.Titulo as titulotfc, TFCCurso.temIdTfc as idNoTFCCurso
from TFC JOIN TFCCurso on TFC.id = TFCCurso.temIdTfc

--contagem de atualizacoes que vao ter de ser feitas
select count(*) from TFC JOIN TFCCurso on TFC.id = TFCCurso.temIdTfc --334

 BEGIN TRANSACTION UpdateKeysTFCCur
	UPDATE TFCCurso SET idTFC = TFC.idTFC FROM TFC WHERE TFCCurso.temIdTfc = TFC.id;
	--contagem de atualizacoes que foram feitas
	select count(*) from TFC JOIN TFCCurso on TFC.idTFC = TFCCurso.idTFC --334

	
 COMMIT TRANSACTION UpdateKeysTFCCur

  alter table TFCCurso drop column temIdTfc

ALTER TABLE TFCCurso
ADD CONSTRAINT FK_TFCCurso_TFC FOREIGN KEY (idTfc)
REFERENCES TFC (idTfc);



  --ligar TFCTecnologia ao idTFC correto
  select * from TFCTecnologia
  alter table TFCTecnologia add temIdTfc bigint
 UPDATE TFCTecnologia SET temIdTfc = idTFC;
 alter table TFCTecnologia drop column idTFC
 alter table TFCTecnologia add idTFC varchar(255)

select TFC.id as idTFNoTFCCerrado, TFC.Titulo as titulotfc, TFCTecnologia.temIdTfc as idNoTFCCurso
from TFC JOIN TFCTecnologia on TFC.id = TFCTecnologia.temIdTfc

--contagem de atualizacoes que vao ter de ser feitas
select count(*) from TFC JOIN TFCTecnologia on TFC.id = TFCTecnologia.temIdTfc --983


 BEGIN TRANSACTION UpdateKeysTFCTec
	UPDATE TFCTecnologia
	SET idTFC = TFC.idTFC
	FROM TFC
	WHERE TFCTecnologia.temIdTfc = TFC.id;

	
	--contagem de atualizacoes que foram feitas
	select count(*) from TFC JOIN TFCTecnologia on TFC.idTFC = TFCTecnologia.idTFC --983

	
COMMIT TRANSACTION UpdateKeysTFCTec

   alter table TFCTecnologia drop column temIdTfc

ALTER TABLE TFCTecnologia
ADD CONSTRAINT FK_TFCTecnologia_TFC FOREIGN KEY (idTfc)
REFERENCES TFC (idTfc);

--confirmar que os ids alteraram
select * from TFCTecnologia

--TFCCurso
ALTER TABLE TFCCurso
ADD CONSTRAINT FK_TFCCurso_Curso FOREIGN KEY (idCurso)
REFERENCES Curso (id);

--ids que existem em tfctecnologia mas nao em tecnologia, 2 resultados id = 45
SELECT Tecnologia.id as IDdaTECNOLOGIA, Tecnologia.nome as nomeDAtecnologia, TFCTecnologia.id as IDnaTABELAtfctecnologia, TFCTecnologia.idTecnologia as idtecnologiaNAtabelaTFCTECNOLOGIA FROM TFCTecnologia
LEFT JOIN Tecnologia ON TFCTecnologia.idTecnologia = Tecnologia.id
WHERE Tecnologia.id IS NULL;

 BEGIN TRANSACTION UpdateKeys	
	DELETE FROM TFCTecnologia
	WHERE idTecnologia IN (
		SELECT TFCTecnologia.idTecnologia
		FROM TFCTecnologia
		LEFT JOIN Tecnologia ON TFCTecnologia.idTecnologia = Tecnologia.id
		WHERE Tecnologia.id IS NULL
	);


    ALTER TABLE TFCTecnologia
    ADD CONSTRAINT FK_TFCTecnologia_Tecnologia FOREIGN KEY (idTecnologia)
    REFERENCES Tecnologia (id);

COMMIT TRANSACTION UpdateKeys
--ROLLBACK TRANSACTION UpdateKeys


ALTER TABLE HistoricoTFC
ADD CONSTRAINT FK_HistoricoTFC_IDTFC FOREIGN KEY (idTFC)
REFERENCES TFC (idTFC);

SELECT TFC.id AS ID_do_TFC_sem_Entidade
FROM TFC
LEFT JOIN Empresa_EntidadeExterna ON TFC.entidade = Empresa_EntidadeExterna.id
WHERE Empresa_EntidadeExterna.id IS NULL;




--todos tem obrigatoriamente orientador -> descricao funcional A.5
-- apagar dependentes da tabela TFCCurso primeiro

select * from tfc where orientador IS NULL;

DELETE FROM TFCCurso
WHERE idTFC IN (SELECT idTFC FROM TFC WHERE orientador IS NULL);

DELETE FROM HistoricoTFC
WHERE idTFC IN (SELECT idTFC FROM TFC WHERE orientador IS NULL);

SELECT ht.*
FROM HistoricoTFC ht
JOIN TFC t ON ht.idTFC = t.idtfc
WHERE t.orientador IS NULL;

-- apagar registros da tabela TFC
DELETE FROM TFC
WHERE orientador IS NULL;

select * from tfc where orientador IS NULL;

--professor que nao existe mas o tfc esta a referenciar
SELECT TFC.id AS idTFC,
       TFC.orientador AS orientador,
       ProfessorDEISI.numeroProfessor AS existingNumeroProfessor
FROM TFC
LEFT JOIN ProfessorDEISI ON TFC.orientador = ProfessorDEISI.numeroProfessor
WHERE TFC.orientador IS NOT NULL
      AND ProfessorDEISI.numeroProfessor IS NULL;

BEGIN TRANSACTION ExclusaoTFCSemCorrespondencia;
--apagar dependentes
	DELETE FROM TFCCurso
	WHERE idTFC IN (SELECT idTFC FROM TFC WHERE orientador IS NOT NULL AND orientador NOT IN (SELECT numeroProfessor FROM ProfessorDEISI));
	
	DELETE FROM TFCTecnologia
	WHERE idTFC IN (SELECT idTFC FROM TFC WHERE orientador IS NOT NULL AND orientador NOT IN (SELECT numeroProfessor FROM ProfessorDEISI));

	DELETE FROM HistoricoTFC
	WHERE idTFC IN (SELECT idTFC FROM TFC WHERE orientador IS NOT NULL AND orientador NOT IN (SELECT numeroProfessor FROM ProfessorDEISI));

	-- apagar TFC sem correspondência ProfessorDEISI
	DELETE FROM TFC
	WHERE orientador IS NOT NULL
		  AND orientador NOT IN (SELECT numeroProfessor FROM ProfessorDEISI);

	-- Verificar 
	SELECT * FROM TFC
	WHERE orientador IS NOT NULL
		  AND orientador NOT IN (SELECT numeroProfessor FROM ProfessorDEISI);

COMMIT TRANSACTION ExclusaoTFCSemCorrespondencia;

ALTER TABLE TFC
ADD CONSTRAINT FK_TFC_orientador
FOREIGN KEY (orientador) REFERENCES ProfessorDEISI(numeroProfessor);

-- entidades que nao existem
SELECT TFC.entidade AS entidade
FROM TFC
WHERE TFC.entidade IS NOT NULL
      AND TFC.entidade NOT IN (SELECT id FROM Empresa_EntidadeExterna);

	  --validar que nao existem
SELECT *
FROM Empresa_EntidadeExterna
WHERE id IN (
    SELECT TFC.entidade AS entidade
    FROM TFC
    WHERE TFC.entidade IS NOT NULL
          AND TFC.entidade NOT IN (SELECT id FROM Empresa_EntidadeExterna)
);

-- atualizar entidades que nao dao match para null
BEGIN TRANSACTION UpdateEntidadeValues
	UPDATE TFC SET entidade = null WHERE entidade IS NOT NULL AND entidade NOT IN (SELECT id FROM Empresa_EntidadeExterna);

	  --ja nao existem erros
	  SELECT TFC.entidade AS entidade FROM TFC
		WHERE TFC.entidade IS NOT NULL AND TFC.entidade NOT IN (SELECT id FROM Empresa_EntidadeExterna);


COMMIT TRANSACTION UpdateEntidadeValues;

ALTER TABLE TFC
ADD CONSTRAINT FK_EntidadeExt_id FOREIGN KEY (entidade)
REFERENCES Empresa_EntidadeExterna (id);

ALTER TABLE TFC
ADD CONSTRAINT FK_Grupo_idGrupo FOREIGN KEY (idGrupo)
REFERENCES Grupo (id);

ALTER TABLE Grupo
ADD CONSTRAINT FK_Grupo_numAluno1 FOREIGN KEY (idNumeroAluno1)
REFERENCES Aluno (numeroAluno);

-- identificar valores na coluna Grupo.idNumeroAluno2 sem correspondência em Aluno
SELECT G.idNumeroAluno2
FROM Grupo G
LEFT JOIN Aluno A ON G.idNumeroAluno2 = A.numeroAluno
WHERE G.idNumeroAluno2 IS NOT NULL
      AND A.numeroAluno IS NULL;


--verificar se aluno com esse id existe
	  SELECT A.*
FROM Aluno A
JOIN (
    SELECT G.idNumeroAluno2
    FROM Grupo G
    LEFT JOIN Aluno A ON G.idNumeroAluno2 = A.numeroAluno
    WHERE G.idNumeroAluno2 IS NOT NULL
          AND A.numeroAluno IS NULL
) NonMatchingGrupos ON A.numeroAluno = NonMatchingGrupos.idNumeroAluno2;


--nao existe portanto o problema esta no Grupo
BEGIN TRANSACTION AtualizacaoValoresNull;
	UPDATE Grupo
	SET idNumeroAluno2 = NULL
	FROM Grupo G
	LEFT JOIN Aluno A ON G.idNumeroAluno2 = A.numeroAluno
	WHERE G.idNumeroAluno2 IS NOT NULL
		  AND A.numeroAluno IS NULL;

		  --1 row afetada, esta certo
			SELECT * FROM Grupo;--validar que ja nao existe aHugo

COMMIT TRANSACTION AtualizacaoValoresNull;

ALTER TABLE Grupo
ADD CONSTRAINT FK_Grupo_numAluno2 FOREIGN KEY (idNumeroAluno2)
REFERENCES Aluno (numeroAluno);


--ids de grupo que nao existem em grupo
SELECT I.idNumeroGrupo FROM Inscricao I
LEFT JOIN Grupo G ON I.idNumeroGrupo = G.id
WHERE I.idNumeroGrupo IS NOT NULL AND G.id IS NULL;

BEGIN TRANSACTION AtualizacaoValoresNull;
UPDATE Inscricao
SET idNumeroGrupo = NULL
FROM Inscricao I
LEFT JOIN Grupo G ON I.idNumeroGrupo = G.id
WHERE I.idNumeroGrupo IS NOT NULL
      AND G.id IS NULL;

	  -- ja nao da results
	  SELECT I.idNumeroGrupo FROM Inscricao I
LEFT JOIN Grupo G ON I.idNumeroGrupo = G.id
WHERE I.idNumeroGrupo IS NOT NULL AND G.id IS NULL;

COMMIT TRANSACTION AtualizacaoValoresNull;


ALTER TABLE Inscricao
ADD CONSTRAINT FK_Inscricao_idNumeroGrupo FOREIGN KEY (idNumeroGrupo)
REFERENCES Grupo (id);

--ids de tfc que nao existem em inscricao
SELECT I.idTFC
FROM Inscricao I
LEFT JOIN TFC T ON I.idTFC = T.idTFC
WHERE I.idTFC IS NOT NULL
      AND T.idTFC IS NULL;

	  -- Inscricao sem martch em idTFC 
SELECT I.*
FROM Inscricao I
LEFT JOIN TFC T ON I.idTFC = T.idTFC
WHERE I.idTFC IS NOT NULL
      AND T.idTFC IS NULL;

	  --valores de idTFC para NULL nas linhas onde não ha match para TFC
BEGIN TRANSACTION AtualizacaoValoresNull;
	DELETE FROM Inscricao FROM Inscricao I
	LEFT JOIN TFC T ON I.idTFC = T.idTFC
	WHERE I.idTFC IS NOT NULL AND T.idTFC IS NULL;

	--validar
	SELECT I.* FROM Inscricao I 
	LEFT JOIN TFC T ON I.idTFC = T.idTFC
	WHERE I.idTFC IS NOT NULL AND T.idTFC IS NULL;

COMMIT TRANSACTION AtualizacaoValoresNull;


ALTER TABLE Inscricao
ADD CONSTRAINT FK_Inscricao_idtfc FOREIGN KEY (idTFC)
REFERENCES TFC (idTFC);

--erro, podem ser qualquer tipo de pessoa, professor, empregado, aluno
/*
ALTER TABLE TFC
ADD CONSTRAINT FK_TFC_preponente FOREIGN KEY (preponente)
REFERENCES Aluno (numeroAluno);
*/
SELECT T.preponente
FROM TFC T
LEFT JOIN Aluno A ON T.preponente = A.numeroAluno
WHERE T.preponente IS NOT NULL
      AND A.numeroAluno IS NULL;


/*
CREATE TABLE Professor (
    id bigint NOT NULL PRIMARY KEY,
    email varchar(255) NOT NULL,
    nome varchar(255) NOT NULL,
    numeroContato int NOT NULL,
);
*/



--13 

ALTER TABLE Aluno
ADD estado VARCHAR(255); 

SELECT estado FROM Aluno --tudo a null
--validar quais os alunos que vao ter valido ou excluido
SELECT Aluno.*, Grupo.*, TFC.*, CASE WHEN TFC.idGrupo IS NOT NULL THEN 'válido' ELSE 'excluído' END AS estado
FROM Aluno
LEFT JOIN Grupo ON Aluno.numeroAluno = Grupo.idNumeroAluno1 OR Aluno.numeroAluno = Grupo.idNumeroAluno2
LEFT JOIN TFC ON Grupo.id = TFC.idGrupo;

BEGIN TRANSACTION DefinirEstado;

	UPDATE Aluno SET estado = CASE WHEN idGrupo IS NOT NULL THEN 'válido' ELSE 'excluído' END FROM Aluno
	LEFT JOIN Grupo ON Aluno.numeroAluno = Grupo.idNumeroAluno1 OR Aluno.numeroAluno = Grupo.idNumeroAluno2
	LEFT JOIN TFC ON Grupo.id = idGrupo;


	SELECT estado FROM Aluno --alunos ja tem estado atribuido

COMMIT TRANSACTION DefinirEstado;
