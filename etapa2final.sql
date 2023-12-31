--Lucas Botelho a22201202
--Tiago Mota a22207337
--Marcos Gil a22102606
--Gonçalo Neves a22204044

--Etapa 2
--6 

use tfc

-- Curso
ALTER TABLE Curso ADD CONSTRAINT PK_Curso_id PRIMARY KEY (id);

-- Tecnologia
ALTER TABLE Tecnologia ADD CONSTRAINT PK_Tecnologia_id PRIMARY KEY (id);

-- Disciplina
ALTER TABLE Disciplina ADD CONSTRAINT PK_Disciplina_id PRIMARY KEY (id);

-- Aluno
ALTER TABLE Aluno ADD CONSTRAINT PK_Aluno_numeroAluno PRIMARY KEY (numeroAluno);

-- ProfessorDEISI
ALTER TABLE ProfessorDEISI ADD CONSTRAINT PK_ProfessorDEISI_numeroProfessor PRIMARY KEY (numeroProfessor);

-- Grupo 
ALTER TABLE Grupo ADD CONSTRAINT PK_Grupo_id PRIMARY KEY (id);

-- TFC 
ALTER TABLE TFC ADD CONSTRAINT PK_TFC_id PRIMARY KEY (id);

-- ProfessorNDEISI
ALTER TABLE ProfessorNDEISI ALTER COLUMN idProfessor varchar(255) NOT NULL;
ALTER TABLE ProfessorNDEISI ADD CONSTRAINT PK_ProfessorNDEISI_idProfessor PRIMARY KEY (idProfessor);

-- Empresa_EntidadeExterna 
ALTER TABLE Empresa_EntidadeExterna ADD CONSTRAINT PK_Empresa_EntidadeExterna_idEmpresa PRIMARY KEY (id);

-- Utilizador
ALTER TABLE Utilizador ALTER COLUMN idIdentificacao varchar(255) NOT NULL;
ALTER TABLE Utilizador ADD CONSTRAINT PK_Utilizador_idIdentificacao PRIMARY KEY (idIdentificacao);


