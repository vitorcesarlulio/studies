Sempre que é feita uma ação de um registro

SQL SERVER
Trigger no momento da ação e depois

ORACLE
antes, depois

cast() faz conversão
o retorno de um select é só o retorno de um select, se o campo é numeric e voce quer inserir na tabela a partir de um select n vai dar certo, porque n vai bater os tipos

se a tabela tiver vazia e voce der um max() ele vai retorar null
no oracle ele ja retorna 0 porque sabe que voce vai fazer uma conta

De vez de verificar se ja existe o objeto nos banco mais novo tem como dar um CREATE OR ALTER TRIGGER testes


ON <TABELA> AFTER INSERT
AFTER INSERT =  depois de inserir
sempre que é depois, se o cara definir um valor em um insert por exemplo, a trigger vai vir e vai alterar (caso seja a mesma coluna)

AFTER INSERT, UPDATE, DELETE = ela dispara depois de cada uma dessas ações

ON INSERT = no momento da inserção

depois de uma tabela criada com dados, e voce quer inserir uma nova coluna O CORRETO É ADICIONAR A TABELA E SE ELA FOR NOT NULL VOCE COLOCAR UM PADRÃO DEFAULT

mas imagina que é um campo varchar, vc pode colocar um default de '', mas existe uma opção que é criar a coluna sem not null e sem default
ai voce da um update na tabela, coloca um valor nessa coluna
ai sim voce da um update colocando not null
depende do caso, mas vc vai ficar sem um default, isso é ruim;

PROCEDURES
	faz e morre, tem parametros de entrada, de saida
	
FUNÇÕES
	varios parametros de entrada
	apenas um retorno