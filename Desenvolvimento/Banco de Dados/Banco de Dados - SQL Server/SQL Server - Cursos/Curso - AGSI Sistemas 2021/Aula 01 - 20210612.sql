Banco de dados
O melhor banco é aquele que supre as necessidades do cliente, do ramo.

RELACIONAIS
Db2 só da IBM
Totsv usa sql server
Tem um custo mais caro, exige um DBA, para otimizar o banco, hardware mais potente
Exige amarrações internas
Existe uma integridade

NÃO RELACIONAL
Não exige tantas amarrações internas
Exemplos: mongodb, redis, memcached, Cassandra.

COMANDOS
DML - Linguagem de manipulação de dados
INSERT, UPDATE E DELETE

DDL - Linguagem de definição de dados
CREATE / ALTER
Em linguagens mais antigas não dava pra dar um alter direto, tinha que dropar

DCL - Linguagem de controle de dados
Quem tem acesso quem não tem e negar acesso
GRANT
REVOKE
DENY

DTL - Linguagem de transação de dados
START
COMMIT 
ROOLBACK
Sql server ele grava direto
Oracle ele pede um commit

DQL - Linguagem de consulta de dados
SELECT


DIALETOS
Conferir se comandos é suportado em versões antigas

TIPOS DE DADOS
Caracter:
    Varchar (ocupa dinamicamente)
    Char (ocupa a qtde de caracteres)
    Text

Número:
O que vai mudar é a faixa de tamanho dos campos
Numéric (maior que int, aceita inteiro e decimal)
Numéric(10,2)
8 inteiros
Onde 2 são decimais


Decimal (com virgulas)
Int (somente inteiros)
Float 

Date
Time
Datetime


BOAS PRÁTICAS
Nunca utilizar SELECT *, procure colocar os campos
Sempre utilize WHERE
Sempre utilize TOP (corte)

FN - Forma normal
FN1, FN2 e FN3

Não usem muitos tipos de dados

Tudo que for sobre números vai ser melhor para banco
Uma chave númerica e não caractere

Campos de data e hora tente juntalos

Nunca armazena total na tabela

Null + 10 = Null

Quando for um campo numérico coloca default como 0
Aí toda vez no seu SELECT vc n precisa ficar verificando se é isnull

Para campos de texto coloque um default vazio ''

Campo autoincremento não é bom usar!
Só 
