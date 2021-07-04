--DDL
    --TABELA DE PROCEDIMENTOS VENDAS
        --DROP TABLE VENDAS05
        CREATE TABLE dbo.VENDAS05 (
    	    ID_VENDAS05 NUMERIC NOT NULL
    	    ,NUMERO NUMERIC(5) NOT NULL
    	    ,DT_HR DATETIME DEFAULT GETDATE() NOT NULL
    	    ,VLR_TOTAL NUMERIC(10, 2) DEFAULT 0 NOT NULL
    	    ,QTDE_ITENS NUMERIC(5) DEFAULT 0 NOT NULL
    	    ,CLI_NOME VARCHAR(100)
    	    ,STATUS CHAR(1) DEFAULT 'A' NOT NULL --tem como definir quais os valores que vai ser aceito nessa coluna, somente 'A', 'B' e 'C'
        );
    
        --Chave Primaria
            --não pode ser null, cria um indice interno (padrao)
            -- EU indico que essa coluna vai servir de referencia para outras
            ALTER TABLE dbo.VENDAS05 ADD CONSTRAINT VENDAS05_PK PRIMARY KEY(ID_VENDAS05);
        
        --Chave unica
            --Garantir que o número de venda não vai se repetir, é único
            ALTER TABLE dbo.VENDAS05 ADD CONSTRAINT VENDAS05NUM_UK UNIQUE(NUMERO);
    
    
    --DROP SEQUENCE VENDAS05_SEQ
        --Um obejto no banco de dados, númerico
    CREATE SEQUENCE dbo.VENDAS05_SEQ AS NUMERIC
      START WITH 1 --inicia em 1
      INCREMENT BY 1 --incrementa de 1 em 1
      MINVALUE 1
      MAXVALUE 999999999
      CYCLE
      CACHE
      --Sequence ela nunca vai permitir que se repita uma PK, se já passou pelo 1 nunca mais vai ter uma PK 1
    
    
    --TABELA DE ITENS DA VENDA
        --DROP TABLE VENDAS05ITEM
        CREATE TABLE dbo.VENDAS05ITEM
        (
          ID_VENDAS05ITEM        NUMERIC NOT NULL,
          ID_VENDAS05            NUMERIC NOT NULL,
          ID_PRODUTOS05          NUMERIC NOT NULL,
          QTDE                   NUMERIC(5) DEFAULT 0 NOT NULL,
          VLR_UNIT               NUMERIC(10,2) DEFAULT 0 NOT NULL
        );
    
        --Chave primaria
            ALTER TABLE dbo.VENDAS05ITEM ADD CONSTRAINT VENDAS05ITEM_PK PRIMARY KEY(ID_VENDAS05ITEM);
    
        --Chave estrangeira
            --ON DELETE CASCADE
                --Quando eu apagar o pai, o filho vai junto, assim eu não deixo um filho sem pai
                -- Seu eu cancelo uma venda, ele vai cancelar os itens tambem
                -- Se voce deletar a venda, onde tiver venda na tabela de itens essa venda ele tambem vai deletar sem do
            ALTER TABLE dbo.VENDAS05ITEM ADD CONSTRAINT VENDAS05ITEMPAI_FK FOREIGN KEY(ID_VENDAS05) REFERENCES VENDAS05(ID_VENDAS05) ON DELETE CASCADE;
    
        --Chave estrangeira
            -- referencia para tabela de produtos, porem ela não está criada ainda
            -- não é DELETE CASCADE pois eu NÃO quero que quando for deletado um produto delete os itens da venda tambem
            -- é bom porque se voce deleta um produto ele não deleta os itens
            ALTER TABLE dbo.VENDAS05ITEM ADD CONSTRAINT VENDAS05ITEMPROD_FK FOREIGN KEY(ID_PRODUTOS05) REFERENCES PRODUTOS05(ID_PRODUTOS05);
    
    --TABELA DE PRODUTOS
        --DROP TABLE PRODUTOS05
        CREATE TABLE PRODUTOS05 (
    	    ID_PRODUTOS05 NUMERIC NOT NULL
    	    ,CODIGO VARCHAR(10) NOT NULL
    	    ,DESCRICAO VARCHAR(100) NOT NULL
    	    ,VLR NUMERIC(10, 2) DEFAULT 0 NOT NULL
    	);
    
        ALTER TABLE PRODUTOS05 ADD CONSTRAINT PRODUTOS05_PK PRIMARY KEY(ID_PRODUTOS05);
        
        ALTER TABLE PRODUTOS05 ADD CONSTRAINT PRODUTOS05COD_UK UNIQUE(CODIGO);
        
        ALTER TABLE PRODUTOS05 ADD CONSTRAINT PRODUTOS05DES_UK UNIQUE(DESCRICAO);

--D M L
    --INSERT / DELETE / UPDATE
    
    -- Se tiver muitas colunas faça assim:
        /* INSERT INTO PRODUTOS05 (
            ID_PRODUTOS05, 
            CODIGO, 
            DESCRICAO, 
            VLR) 
        VALUES 
            (1, 
            '001', 
            'Produto Teste Fortes n? 001', 
            100); */

    --Completo (full => explicit)
        INSERT INTO PRODUTOS05 (ID_PRODUTOS05, CODIGO, DESCRICAO, VLR) VALUES (1, '001', 'Produto Teste Fortes n? 001', 100);
    
    --Campos default (suppress default's)
        INSERT INTO PRODUTOS05 (ID_PRODUTOS05, CODIGO, DESCRICAO) VALUES (2, '002', 'Produto Teste Fortes n? 002');
    
    --lista ordenada(structure match)
        -- é obrigaotiro passar os valores de acorod com a estrutura do banco
        INSERT INTO PRODUTOS05 VALUES (3, '003', 'Produto Teste Fortes n? 003', 300);
    
        --Errado
            INSERT INTO PRODUTOS05 VALUES (4, '004', 'Produto Teste Fortes n? 004');

        --Correto
            INSERT INTO PRODUTOS05 VALUES (4, '004', 'Produto Teste Fortes n? 004', 400);

    INSERT INTO PRODUTOS05(ID_PRODUTOS05, CODIGO, DESCRICAO, VLR) VALUES(5, '005', 'Produto Teste Fortes n? 005', 500.55);
    INSERT INTO PRODUTOS05(ID_PRODUTOS05, CODIGO, DESCRICAO, VLR) VALUES(6, '006', 'Produto Teste Fortes n? 006', 600.006);
    INSERT INTO PRODUTOS05(ID_PRODUTOS05, CODIGO, DESCRICAO, VLR) VALUES(7, '007', 'Produto Teste Fortes n? 007', 700.07);
    INSERT INTO PRODUTOS05(ID_PRODUTOS05, CODIGO, DESCRICAO, VLR) VALUES(8, '008', 'Produto Teste Fortes n? 008', 800.8);
    INSERT INTO PRODUTOS05(ID_PRODUTOS05, CODIGO, DESCRICAO, VLR) VALUES(9, '009', 'Produto Teste Fortes n? 009', 900);
    INSERT INTO PRODUTOS05(ID_PRODUTOS05, CODIGO, DESCRICAO, VLR) VALUES(10, '010', 'Produto Teste Fortes n? 010', 1000);
    INSERT INTO PRODUTOS05(ID_PRODUTOS05, CODIGO, DESCRICAO, VLR) VALUES(11, '011', 'Produto Teste Fortes n? 011', 5000);

    SELECT * FROM PRODUTOS05;

    -- Como não temos DELETE CASCADE ele NÃO deletou os itens onde tinha esse produto
    --SELECT * FROM VENDAS05ITEM
    DELETE FROM PRODUTOS05 WHERE ID_PRODUTOS05 = 7

    INSERT INTO PRODUTOS05(ID_PRODUTOS05, CODIGO, DESCRICAO, VLR) VALUES(7, '007', 'Produto Teste Fortes n? 007', 700.073);
    SELECT * FROM PRODUTOS05 WHERE ID_PRODUTOS05 = 7;

    --ERRO VIRGULA ? PONTO
        UPDATE PRODUTOS05 
        SET VLR = 800,001
        WHERE ID_PRODUTOS05 = 8
    
    --ARREDONDAMENTO PARA BAIXO
        --propiedade precision, se voce colocar em precision 20 ele já vai dar uma boa precisão
        --Na criação padrão da tebela ele vai arredondar para baixo porque so sao 2 casa 0, 1, 2, 3, 4 e 5
        UPDATE PRODUTOS05 
        SET VLR = 800.001
        WHERE ID_PRODUTOS05 = 8;
    
        SELECT * FROM PRODUTOS05 WHERE ID_PRODUTOS05 = 8;
    
    --ARREDONDAMENTO PARA CIMA
        -- soma 1 = 6, 7, 8, 9
        UPDATE PRODUTOS05 
        SET VLR = 800.006
        WHERE ID_PRODUTOS05 = 8;
    
        SELECT * FROM PRODUTOS05 WHERE ID_PRODUTOS05 = 8;
    
    --ARREDONDAMENTO PARA CIMA => SQL SERVER
        -- usa o impar mais proximo
        --numero 5 = joga para cima, 0.25 = .03
        UPDATE PRODUTOS05 
        SET VLR = 800.025
        WHERE ID_PRODUTOS05 = 8;
    
        SELECT * FROM PRODUTOS05 WHERE ID_PRODUTOS05 = 8;

    INSERT INTO VENDAS05 (ID_VENDAS05, NUMERO) VALUES (1,10);
    SELECT * FROM VENDAS05;

    --Se for da forma obsolete dando um select max() da muita merda, porque se todo mundo entrar na tela o sitema vai dar o select max e vai alocar o mesmo ID para tood mundo
    -- ai o primeiro qeu salvar vai dar certo, ja os outros nao kkkk
    
    --Sequence ela nunca vai permitir que se repita uma PK, se já passou pelo 1 nunca mais vai ter uma PK 1
    INSERT INTO VENDAS05(ID_VENDAS05, NUMERO, DT_HR, VLR_TOTAL, QTDE_ITENS, CLI_NOME, STATUS) 
      VALUES(NEXT VALUE FOR VENDAS05_SEQ, 20, GETDATE()+1, 0, 0, 'JOAQUIM ESPINOSA', 'A');
    INSERT INTO VENDAS05(ID_VENDAS05, NUMERO, DT_HR, VLR_TOTAL, QTDE_ITENS, CLI_NOME, STATUS) 
      VALUES(NEXT VALUE FOR VENDAS05_SEQ, 30, GETDATE()+10, 0, 0, 'JOAQUIM ESPINOSA', 'F');
    INSERT INTO VENDAS05(ID_VENDAS05, NUMERO, DT_HR, VLR_TOTAL, QTDE_ITENS, CLI_NOME, STATUS) 
      VALUES(NEXT VALUE FOR VENDAS05_SEQ, 40, GETDATE()-30, 0, 0, 'MARTA ROCHA', 'A');
    INSERT INTO VENDAS05(ID_VENDAS05, NUMERO, DT_HR, VLR_TOTAL, QTDE_ITENS, CLI_NOME, STATUS) 
      VALUES(NEXT VALUE FOR VENDAS05_SEQ, 50, GETDATE()-15, 0, 0, 'JOS? AUGUSTO', 'A');
    INSERT INTO VENDAS05(ID_VENDAS05, NUMERO, DT_HR, VLR_TOTAL, QTDE_ITENS, CLI_NOME, STATUS) 
      VALUES(NEXT VALUE FOR VENDAS05_SEQ, 61, GETDATE()-15, 0, 0, 'JOSE AUGUSTO', 'A');
    --ERRO UK => TROCA DE 61 PARA 62
    INSERT INTO VENDAS05(ID_VENDAS05, NUMERO, DT_HR, VLR_TOTAL, QTDE_ITENS, CLI_NOME, STATUS) 
      VALUES(NEXT VALUE FOR VENDAS05_SEQ, 62, GETDATE()-15, 0, 0, 'RAMON SILVA', 'F');
    INSERT INTO VENDAS05(ID_VENDAS05, NUMERO, DT_HR, VLR_TOTAL, QTDE_ITENS, CLI_NOME, STATUS) 
      VALUES(NEXT VALUE FOR VENDAS05_SEQ, 63, GETDATE()-18, 0, 0, 'ALBERTO ROBERTO', 'F');
    
    SELECT * FROM VENDAS05
    
--BEGIN { TRAN | TRANSACTION }   
    BEGIN
      PRINT 'PASSO 0 -> PROTEGENDO O BLOCO'
      BEGIN TRAN--START, antes disso ele vai rodar sem do
      --Se cair a conexão, o padrão do banco de dados é um ROLLBACK

      --Oracle
      -- shared pull: area do oracle que amarzena o resultado de rquerys mais comuns, para não precisar reprocessar
      -- antes ele armazena em uma area (igual sql server) os comandos mesmo, o select em si
      -- mas ele verifica que aquele select acabou de ser rodado, então ele vai direto para shared pull
    
      ----------
      PRINT 'PASSO 1 -> EXIBINDO REGISTROS'
    
      SELECT * FROM VENDAS05
    
      ----------
      PRINT 'PASSO 2 -> APAGANDO TODOS OS REGISTROS'
    
      DELETE FROM VENDAS05
    
      SELECT * FROM VENDAS05
    
      ----------
      PRINT 'PASSO 3 -> DESFAZENDO'
    
      ROLLBACK TRANSACTION
    
      SELECT * FROM VENDAS05
      ----------
    END
    GO

    --ACERTA REGISTROS ANTES
        UPDATE VENDAS05 SET ID_VENDAS05 = 1 WHERE NUMERO = 10;
        UPDATE VENDAS05 SET ID_VENDAS05 = 2 WHERE NUMERO = 20;
        UPDATE VENDAS05 SET ID_VENDAS05 = 3 WHERE NUMERO = 30;
        UPDATE VENDAS05 SET ID_VENDAS05 = 4 WHERE NUMERO = 40;
        UPDATE VENDAS05 SET ID_VENDAS05 = 5 WHERE NUMERO = 50;
        UPDATE VENDAS05 SET ID_VENDAS05 = 6 WHERE NUMERO = 61;
        UPDATE VENDAS05 SET ID_VENDAS05 = 7 WHERE NUMERO = 62;
        UPDATE VENDAS05 SET ID_VENDAS05 = 8 WHERE NUMERO = 63;
        SELECT * FROM VENDAS05;
    
    --10,20,30,40,50,61,62,63
    --DELETE FROM VENDAS99ITEM
        INSERT INTO VENDAS05ITEM(ID_VENDAS05ITEM, ID_VENDAS05, ID_PRODUTOS05, QTDE, VLR_UNIT)
          VALUES(1, 1, 1, 5, 100);
        INSERT INTO VENDAS05ITEM(ID_VENDAS05ITEM, ID_VENDAS05, ID_PRODUTOS05, QTDE, VLR_UNIT)
          VALUES(2, 1, 2, 1, 60);
        INSERT INTO VENDAS05ITEM(ID_VENDAS05ITEM, ID_VENDAS05, ID_PRODUTOS05, QTDE, VLR_UNIT)
          VALUES(3, 1, 3, 6, 300);
        
        INSERT INTO VENDAS05ITEM(ID_VENDAS05ITEM, ID_VENDAS05, ID_PRODUTOS05, QTDE, VLR_UNIT)
          VALUES(4, 2, 8, 4, 800.50);
        INSERT INTO VENDAS05ITEM(ID_VENDAS05ITEM, ID_VENDAS05, ID_PRODUTOS05, QTDE, VLR_UNIT)
          VALUES(5, 2, 10, 2, 650);
        
        INSERT INTO VENDAS05ITEM(ID_VENDAS05ITEM, ID_VENDAS05, ID_PRODUTOS05, QTDE, VLR_UNIT)
          VALUES(6, 3, 2, 4, 50.50);
        INSERT INTO VENDAS05ITEM(ID_VENDAS05ITEM, ID_VENDAS05, ID_PRODUTOS05, QTDE, VLR_UNIT)
          VALUES(7, 3, 1, 2, 18.70);
        
        INSERT INTO VENDAS05ITEM(ID_VENDAS05ITEM, ID_VENDAS05, ID_PRODUTOS05, QTDE, VLR_UNIT)
          VALUES(8, 4, 3, 4, 600.05);
        
        INSERT INTO VENDAS05ITEM(ID_VENDAS05ITEM, ID_VENDAS05, ID_PRODUTOS05, QTDE, VLR_UNIT)
          VALUES(9, 5, 4, 2, 700);
        
        INSERT INTO VENDAS05ITEM(ID_VENDAS05ITEM, ID_VENDAS05, ID_PRODUTOS05, QTDE, VLR_UNIT)
          VALUES(10, 6, 5, 4, 800.50);
        INSERT INTO VENDAS05ITEM(ID_VENDAS05ITEM, ID_VENDAS05, ID_PRODUTOS05, QTDE, VLR_UNIT)
          VALUES(11, 6, 6, 2, 10);
        INSERT INTO VENDAS05ITEM(ID_VENDAS05ITEM, ID_VENDAS05, ID_PRODUTOS05, QTDE, VLR_UNIT)
          VALUES(12, 6, 7, 4, 89.50);
        INSERT INTO VENDAS05ITEM(ID_VENDAS05ITEM, ID_VENDAS05, ID_PRODUTOS05, QTDE, VLR_UNIT)
          VALUES(13, 6, 8, 2, 520);
        
        INSERT INTO VENDAS05ITEM(ID_VENDAS05ITEM, ID_VENDAS05, ID_PRODUTOS05, QTDE, VLR_UNIT)
          VALUES(14, 7, 9, 4, 80.50);
        INSERT INTO VENDAS05ITEM(ID_VENDAS05ITEM, ID_VENDAS05, ID_PRODUTOS05, QTDE, VLR_UNIT)
          VALUES(15, 7, 10, 2, 85);
        INSERT INTO VENDAS05ITEM(ID_VENDAS05ITEM, ID_VENDAS05, ID_PRODUTOS05, QTDE, VLR_UNIT)
          VALUES(16, 7, 8, 4, 21);
        INSERT INTO VENDAS05ITEM(ID_VENDAS05ITEM, ID_VENDAS05, ID_PRODUTOS05, QTDE, VLR_UNIT)
          VALUES(17, 7, 2, 2, 350);
        INSERT INTO VENDAS05ITEM(ID_VENDAS05ITEM, ID_VENDAS05, ID_PRODUTOS05, QTDE, VLR_UNIT)
          VALUES(18, 7, 1, 4, 45.50);
        INSERT INTO VENDAS05ITEM(ID_VENDAS05ITEM, ID_VENDAS05, ID_PRODUTOS05, QTDE, VLR_UNIT)
          VALUES(19, 7, 1, 2, 70);
        INSERT INTO VENDAS05ITEM(ID_VENDAS05ITEM, ID_VENDAS05, ID_PRODUTOS05, QTDE, VLR_UNIT)
          VALUES(20, 7, 8, 2, 20);
    
          SELECT * FROM VENDAS05ITEM;
    
--Indexs
    --É uma tabela, que é ligada diretaente a tabela e ao campo
    --é um esoelho, se voce inseriu em uma tabela ele tambem vai armazenar na "tabela" de indice
    -- NUNCA criar um indeice quando a tebela recebe milhoes de registros por segundo