USE DBTREINO

/*
CREATE TABLE TBPRODUTO (CODIGO VARCHAR(6), DESCRICAO VARCHAR(50))
INSERT INTO TBPRODUTO (CODIGO, DESCRICAO) VALUES ('1', 'PRODUTO 1')
INSERT INTO TBPRODUTO (CODIGO, DESCRICAO) VALUES ('002', 'PRODUTO 2')

SELECT* FROM TBPRODUTO
*/

DECLARE @PREFIXO VARCHAR(6) = '9'			--	PREFIXO
DECLARE @FORMATO VARCHAR(6) = '000000'		-- FORMATO

SELECT  
	CASE 
		LEN(@FORMATO)
	WHEN
		LEN(CODIGO)
	THEN
		@PREFIXO + RIGHT(CODIGO, LEN(CODIGO) - LEN(@PREFIXO))
	ELSE 
		@PREFIXO + LEFT(@FORMATO, (LEN(@FORMATO) - LEN(CODIGO) - LEN(@PREFIXO))) + CODIGO
	END
FROM
	TBPRODUTO
