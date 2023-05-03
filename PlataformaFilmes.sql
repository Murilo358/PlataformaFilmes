create database PlataformaFilmes

Use PlataformaFilmes

create table Cliente
(
CodigoCliente int primary key identity, 
Nome varchar(50) not null,
CPF char (14) not null, 
GeneroSexual varchar (15), 
DataNascimento date not null, 
Email varchar(50)not null, 
Senha varchar (15) not null,
DataContratacao date not null,
DataVencimentoFatura date not null,
Datalnterrupcao date,
CEP char (9),
NumeroResidencia char (3), 
ComplementoResidencia varchar(50),
Plano int references Plano(CodigoPlano), 
Pagamento int references Pagamento (CodigoPagamento),
)
create table Filme
(
CodigoFilme int primary key identity, 
TituloIdiomaOrigem varchar (50) not null, 
TituloFilmePtBr varchar (50) not null, 
Sinopse varchar (200) not null, 
TempoDuracaoMin datetime not null,
PossuiLegendaPt      char(1)      check(PossuiLegendaPt    =      'S'      or      PossuiLegendaPt     =      'N')not null,
PossuiLegendaEn     char(1)     check(PossuiLegendaEn     =     'S'     or     PossuiLegendaEn     =     'N')not     null,
PossuiDublado char(1) check(PossuiDublado = 'S' or PossuiDublado = 'N')not null, 
IDProdutora int references Produtora(CodigoProdutora),
IDDiretores int references Diretores(CodigoDiretor),
IDClassificacaoEtaria int references ClassificacaoEtaria(CodigoClassificacaoEtaria), 
IDAtoresFilme int references Atores(CodigoAtores) 
)
create table Genero
(
CodigoGenero int primary key identity, 
NomeGenero varchar (50) not null 
)

create table RelacaoPreferenciaCliente
(
IDCliente INT references Cliente(CodigoCliente), 
IDGenero INT references Genero (CodigoGenero) 
)
create table RelacaoFilmeGenero
(
IDFilme INT references Filme(CodigoFilme),
IDGenero INT references Genero (CodigoGenero) 
)
create table ClassificacaoEtaria
(
CodigoClassificacaoEtaria int primary key identity, 
Nome varchar (10) not null ,
Descricao varchar (50) not null 
)

create table Diretores
(
CodigoDiretor int primary key identity, 
Nome varchar(50) not null
)
create table Pais
(
CodigoPais int primary key identity, 
NomePais varchar(30) not null
)
create table Produtora
(
CodigoProdutora int primary key identity, 
NomeProdutora varchar(40) not null,
IdPais int references Pais(CodigoPais) not null
)
create table Atores
(
CodigoAtores int primary key identity, 
Nome varchar (50) not null
)

create table Visualizacao
(
CodigoVisualizacao int primary key identity, 
IdCliente int references Cliente(CodigoCliente),
IDFilme int references Filme(CodigoFilme),
DataEHora Date,
MinutosAssistidos Datetime 
)
create table Plano
(
CodigoPlano int primary key identity, 
Nome varchar(50) not null, 
Minutos datetime not null,
Valor Money
)
create table Pagamento
(
CodigoPagamento Int primary key identity, 
DataPagamento date not null, 
ValorEsperado money not null, 
DataVencimento date not null, 
ValorPago money not null,
IDFormaPagamento INT references FormaPagamento (CodigoFormaPagamento)
)
create table FormaPagamento
(
CodigoFormaPagamento int primary key identity, 
Nome varchar (50) not null
)

create table StatusFilme
(
CodigoStatusFilme int primary key identity,
CodigoFilme int references Filme(CodigoFilme),
CodigoCliente int references Cliente (CodigoCliente),
CodigoStatus int references Statuss (CodigoStatus)
)
create table Statuss
(
CodigoStatus int primary key identity,
Nome varchar (100)
)
