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
-- TFCTecnologia 
ALTER TABLE TFCTecnologia ADD CONSTRAINT PK_TFCTecnologia_id PRIMARY KEY (id);
-- Utilizador
ALTER TABLE Utilizador ALTER COLUMN idIdentificacao varchar(255) NOT NULL;
ALTER TABLE Utilizador ADD CONSTRAINT PK_Utilizador_idIdentificacao PRIMARY KEY (idIdentificacao);


