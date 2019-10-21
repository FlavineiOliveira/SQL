USE DBACERVO;

CREATE TABLE ALUNO (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	NOME VARCHAR(50) NOT NULL,
);

CREATE TABLE CURSO (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	NOME VARCHAR(50) NOT NULL,
);

CREATE TABLE ESCOLA(
	ID INT IDENTITY(1,1) PRIMARY KEY,
	NOME VARCHAR(50) NOT NULL,
);

CREATE TABLE MATRICULA (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	ID_ALUNO INT NOT NULL,
	ID_CURSO INT NOT NULL,
	ID_ESCOLA INT NOT NULL,
);

INSERT INTO ALUNO (NOME) VALUES ('Flavinei');
INSERT INTO ALUNO (NOME) VALUES ('Paulo');
INSERT INTO ALUNO (NOME) VALUES ('Aline');
INSERT INTO ALUNO (NOME) VALUES ('Leonardo');

INSERT INTO CURSO (NOME) VALUES ('JavaScript');
INSERT INTO CURSO (NOME) VALUES ('Xamarin');
INSERT INTO CURSO (NOME) VALUES ('Asp.Net MVC');
INSERT INTO CURSO (NOME) VALUES ('Python');

INSERT INTO ESCOLA (NOME) VALUES ('Udemy');
INSERT INTO ESCOLA (NOME) VALUES ('Impacta Faculdade');
INSERT INTO ESCOLA (NOME) VALUES ('Faculdade Metropolitana Unidas - FMU');

SELECT* FROM ALUNO;
SELECT* FROM CURSO;
SELECT* FROM ESCOLA;
SELECT* FROM MATRICULA;

INSERT INTO MATRICULA (ID_ALUNO, ID_CURSO, ID_ESCOLA) VALUES (1, 3, 1);
INSERT INTO MATRICULA (ID_ALUNO, ID_CURSO, ID_ESCOLA) VALUES (1, 2, 1);
INSERT INTO MATRICULA (ID_ALUNO, ID_CURSO, ID_ESCOLA) VALUES (2, 5, 2);
INSERT INTO MATRICULA (ID_ALUNO, ID_CURSO, ID_ESCOLA) VALUES (3, 2, 3);

-- Faz um select retornando o nome do aluno
SELECT A.NOME
-- Na tabela ALUNO atribuindo o alias de 'A'
FROM ALUNO 
-- Onde não existe (NOT EXISTS) nenhum registro do ID do aluno
WHERE NOT EXISTS 
	(SELECT 1 
	-- Na tabela MATRICULA
	FROM MATRICULA M
	WHERE M.ID_ALUNO = A.ID
	)
	
	

--TRATANDO CONVERSÃO DE DATA COM FUSO HORÁRIO (DATETIMEOFFSET) PARA DATA COM INTERVALO MENOR (SMALLDATETIME)
DECLARE @FAIXADATA smalldatetime
DECLARE @FUSO DATETIMEOFFSET 

SET @FUSO = '2019-10-16T03:00:00+00:00'
SET @FAIXADATA = CAST(@FUSO AS smalldatetime)

SELECT @FAIXADATA, @FUSO

-- ATENÇÃO: View é uma referência de algum dado de uma tabela existe, é possível realizar update da view, porém se atualizado, a tabela de onde os dados são referenciados também será atualizado.

-- Instrução para criar a view 'VW_LOGUSU'
CREATE VIEW VW_LOGUSU AS	
	SELECT
		E.USUARIOACESSO AS USUARIO	--	Referenciando a coluna 'USUARIOACESSO' da tabela 'ELOG', nomeando os dados da coluna como 'USUARIO'
FROM ELOG E							

-- Instrução alteração de view 'VW_LOGUSU'
ALTER VIEW VW_LOGUSU 
AS
	SELECT  
			USUARIOACESSO AS USUARIO,	--	Mantendo estrutura da coluna
			DATAACESSO AS DATAUSUARIO	--	Adicionando coluna 'DATAUSUARIO'
FROM ELOG								--	Com base nos dados da tabela 'ELOG'

-- deleta a view 'VW_LOGUSU'
DROP VIEW VW_LOGUSU	

-- Select da view (É possível utilizar condições como uma tabela normal)
SELECT* FROM VW_LOGUSU -- WHERE USUARIO = '123'

