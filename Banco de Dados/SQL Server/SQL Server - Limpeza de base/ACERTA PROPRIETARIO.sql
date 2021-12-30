-- Ajusta Código do Proprietário
update proprietarios 
set 
Codigo = 5369,
Nome = 'UNION LIFE ADMINISTRADORA DE BENEFICIO',
Endereco = 'AVENIDA PAULISTA',
Cidade = 'SAO PAULO',
Fone = '(19)3251-0745',
Logotipo = NULL,
CGC = '30.728.366/0001-42',
Cep = '01310-300',
Bairro = 'BELA VISTA',
UF = 'SP',
Numero = '2202',
Complemento = ''

update parametro set Plano_CGC = '30728366000142'

-- Libera Base
EXEC sp_valacess 9, '229901', '3045645'

EXEC sp_valacess

