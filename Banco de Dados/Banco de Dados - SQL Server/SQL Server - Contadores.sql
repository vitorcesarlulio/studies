--Eles são iniciados a partir do inicio da instancia, do serviço.
--Por exemplo quero saber quantos Logins foram feitos por dia, se pega o contador logins/sec e usa outra função do SQL Server para pegar quantos dias esta inicado o SQL Server

SELECT * FROM sys.dm_os_performace_counters WHERE counter_name LIKE '%Compilations/sec%';
/*
SQL Statistics – SQL Compilations/sec

Esse contador indica o número de vezes por Segundo que o SQL Server compila queries e procedures. O ideal é que esse número seja o menor possível. Altos picos podem indicar Dynamic SQL em excesso.
*/

SELECT * FROM sys.dm_os_performace_counters WHERE counter_name LIKE '%Re-Compilations/sec%';
/*
SQL Statistics – SQL Re-Compilations/sec

O SQL Server recompila a query quando o Plano de Execução é invalidado por algum evento significante. Este contador indica a quantidade de vezes por segundo que uma querie é recompilada. Recompilar, assim como compilar, utiliza recursos muito elevado no seu sistema e devem ser evitadas. Esses valores precisam ser o menor possível para garantir boa performance, idealmente menor que 10% do numero de Compilations/sec.
*/

SELECT * FROM sys.dm_os_performace_counters WHERE counter_name LIKE '%Optimizer Memory%';
/*
Memory Manager – Optimizer Memory

Esse contador indica a quantidade de memória que o SQL Server aloca para otimização de queries. Essa quantidade de memória tende a ser uniforme sem grandes variações. As variações no gráfico sugerem que muitas Dynamic SQL estão sendo executadas.
*/

SELECT * FROM sys.dm_os_performace_counters WHERE counter_name LIKE '%Stolen pages%';
/*
Esse contador esta relacionado à quantidade de páginas “roubadas” do SQL Server para serem utilizadas por outras operações como ordenação, transações, locks, etc. Números altos para esse contador indica queries pobres e/ou mal escritas que deveriam ser transcrita em Procedures para melhoramento da utlização do Cache do SQL Server;
Servidores com Stolen Pages elevados geralmente também possuem utilização elevada de CPU.
*/