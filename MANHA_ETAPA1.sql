--Duarte Chen a22203153
--Guilherme Frantz a22204098

--Etapa 1
--3 - Criação de índices
    --AvaAvaliacaoDisciplinaAluno
        CREATE INDEX idx_id ON AvaliacaoDisciplinaAluno(id);
        CREATE INDEX idx_idNumeroAluno ON AvaliacaoDisciplinaAluno(idNumeroAluno);
        CREATE INDEX idx_idNumeroDisciplina ON AvaliacaoDisciplinaAluno(idNumeroDisciplina);
    --Curso
        CREATE INDEX idx_id ON Curso(id);
    --Disciplina
        CREATE INDEX idx_id ON Disciplina(id);
        CREATE INDEX idx_cursoAssociado ON Disciplina(cursoAssociado);
    --Empresa_EntidadeExterna
        CREATE INDEX idx_id ON Empresa_EntidadeExterna(id);
    --Grupo
        CREATE INDEX idx_id ON Grupo(id);
    --HistoricoTFC
        CREATE INDEX idx_id ON HistoricoTFC(id);
    --Inscricao
        CREATE INDEX idx_id ON Inscricao(id);
        CREATE INDEX idx_idNumeroGrupo ON Inscricao(idNumeroGrupo);
    --ProfessoresDEISI
        CREATE INDEX idx_id ON ProfessorDEISI(id);
    --ProfessoresNDEISI
        CREATE INDEX idx_id ON ProfessorNDEISI(id);
    --Tecnologia
        CREATE INDEX idx_id ON Tecnologia(id);
    --TFC
        CREATE INDEX idx_id ON TFC(id);
        CREATE INDEX idx_idGrupo ON TFC(idGrupo); 
    --TFCCurso
        CREATE INDEX idx_id ON TFCCurso(id);
        CREATE INDEX idx_idCurso ON TFCCurso(idCurso);
        CREATE INDEX idx_idTFC ON TFCCurso(idTFC);
    --TFCDisciplina
        CREATE INDEX idx_id ON TFCDisciplina(id);
        CREATE INDEX idx_idNumeroDisciplina ON TFCDisciplina(idNumeroDisciplina);
        CREATE INDEX idx_numeroTFC ON TFCDisciplina(numeroTFC);
    --TFCTecnologia
        CREATE INDEX idx_id ON TFCTecnologia(id);
        CREATE INDEX idx_idTFC ON TFCTecnologia(idTFC);
        CREATE INDEX idx_idTecnologia ON TFCTecnologia(idTecnologia);
    --Uilizador
        CREATE INDEX idx_id ON Utilizador(id);
--4 - Limpar os dados carregados
    --4.1 e 4.2     
        --Aluno
            UPDATE Aluno
                SET 
                    id = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(id)), '"', ''), '[', ''), ']', ''),
                    curso = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(curso)), '"', ''), '[', ''), ']', ''),
                    email = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(email)), '"', ''), '[', ''), ']', ''),
                    nome = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(nome)), '"', ''), '[', ''), ']', ''),
                    numeroAluno = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(numeroAluno)), '"', ''), '[', ''), ']', ''),
                    numeroContato = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(numeroContato)), '"', ''), '[', ''), ']', '');
        --AvaliacaoDisciplinaAluno
            UPDATE AvaliacaoDisciplinaAluno
            SET 
                id = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(id)), '"', ''), '[', ''), ']', ''),
                idNumeroAluno = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(idNumeroAluno)), '"', ''), '[', ''), ']', ''),
                idNumeroDisciplina = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(idNumeroDisciplina)), '"', ''), '[', ''), ']', ''),
                nota = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(nota)), '"', ''), '[', ''), ']', '');
        --Curso
            UPDATE Curso
            SET 
                id = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(id)), '"', ''), '[', ''), ']', ''),
                nome = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(nome)), '"', ''), '[', ''), ']', '');
        --Disciplina
            UPDATE Disciplina
            SET 
                id = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(id)), '"', ''), '[', ''), ']', ''),
                cursoAssociado = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(cursoAssociado)), '"', ''), '[', ''), ']', ''),
                nome = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(nome)), '"', ''), '[', ''), ']', '');
        --Empresa_EntidadeExterna
            UPDATE Empresa_EntidadeExterna
            SET 
                id = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(id)), '"', ''), '[', ''), ']', ''),
                email = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(email)), '"', ''), '[', ''), ']', ''),
                idEmpresa = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(idEmpresa)), '"', ''), '[', ''), ']', ''),
                interlocutor = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(interlocutor)), '"', ''), '[', ''), ']', ''),
                morada = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(morada)), '"', ''), '[', ''), ']', ''),
                nome = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(nome)), '"', ''), '[', ''), ']', ''),
                numeroContato = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(numeroContato)), '"', ''), '[', ''), ']', '');
        --Grupo
            UPDATE Grupo
            SET 
                id = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(id)), '"', ''), '[', ''), ']', ''),
                confirmaAluno1 = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(confirmaAluno1)), '"', ''), '[', ''), ']', ''),
                confirmaAluno2 = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(confirmaAluno2)), '"', ''), '[', ''), ']', ''),
                idNumeroAluno1 = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(idNumeroAluno1)), '"', ''), '[', ''), ']', ''),
                idNumeroAluno2 = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(idNumeroAluno2)), '"', ''), '[', ''), ']', '');
        --HistoricoTFC
            UPDATE HistoricoTFC
            SET
                id = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(id)), '"', ''), '[', ''), ']', ''),
                avaliacao = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(avaliacao)), '"', ''), '[', ''), ']', ''),
                dataMudancaEstado = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(dataMudancaEstado)), '"', ''), '[', ''), ']', ''),
                estado = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(estado)), '"', ''), '[', ''), ']', ''),
                idTFC = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(idTFC)), '"', ''), '[', ''), ']', ''),
                idTFCNumerico = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(idTFCNumerico)), '"', ''), '[', ''), ']', ''),
                utilizador = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(utilizador)), '"', ''), '[', ''), ']', '');
        --Inscricao
            UPDATE Inscricao
            SET
                id = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(id)), '"', ''), '[', ''), ']', ''),
                idNumeroGrupo = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(idNumeroGrupo)), '"', ''), '[', ''), ']', ''),
                idTFC = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(idTFC)), '"', ''), '[', ''), ']', ''),
                estado = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(estado)), '"', ''), '[', ''), ']', ''),
                numeroAluno = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(numeroAluno)), '"', ''), '[', ''), ']', ''),
                ordemEscolha = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(ordemEscolha)), '"', ''), '[', ''), ']', ''),
                registoDeInscricao = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(registoDeInscricao)), '"', ''), '[', ''), ']', ''),
                publicado = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(publicado)), '"', ''), '[', ''), ']', ''),
                anoLetivo = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(anoLetivo)), '"', ''), '[', ''), ']', '');
        --ProfessorDeisi
            UPDATE ProfessorDEISI
            SET
                id = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(id)), '"', ''), '[', ''), ']', ''),
                email = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(email)), '"', ''), '[', ''), ']', ''),
                nome = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(nome)), '"', ''), '[', ''), ']', ''),
                numeroContato = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(numeroContato)), '"', ''), '[', ''), ']', ''),
                numeroProfessor = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(numeroProfessor)), '"', ''), '[', ''), ']', '');
        --ProfessorNDeisi
            UPDATE ProfessorNDEISI
            SET
                id = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(id)), '"', ''), '[', ''), ']', ''),
                departamentoAfeto = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(departamentoAfeto)), '"', ''), '[', ''), ']', ''),
                email = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(email)), '"', ''), '[', ''), ']', ''),
                idProfessor = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(idProfessor)), '"', ''), '[', ''), ']', ''),
                nome = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(nome)), '"', ''), '[', ''), ']', ''),
                numeroContato = REPLACE(LTRIM(RTRIM(numeroContato)), '"', '');
        --Tecnologia
            UPDATE Tecnologia
            SET
                id = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(id)), '"', ''), '[', ''), ']', ''),
                nome = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(nome)), '"', ''), '[', ''), ']', '');
        --TFC
            UPDATE TFC
            SET
                id = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(id)), '"', ''), '[', ''), ']', ''),
                Titulo = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(Titulo)), '"', ''), '[', ''), ']', ''),
                anoLetivo = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(anoLetivo)), '"', ''), '[', ''), ']', ''),
                avaliacaoProposta = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(avaliacaoProposta)), '"', ''), '[', ''), ']', ''),
                coorientador = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(coorientador)), '"', ''), '[', ''), ']', ''),
                dataEstado = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(dataEstado)), '"', ''), '[', ''), ']', ''),
                dataProposta = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(dataProposta)), '"', ''), '[', ''), ']', ''),
                --descricao = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(descricao)), '"', ''), '[', ''), ']', ''),
                entidade = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(entidade)), '"', ''), '[', ''), ']', ''),
                estado = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(estado)), '"', ''), '[', ''), ']', ''),
                idGrupo = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(idGrupo)), '"', ''), '[', ''), ']', ''),
                idtfc = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(idTFC)), '"', ''), '[', ''), ']', ''),
                motivoRecusa = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(motivoRecusa)), '"', ''), '[', ''), ']', ''),
                numeroInscricoes = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(numeroInscricoes)), '"', ''), '[', ''), ']', ''),
                orientador = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(orientador)), '"', ''), '[', ''), ']', ''),
                preponente = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(preponente)), '"', ''), '[', ''), ']', ''),
                orientadorProposto = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(orientadorProposto)), '"', ''), '[', ''), ']', ''),
                semestre = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(semestre)), '"', ''), '[', ''), ']', ''),
                tecnologias = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(tecnologias)), '"', ''), '[', ''), ']', '');
        --TFCCurso
            UPDATE TFCCurso
            SET
                id = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(id)), '"', ''), '[', ''), ']', ''),
                idCurso = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(idCurso)), '"', ''), '[', ''), ']', ''),
                idTFC = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(idTFC)), '"', ''), '[', ''), ']', '');
        --TFCDisciplina
            UPDATE TFCDisciplina
            SET
                id = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(id)), '"', ''), '[', ''), ']', ''),
                idNumeroDisciplina = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(idNumeroDisciplina)), '"', ''), '[', ''), ']', ''),
                numeroTFC = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(numeroTFC)), '"', ''), '[', ''), ']', '');
        --TFCTecnologia
            UPDATE TFCTecnologia
            SET
                id = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(id)), '"', ''), '[', ''), ']', ''),
                idTFC = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(idTFC)), '"', ''), '[', ''), ']', ''),
                idTecnologia = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(idTecnologia)), '"', ''), '[', ''), ']', '');
        --Utilizador
            UPDATE Utilizador
            SET
                id = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(id)), '"', ''), '[', ''), ']', ''),
                coordenador = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(coordenador)), '"', ''), '[', ''), ']', ''),
                idIdentificacao = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(idIdentificacao)), '"', ''), '[', ''), ']', ''),
                tipoUtilizador = REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(tipoUtilizador)), '"', ''), '[', ''), ']', '');


--SELECT estado FROM TFC WHERE estado NOT IN ('Aguarda Aprovação', 'Recusado', 'Aguarda Atribuição', 'Atribuído', 'Publicado', 'Indisponível', 'Anulado') OR estado IS NULL;
    --4.3
        --TFC
            UPDATE TFC
            SET estado = 'Aguarda Aprovação'
            WHERE estado = 'A Aguardar Aprovação';

            UPDATE TFC
            SET estado = 'Aguarda Atribuição'
            WHERE TRIM(estado) = 'A Aguardar Atribuição';

            UPDATE TFC
            SET estado = 'Atribuído'
            WHERE TRIM(estado) = 'Atribuido';

            UPDATE TFC
            SET estado = 'Não Atribuído'
            WHERE TRIM(estado) = 'Nao Atribuido';

            UPDATE TFC
            SET estado = 'Indisponível'
            WHERE TRIM(estado) = 'Indisponivel';

            UPDATE TFC
            SET estado = 'Anulado'
            WHERE estado NOT IN ('Aguarda Aprovação', 'Recusado', 'Aguarda Atribuição', 'Atribuído', 'Publicado', 'Indisponível', 'Anulado') OR estado IS NULL;

            --SELECT DISTINCT estado
            --FROM TFC;
        --Inscricao
            --SELECT DISTINCT estado
            --FROM Inscricao;

            UPDATE Inscricao
            SET estado = 'Aguarda Atribuição'
            WHERE estado = 'A Aguardar Atribui??o';

            UPDATE Inscricao
            SET estado = 'Atribuído'
            WHERE estado = 'Atribuido';

            UPDATE Inscricao
            SET estado = 'Não Atribuído'
            WHERE estado = 'N?o Atribuido';

            UPDATE Inscricao
            SET estado = 'Anulado'
            WHERE estado = 'anulado' OR estado IS NULL;

            --Só para ter a certeza
            UPDATE Inscricao
            SET estado = 'Anulado'
            WHERE estado NOT IN ('Aguarda Atribuição', 'Atribuído', 'Não Atribuído', 'Anulado');
        --HistoricoTFC
            --SELECT DISTINCT estado
            --FROM HistoricoTFC;

            UPDATE HistoricoTFC
            SET estado = 'Aguarda Aprovação'
            WHERE estado = 'A Aguardar Aprovação';

            UPDATE HistoricoTFC
            SET estado = 'Aguarda Atribuição'
            WHERE TRIM(estado) = 'A Aguardar Atribuição';

            UPDATE HistoricoTFC
            SET estado = 'Atribuído'
            WHERE TRIM(estado) = 'Atribuido';

            UPDATE HistoricoTFC
            SET estado = 'Não Atribuído'
            WHERE TRIM(estado) = 'Nao Atribuido';

            UPDATE HistoricoTFC
            SET estado = 'Indisponível'
            WHERE TRIM(estado) = 'Indisponivel';
-- 5 - Normalizar os dados carregados
    -- 5.1 (Contagem das repetidas)
        -- TFC
            SELECT idtfc, COUNT(idtfc) AS Count
            FROM TFC
            GROUP BY idtfc
            HAVING COUNT(idtfc) > 1;
        -- Aluno
            SELECT numeroAluno, COUNT(numeroAluno) AS Count
            FROM Aluno
            GROUP BY numeroAluno
            HAVING COUNT(numeroAluno) > 1;
        -- ProfessorDEISI
            SELECT numeroProfessor, COUNT(numeroProfessor) AS Count
            FROM ProfessorDEISI
            GROUP BY numeroProfessor
            HAVING COUNT(numeroProfessor) > 1;
            --Há professores com mais do que uma
        -- ProfessorNDEISI
            SELECT idProfessor, COUNT(idProfessor) AS Count
            FROM ProfessorNDEISI
            GROUP BY idProfessor
            HAVING COUNT(idProfessor) > 1;
        -- Verif se o mesmo aluno aparece em dois grupos
            SELECT idNumeroAluno, COUNT(*) AS Count
            FROM (
                SELECT idNumeroAluno1 AS idNumeroAluno FROM Grupo
                UNION ALL 
                SELECT idNumeroAluno2 AS idNumeroAluno FROM Grupo
            ) AS Alunos
            GROUP BY idNumeroAluno
            HAVING COUNT(*) > 1;
            --Há alunos em mais do que um grupo
    -- 5.2 Eliminar duplicatas (Cria a col id_temp p/ distinguir as repetidas e dps apaga)
        -- TFC
            ALTER TABLE TFC
            ADD id_temp INT;

            WITH Duplicatas AS (
                SELECT idtfc, COUNT(idtfc)
                FROM TFC
                GROUP BY idTFC
                HAVING COUNT(idtfc) > 1)
            
                
            UPDATE TFC
            SET id_temp = Duplicatas
            FROM TFC
            JOIN Duplicatas ON idtfc = Duplicatas.idtfc;

            DELETE FROM TFC
            WHERE (idtfc, id_temp) IN (
                SELECT idTFC, MAX(id_temp) AS id_temp
                FROM TFC
                GROUP BY idtfc
                HAVING COUNT(*) > 1
            );
        -- Aluno
                ALTER TABLE Aluno
                ADD id_temp INT;

                WITH DuplicatasAluno AS (
                    SELECT numeroAluno, COUNT(numeroAluno) AS Count
                    FROM Aluno
                    GROUP BY numeroAluno
                    HAVING Count > 1
                )

                UPDATE Aluno
                SET id_temp = DuplicatasAluno.Count
                FROM Aluno
                JOIN DuplicatasAluno ON Aluno.numeroAluno = DuplicatasAluno.numeroAluno;

                DELETE FROM Aluno
                WHERE (numeroAluno, id_temp) IN (
                    SELECT numeroAluno, MAX(id_temp) AS id_temp
                    FROM Aluno
                    GROUP BY numeroAluno
                    HAVING COUNT(*) > 1
                );

        -- ProfessorDEISI
                ALTER TABLE ProfessorDEISI
                ADD id_temp INT;

                WITH DuplicatasProfessorDEISI AS (
                    SELECT numeroProfessor, COUNT(numeroProfessor) AS Count
                    FROM ProfessorDEISI
                    GROUP BY numeroProfessor
                    HAVING Count > 1
                )

                UPDATE ProfessorDEISI
                SET id_temp = DuplicatasProfessorDEISI.Count
                FROM ProfessorDEISI
                JOIN DuplicatasProfessorDEISI ON ProfessorDEISI.numeroProfessor = DuplicatasProfessorDEISI.numeroProfessor;

                DELETE FROM ProfessorDEISI
                WHERE (numeroProfessor, id_temp) IN (
                    SELECT numeroProfessor, MAX(id_temp) AS id_temp
                    FROM ProfessorDEISI
                    GROUP BY numeroProfessor
                    HAVING COUNT(*) > 1
                );

        -- ProfessorNDEISI
                ALTER TABLE ProfessorNDEISI
                ADD id_temp INT;

                WITH DuplicatasProfessorNDEISI AS (
                    SELECT idProfessor, COUNT(idProfessor) AS Count
                    FROM ProfessorNDEISI
                    GROUP BY idProfessor
                    HAVING Count > 1
                )

                UPDATE ProfessorNDEISI
                SET id_temp = DuplicatasProfessorNDEISI.Count
                FROM ProfessorNDEISI
                JOIN DuplicatasProfessorNDEISI ON ProfessorNDEISI.idProfessor = DuplicatasProfessorNDEISI.idProfessor;

                DELETE FROM ProfessorNDEISI
                WHERE (idProfessor, id_temp) IN (
                    SELECT idProfessor, MAX(id_temp) AS id_temp
                    FROM ProfessorNDEISI
                    GROUP BY idProfessor
                    HAVING COUNT(*) > 1
                );

        -- Grupo
                ALTER TABLE Grupo
                ADD id_temp INT;

                WITH DuplicatasGrupo AS (
                    SELECT idNumeroAluno, COUNT(*) AS Count
                    FROM (
                        SELECT idNumeroAluno1 AS idNumeroAluno FROM Grupo
                        UNION ALL 
                        SELECT idNumeroAluno2 AS idNumeroAluno FROM Grupo
                    ) AS Alunos
                    GROUP BY idNumeroAluno
                    HAVING Count > 1
                )

                UPDATE Grupo
                SET id_temp = DuplicatasGrupo.Count
                FROM (
                    SELECT idNumeroAluno1 AS idNumeroAluno FROM Grupo
                    UNION ALL 
                    SELECT idNumeroAluno2 AS idNumeroAluno FROM Grupo
                ) AS Alunos
                JOIN DuplicatasGrupo ON Grupo.idNumeroAluno1 = DuplicatasGrupo.idNumeroAluno OR Grupo.idNumeroAluno2 = DuplicatasGrupo.idNumeroAluno;

                DELETE FROM Grupo
                WHERE (idNumeroAluno1, id_temp) IN (
                    SELECT idNumeroAluno, MAX(id_temp) AS id_temp
                    FROM Grupo
                    GROUP BY idNumeroAluno
                    HAVING COUNT(*) > 1
                ) OR (idNumeroAluno2, id_temp) IN (
                    SELECT idNumeroAluno, MAX(id_temp) AS id_temp
                    FROM Grupo
                    GROUP BY idNumeroAluno
                    HAVING COUNT(*) > 1
                );
    -- 5.3 (Verificar coerência)
        -- idTFC
            DELETE FROM TFCCurso
            WHERE idTFC NOT IN (SELECT idTFC FROM TFC);

            SELECT idTFC FROM TFCCurso WHERE idTFC NOT IN (SELECT idTFC FROM TFC)

            SELECT TOP (50) id FROM TFCCurso

            DELETE FROM TFCTecnologia
            WHERE idTFC NOT IN (SELECT idTFC FROM TFC);

            DELETE FROM Inscricao
            WHERE idTFC NOT IN (SELECT idTFC FROM TFC);

            DELETE FROM HistoricoTFC
            WHERE idTFC NOT IN (SELECT idTFC FROM TFC);
        -- numeroProfessor
            DELETE FROM TFC
            WHERE orientador NOT IN (SELECT numeroProfessor FROM ProfessoresDEISI)

            DELETE FROM TFC
            WHERE orientadorProposto NOT IN (SELECT numeroProfessor FROM ProfessoresDEISI)
        -- numeroAluno
            DELETE FROM AvaliacaoDisciplinaAluno
            WHERE idNumeroAluno NOT IN (SELECT numeroAluno FROM Aluno)

            DELETE FROM Grupo
            WHERE idNumeroAluno1 NOT IN (SELECT numeroAluno FROM Aluno)

            DELETE FROM Grupo
            WHERE idNumeroAluno2 NOT IN (SELECT numeroAluno FROM Aluno)
        -- idGrupo
            DELETE FROM TFC
            WHERE idGrupo NOT IN (SELECT id FROM Grupo)