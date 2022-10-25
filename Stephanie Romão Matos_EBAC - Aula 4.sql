--
--*** CRIAÇÃO TABELA TRANSAÇÃO ***
--

create table tbVendas_Final (
CodCliente		int,
Categoria		varchar(50),
Subcategoria	varchar(50),
Produto			varchar(50),
Ano				int,
Mes				int,
Cidade			varchar(50),
Valor			float,
Volume			float)

select * from tbVendas_Final


--
--*** CARGA DE DADOS VIA BULK INSERT ***
--
truncate table tbVendas_Final

BULK INSERT tbVendas_Final
	FROM 'C:\Users\Usuario\Desktop\Imersao Dados - EBAC\Meus exercises/vendas.csv'
	WITH
	(
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '0X0a'
	)

	select * from tbVendas_Final

--
--*** CRIAÇÃO TABELA POTENCIAL ***
--

create table tbPotencial_Final (
CodCliente			int,
Ano					int,
Area_Comercial		float,
Area_Hibrida		float,
Area_Residencial	float,
Area_Industrial		float,
ValorPotencial		float
)

select * from tbPotencial_Final


--
--*** CARGA DE DADOS VIA BULK INSERT ***
--
truncate table tbPotencial_Final

BULK INSERT tbPotencial_Final
	FROM 'C:\Users\Usuario\Desktop\Imersao Dados - EBAC\Meus exercises/potencial.csv'
	WITH
	(
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '0X0a'
	)


CREATE INDEX index_potencial ON tbPotencial_Final (CodCliente);
CREATE INDEX index_vendas ON tbVendas_Final (CodCliente);