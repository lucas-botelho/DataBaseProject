--Etapa 2
--6 - Criação de chaves primárias
    -- Curso
    ALTER TABLE Curso
    MODIFY id INT PRIMARY KEY;

    -- Tecnologia
    ALTER TABLE Tecnologia
    MODIFY id INT PRIMARY KEY;

    -- Disciplina
    ALTER TABLE Disciplina
    MODIFY id INT PRIMARY KEY;

    -- Aluno
    ALTER TABLE Aluno
    MODIFY numeroAluno INT PRIMARY KEY;

    -- Grupo
    ALTER TABLE Grupo
    MODIFY id INT PRIMARY KEY;

    -- TFC
    ALTER TABLE TFC
    MODIFY idtfc INT PRIMARY KEY;

    -- ProfessorNDEISI
    ALTER TABLE ProfessorNDEISI
    MODIFY idProfessor INT PRIMARY KEY;

    -- Empresa_EntidadeExterna
    ALTER TABLE Empresa_EntidadeExterna
    MODIFY idEmpresa INT PRIMARY KEY;

    -- ProfessorDEISI
    ALTER TABLE ProfessorDEISI
    MODIFY numeroProfessor INT PRIMARY KEY;

    -- Utilizador
    ALTER TABLE Utilizador
    MODIFY idIdentificacao INT PRIMARY KEY;

--7
 ALTER TABLE tfc.Aluno
    ADD ECTS INT NOT NULL DEFAULT 0;

    -- Preencher a coluna aleatoriamente para pelo menos 5 alunos
        UPDATE TOP (5) tfc.Aluno
        SET ECTS = ABS(CHECKSUM(NEWID())) % 180; -- Isso gera valores aleatórios entre 0 e 180
--8  - preencher avaliações tabela [AvaliacaoDisciplinaAluno]
    INSERT INTO tfc.AvaliacaoDisciplinaAluno (id, idNumeroAluno, idNumeroDisciplina, nota)
    SELECT
        ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS id,
        A.id AS idNumeroAluno,
        TD.idNumeroDisciplina,
        CAST((RAND() * 10 + 10) AS INT) AS nota
    FROM
        tfc.TFCDisciplina TD
    INNER JOIN
        tfc.TFC T ON TD.numeroTFC = T.id
    INNER JOIN
        tfc.Grupo G ON T.id = G.id
    INNER JOIN
        tfc.Aluno A ON G.idNumeroAluno1 = A.numeroAluno OR G.idNumeroAluno2 = A.numeroAluno
    WHERE
        A.ECTS > 0;

    --Para haver um aluno que tenha nota negativa
        UPDATE tfc.AvaliacaoDisciplinaAluno
        SET nota = 5
        WHERE id = 1;
--9 - Adicionar restrições
    -- CHECK 0-20
        -- AvaliacaoDisciplinaAluno
        ALTER TABLE tfc.AvaliacaoDisciplinaAluno
            ADD CONSTRAINT CH_Avaliacao CHECK (nota >= 0 AND nota <= 20);

    -- Unique Key
        -- TFCCurso
        ALTER TABLE tfc.Curso
        ADD CONSTRAINT UK_nome UNIQUE (nome);

        -- TFCCurso
        ALTER TABLE tfc.Tecnologia
        ADD CONSTRAINT UK_nome UNIQUE (nome);

        -- TFCCurso
        ALTER TABLE Disciplina
        ADD CONSTRAINT UK_nome UNIQUE (nome);
            
        -- TFCCurso
        ALTER TABLE TFCCurso
        ADD CONSTRAINT UK_idCurso UNIQUE (idCurso),
        ADD CONSTRAINT UK_idTFC UNIQUE (idTFC);

        -- TFCTecnologia
        ALTER TABLE TFCTecnologia
        ADD CONSTRAINT UK_idTFC UNIQUE (idTFC),
        ADD CONSTRAINT UK_idTecnologia UNIQUE (idTecnologia);

        -- TFCDisciplina
        ALTER TABLE TFCDisciplina
        ADD CONSTRAINT UK_idNumeroDisciplina UNIQUE (idNumeroDisciplina),
        ADD CONSTRAINT UK_numeroTFC UNIQUE (numeroTFC);

        -- AvaliacaoDisciplinaAluno
        ALTER TABLE AvaliacaoDisciplinaAluno
        ADD CONSTRAINT UK_idNumeroAluno UNIQUE (idNumeroAluno),
        ADD CONSTRAINT UK_idNumeroDisciplina UNIQUE (idNumeroDisciplina);

        -- Aluno
        ALTER TABLE Aluno
        ADD CONSTRAINT UK_email UNIQUE (email),
        ADD CONSTRAINT UK_numeroAluno UNIQUE (numeroAluno),
        ADD CONSTRAINT UK_numeroContato UNIQUE (numeroContato);

        -- Inscricao
        ALTER TABLE Inscricao
        ADD CONSTRAINT UK_idNumeroGrupo UNIQUE (idNumeroGrupo),
        ADD CONSTRAINT UK_idTFC UNIQUE (idTFC),
        ADD CONSTRAINT UK_numeroAluno UNIQUE (numeroAluno);

        -- HistoricoTFC
        ALTER TABLE HistoricoTFC
        ADD CONSTRAINT UK_idTFC UNIQUE (idTFC),
        ADD CONSTRAINT UK_idTFCNumerico UNIQUE (idTFCNumerico);

        -- Grupo
        ALTER TABLE Grupo
        ADD CONSTRAINT UK_idNumeroAluno1 UNIQUE (idNumeroAluno1),
        ADD CONSTRAINT UK_idNumeroAluno2 UNIQUE (idNumeroAluno2);

        -- TFC
        ALTER TABLE TFC
        ADD CONSTRAINT UK_idGrupo UNIQUE (idGrupo),
        ADD CONSTRAINT UK_idTFC UNIQUE (idTFC);

        -- ProfessorNDEISI
        ALTER TABLE ProfessorNDEISI
        ADD CONSTRAINT UK_email UNIQUE (email),
        ADD CONSTRAINT UK_idProfessor UNIQUE (idProfessor),
        ADD CONSTRAINT UK_numeroContato UNIQUE (numeroContato);

        -- Empresa_EntidadeExterna
        ALTER TABLE Empresa_EntidadeExterna
        ADD CONSTRAINT UK_idEmpresa UNIQUE (idEmpresa);

        -- ProfessorDEISI
        ALTER TABLE ProfessorDEISI
        ADD CONSTRAINT UK_email UNIQUE (email),
        ADD CONSTRAINT UK_numeroContato UNIQUE (numeroContato),
        ADD CONSTRAINT UK_numeroProfessor UNIQUE (numeroProfessor);

        -- Utilizador
        ALTER TABLE Utilizador
        ADD CONSTRAINT UK_idIdentificacao UNIQUE (idIdentificacao);
--10 - [TFC] e [Inscricao]

    ALTER TABLE tfc.Inscricao
    ADD CONSTRAINT FK_Inscricao_TFC FOREIGN KEY (idNumeroGrupo)
    REFERENCES tfc.TFC (idGrupo);

    ALTER TABLE tfc.Inscricao
    ADD CONSTRAINT CK_Inscricao CHECK (
        (idNumeroGrupo IS NOT NULL AND numeroAluno IS NULL)
        OR (idNumeroGrupo IS NULL AND numeroAluno IS NOT NULL)
    );

--11 - Chaves estrangeiras (FK) indicadas no modelo dados
    --AvaliacaoDisciplinaAluno
    ALTER TABLE tfc.AvaliacaoDisciplinaAluno
    ADD CONSTRAINT FK_Aluno FOREIGN KEY (idNumeroAluno)
    REFERENCES tfc.Aluno (id);

    ALTER TABLE tfc.AvaliacaoDisciplinaAluno
    ADD CONSTRAINT FK_Disciplina FOREIGN KEY (idNumeroDisciplina)
    REFERENCES tfc.Disciplina (id);
    --TFCDisciplina
    ALTER TABLE tfc.TFCDisciplina
    ADD CONSTRAINT FK_TFC_Disciplina FOREIGN KEY (idNumeroDisciplina)
    REFERENCES tfc.Disciplina (id);

    ALTER TABLE tfc.TFCDisciplina
    ADD CONSTRAINT FK_nrTFC FOREIGN KEY (numeroTFC)
    REFERENCES tfc.TFC (id);
    --TFCCurso
    ALTER TABLE tfc.TFCCurso
    ADD CONSTRAINT FK_TFCCurso_Curso FOREIGN KEY (idCurso)
    REFERENCES tfc.Curso (id);

    ALTER TABLE tfc.TFCCurso
    ADD CONSTRAINT FK_TFCCurso_TFC FOREIGN KEY (idTFC)
    REFERENCES tfc.TFC (id);
    --TFCTecnologia
    ALTER TABLE tfc.TFCTecnologia
    ADD CONSTRAINT FK_TFCTecnologia_Tecnologia FOREIGN KEY (idTecnologia)
    REFERENCES tfc.Tecnologia (id);

    ALTER TABLE tfc.TFCCurso
    ADD CONSTRAINT FK_TFCTecnologia_TFC FOREIGN KEY (idTFC)
    REFERENCES tfc.TFC (id);
--13 - a coluna [estado]
    ALTER TABLE tfc.Aluno
    ADD estado VARCHAR(255); 

    UPDATE tfc.Aluno
    SET estado = CASE
                WHEN TFC.idGrupo IS NOT NULL THEN 'válido'
                ELSE 'excluído'
                END
    FROM tfc.Aluno
    LEFT JOIN tfc.Grupo ON Aluno.numeroAluno = Grupo.idNumeroAluno1 OR Aluno.numeroAluno = Grupo.idNumeroAluno2
    LEFT JOIN tfc.TFC ON Grupo.id = TFC.idGrupo;









