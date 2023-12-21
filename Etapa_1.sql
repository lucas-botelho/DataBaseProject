use TFC

CREATE TABLE Curso (
	id bigint NOT NULL,
	nome varchar(255) NOT NULL
);

CREATE TABLE Tecnologia (
	id bigint NOT NULL,
	nome varchar(255) NOT NULL
);

CREATE TABLE Disciplina (
	id bigint NOT NULL,
	cursoAssociado bigint NOT NULL,
	nome varchar(255) NOT NULL
);

CREATE TABLE TFCCurso (
	id bigint NOT NULL,
	idCurso bigint NOT NULL,
	idTFC bigint NOT NULL
);

CREATE TABLE TFCTecnologia (
	id bigint NOT NULL,
	idTFC bigint NOT NULL,
	idTecnologia bigint NOT NULL
);

CREATE TABLE TFCDisciplina (
	id bigint NOT NULL,
	idNumeroDisciplina bigint NOT NULL,
	numeroTFC bigint NOT NULL
);

CREATE TABLE AvaliacaoDisciplinaAluno (
	id bigint NOT NULL,
	idNumeroAluno bigint NOT NULL,
	idNumeroDisciplina bigint NOT NULL,
	nota int NOT NULL
);

CREATE TABLE Aluno (
	id bigint NOT NULL,
	curso varchar(255),
	email varchar(255),
	nome varchar(255) NOT NULL,
	numeroAluno varchar(255) NOT NULL,
	numeroContato int,

);

CREATE TABLE Grupo (
	id bigint NOT NULL,
	confirmaAluno1 tinyint NOT NULL,
	confirmaAluno2 tinyint,
	idNumeroAluno1 varchar(255) NOT NULL,
	idNumeroAluno2 varchar(255),
);

CREATE TABLE HistoricoTFC (
	id bigint NOT NULL,
	avaliacao varchar(255),
	dataMudancaEstado varchar(255),
	estado varchar(255) NOT NULL,
	idTFC varchar(255) NOT NULL,
	idTFCNumerico bigint NOT NULL,
	utilizador varchar(255) NOT NULL,
);

CREATE TABLE Inscricao (
	id bigint NOT NULL,
	estado varchar(255),
	idNumeroGrupo bigint,
	idTFC varchar(255) NOT NULL,
	numeroAluno varchar(255),
	ordemEscolha int,
	registoDeInscricao datetime,
	publicado tinyint,
	anoLetivo varchar(255)
);

CREATE TABLE ProfessorNDEISI (
	id bigint NOT NULL,
	desparamentoAfeto varchar(255) NOT NULL,
	email varchar(255) NOT NULL,
	idProfessor varchar(255),
	nome varchar(255) NOT NULL,
	numeroContato int NOT NULL,
);

CREATE TABLE Empresa_EntidadeExterna (
	id bigint NOT NULL,
	email varchar(255),
	idEmpresa varchar(255),
	interlocutor varchar(255),
	morada varchar(255),
	nome varchar(255) NOT NULL,
	numeroContato int,
);

CREATE TABLE ProfessorDEISI (
	id bigint NOT NULL,
	email varchar(255),
	nome varchar(255) NOT NULL,
	numeroContato int,
	numeroProfessor varchar(255) NOT NULL,
);

CREATE TABLE Utilizador (
	id bigint NOT NULL,
	coordenador tinyint,
	idIdentificacao varchar(255),
	tipoUtilizador varchar(255)
);

CREATE TABLE TFC (
  id bigint NOT NULL,
  titulo varchar(255) NOT NULL,
  anoletivo varchar(255),
  avaliacaoProposta varchar(255),
  coorientador varchar(255),
  dataEstado varchar(255),
  dataProposta varchar(255),
  descricao text,
  entidade bigint,
  estado varchar(255),
  idGrupo bigint,
  idtfc varchar(255),
  motivoRecusa varchar(255),
  numeroInscricoes int,
  orientador varchar(255),
  orientadorProposto varchar(255),
  preponente varchar(255),
  semestre int,
  tecnologias varchar(255)
);
