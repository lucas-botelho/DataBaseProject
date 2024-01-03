--Lucas Botelho a22201202
--Tiago Mota a22207337
--Marcos Gil a22102606
--Gonçalo Neves a22204044
USE tfc;


--Etapa 2
--6 
--Validacao dos dados antes das constraints
--Todas as disciplinas tem um curso associados
SELECT
    (SELECT COUNT(*) FROM Disciplina WHERE cursoAssociado NOT IN (SELECT id FROM Curso)) AS NotInCount,
    (SELECT COUNT(*) FROM Disciplina WHERE cursoAssociado IS NULL) AS NullCount;

BEGIN TRANSACTION DeleteNotInOrNull;
    DELETE FROM Disciplina WHERE cursoAssociado NOT IN (SELECT id FROM Curso) or cursoAssociado IS NULL;

	SELECT
		(SELECT COUNT(*) FROM Disciplina WHERE cursoAssociado NOT IN (SELECT id FROM Curso)) AS NotInCount,
		(SELECT COUNT(*) FROM Disciplina WHERE cursoAssociado IS NULL) AS NullCount;

 COMMIT TRANSACTION DeleteNotInOrNull;

 GO
 
 --Todos tfccurso tem idcurso
SELECT
    (SELECT COUNT(*) FROM TFCCurso WHERE idCurso NOT IN (SELECT id FROM Curso)) AS NotInCount,
    (SELECT COUNT(*) FROM TFCCurso WHERE idCurso IS NULL) AS NullCount;

BEGIN TRANSACTION DeleteNotInOrNull;
    DELETE FROM Disciplina WHERE cursoAssociado NOT IN (SELECT id FROM Curso) or cursoAssociado IS NULL;

	SELECT
    (SELECT COUNT(*) FROM TFCCurso WHERE idCurso NOT IN (SELECT id FROM Curso)) AS NotInCount,
    (SELECT COUNT(*) FROM TFCCurso WHERE idCurso IS NULL) AS NullCount;

 COMMIT TRANSACTION DeleteNotInOrNull;

 GO 

  --Todos tfTecnologia tem idtecnologia
SELECT
    (SELECT COUNT(*) FROM TFCTecnologia WHERE idTecnologia NOT IN (SELECT id FROM Tecnologia)) AS NotInCount,
    (SELECT COUNT(*) FROM TFCTecnologia WHERE idTecnologia IS NULL) AS NullCount;
	--dois registos em tfctecnologia tem ids que nao existem em tecnologia. tem de ser apagados

BEGIN TRANSACTION DeleteNotInOrNull;
    DELETE FROM TFCTecnologia WHERE idTecnologia NOT IN (SELECT id FROM Tecnologia) or idTecnologia IS NULL;

	SELECT
    (SELECT COUNT(*) FROM TFCTecnologia WHERE idTecnologia NOT IN (SELECT id FROM Tecnologia)) AS NotInCount,
    (SELECT COUNT(*) FROM TFCTecnologia WHERE idTecnologia IS NULL) AS NullCount;

 COMMIT TRANSACTION DeleteNotInOrNull;

 GO 
  
  --Todos tfcdisciplina tem idNumeroDisciplina
SELECT
    (SELECT COUNT(*) FROM TFCDisciplina WHERE idNumeroDisciplina NOT IN (SELECT id FROM Disciplina)) AS NotInCount,
    (SELECT COUNT(*) FROM TFCDisciplina WHERE idNumeroDisciplina IS NULL) AS NullCount;

BEGIN TRANSACTION DeleteNotInOrNull;
    DELETE FROM TFCDisciplina WHERE idNumeroDisciplina NOT IN (SELECT id FROM Disciplina) or idNumeroDisciplina IS NULL;
	   
   SELECT
    (SELECT COUNT(*) FROM TFCDisciplina WHERE idNumeroDisciplina NOT IN (SELECT id FROM Disciplina)) AS NotInCount,
    (SELECT COUNT(*) FROM TFCDisciplina WHERE idNumeroDisciplina IS NULL) AS NullCount;

 COMMIT TRANSACTION DeleteNotInOrNull;

 GO
 
   --Todos avaliacaodisciplinaluno tem idNumeroDisciplina
SELECT
    (SELECT COUNT(*) FROM AvaliacaoDisciplinaAluno WHERE idNumeroDisciplina NOT IN (SELECT id FROM Disciplina)) AS NotInCount,
    (SELECT COUNT(*) FROM AvaliacaoDisciplinaAluno WHERE idNumeroDisciplina IS NULL) AS NullCount;

BEGIN TRANSACTION DeleteNotInOrNull;
    DELETE FROM AvaliacaoDisciplinaAluno WHERE idNumeroDisciplina NOT IN (SELECT id FROM Disciplina) or idNumeroDisciplina IS NULL;
	   
	SELECT
    (SELECT COUNT(*) FROM AvaliacaoDisciplinaAluno WHERE idNumeroDisciplina NOT IN (SELECT id FROM Disciplina)) AS NotInCount,
    (SELECT COUNT(*) FROM AvaliacaoDisciplinaAluno WHERE idNumeroDisciplina IS NULL) AS NullCount;

   
 COMMIT TRANSACTION DeleteNotInOrNull;

 GO 

    --Apagar inscricoes que nao tem alunos
SELECT
    (SELECT COUNT(*) FROM Inscricao WHERE numeroAluno NOT IN (SELECT numeroAluno FROM Aluno)) AS NotInCount,
    (SELECT COUNT(*) FROM Inscricao WHERE numeroAluno IS NULL) AS NullCount;

BEGIN TRANSACTION DeleteNotInOrNull;
    DELETE FROM Inscricao WHERE numeroAluno NOT IN (SELECT numeroAluno FROM Aluno) or numeroAluno IS NULL;
	   
	SELECT
    (SELECT COUNT(*) FROM Inscricao WHERE numeroAluno NOT IN (SELECT numeroAluno FROM Aluno)) AS NotInCount,
    (SELECT COUNT(*) FROM Inscricao WHERE numeroAluno IS NULL) AS NullCount;
   
 COMMIT TRANSACTION DeleteNotInOrNull;

 GO 

--Apagar inscricoes que nao tem grupo
SELECT
    (SELECT COUNT(*) FROM Inscricao WHERE idNumeroGrupo NOT IN (SELECT id FROM Grupo)) AS NotInCount,
    (SELECT COUNT(*) FROM Inscricao WHERE idNumeroGrupo IS NULL) AS NullCount;

BEGIN TRANSACTION DeleteNotInOrNull;
    DELETE FROM Inscricao WHERE idNumeroGrupo NOT IN (SELECT id FROM Grupo) or idNumeroGrupo IS NULL;
	   
  SELECT
    (SELECT COUNT(*) FROM Inscricao WHERE idNumeroGrupo NOT IN (SELECT id FROM Grupo)) AS NotInCount,
    (SELECT COUNT(*) FROM Inscricao WHERE idNumeroGrupo IS NULL) AS NullCount;

 COMMIT TRANSACTION DeleteNotInOrNull;

 GO 

 --Apagar apagar tfc que nao tem empresa
SELECT
    (SELECT COUNT(*) FROM TFC WHERE entidade NOT IN (SELECT id FROM Empresa_EntidadeExterna)) AS NotInCount,
    (SELECT COUNT(*) FROM TFC WHERE entidade IS NULL) AS NullCount;
	--ha 18 tfc que a entidade nao existe na empresa entidade

BEGIN TRANSACTION DeleteNotInOrNull;
    DELETE FROM TFC WHERE entidade NOT IN (SELECT id FROM Empresa_EntidadeExterna) or entidade IS NULL;
	   
	SELECT
		(SELECT COUNT(*) FROM TFC WHERE entidade NOT IN (SELECT id FROM Empresa_EntidadeExterna)) AS NotInCount,
		(SELECT COUNT(*) FROM TFC WHERE entidade IS NULL) AS NullCount;

 COMMIT TRANSACTION DeleteNotInOrNull;

 GO 
 select * from tfc