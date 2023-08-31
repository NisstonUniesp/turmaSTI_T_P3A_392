-- ----------------------------------------------------------------------
-- MySQL Migration Toolkit
-- SQL Create Script
-- ----------------------------------------------------------------------
-- Tables

CREATE TABLE Clientes (
  IDCliente INT PRIMARY KEY,
  CodigoDoCliente VARCHAR(5) NOT NULL,
  NomeDaEmpresa VARCHAR(40) NULL,
  NomeDoContato VARCHAR(30) NULL,
  CargoDoContato VARCHAR(30) NULL,
  Endereco VARCHAR(60) NULL,
  Cidade VARCHAR(15) NULL,
  Regiao VARCHAR(15) NULL,
  CEP VARCHAR(10) NULL,
  Pais VARCHAR(15) NULL,
  Telefone VARCHAR(24) NULL,
  Fax VARCHAR(24) NULL
);

CREATE TABLE Funcionarios (
  CodigoDoFuncionario INT PRIMARY KEY,
  Sobrenome VARCHAR(20) NULL,
  Nome VARCHAR(10) NULL,
  Cargo VARCHAR(30) NULL,
  Tratamento VARCHAR(25) NULL,
  DataDeNascimento DATE NULL,
  DataDeContratacao DATE NULL,
  Endereco VARCHAR(60) NULL,
  Cidade VARCHAR(15) NULL,
  Regiao VARCHAR(15) NULL,
  CEP VARCHAR(10) NULL,
  Pais VARCHAR(15) NULL,
  TelefoneResidencial VARCHAR(24) NULL,
  Ramal VARCHAR(4) NULL,
  Foto VARCHAR(15) NULL,
  Observacoes text NULL,
  Supervisor INT NULL,
  FOREIGN KEY (Supervisor) REFERENCES Funcionarios(CodigoDoFuncionario)
);


CREATE TABLE Transportadoras (
  CodigoDaTransportadora INT PRIMARY KEY,
  NomeDaEmpresa VARCHAR(40) NULL,
  Telefone VARCHAR(24) NULL
);

CREATE TABLE Pedidos (
  NumeroDoPedido INT PRIMARY KEY,
  IDCliente INT NULL,
  CodigoDoFuncionario INT NULL,
  DataDoPedido DATE NULL,
  DataDeEntrega DATE NULL,
  DataDeEnvio DATE NULL,
  CodigoDaTransportadora INT NULL,
  Frete DECIMAL(19, 4) NULL,
  NomeDoDestinatario VARCHAR(40) NULL,
  EndereçoDoDestinatario VARCHAR(60) NULL,
  CidadeDeDestino VARCHAR(15) NULL,
  RegiaoDeDestino VARCHAR(15) NULL,
  CEPdeDestino VARCHAR(10) NULL,
  PaisDeDestino VARCHAR(15) NULL,
  FOREIGN KEY (IDCliente) REFERENCES Clientes(IDCliente),
  FOREIGN KEY (CodigoDoFuncionario) REFERENCES Funcionarios(CodigoDoFuncionario),
  FOREIGN KEY (CodigoDaTransportadora) REFERENCES Transportadoras(CodigoDaTransportadora)
);

CREATE TABLE Categorias (
  CodigoDaCategoria INT PRIMARY KEY,
  NomeDaCategoria VARCHAR(15) NULL,
  Descricao VARCHAR(50) NULL,
  Figura VARCHAR(15) NULL
);

CREATE TABLE Fornecedores (
  CodigoDoFornecedor INT PRIMARY KEY,
  NomeDaEmpresa VARCHAR(40) NULL,
  NomeDoContato VARCHAR(30) NULL,
  CargoDoContato VARCHAR(30) NULL,
  Endereco VARCHAR(60) NULL,
  Cidade VARCHAR(15) NULL,
  Regiao VARCHAR(15) NULL,
  CEP VARCHAR(10) NULL,
  Pais VARCHAR(15) NULL,
  Telefone VARCHAR(24) NULL,
  Fax VARCHAR(24) NULL,
  HomePage text NULL
);


CREATE TABLE Produtos (
  CodigoDoProduto INT PRIMARY KEY,
  NomeDoProduto VARCHAR(40) NULL,
  CodigoDoFornecedor INT NULL,
  CodigoDaCategoria INT NULL,
  QuantidadePorUnidade VARCHAR(25) NULL,
  PrecoUnitario DECIMAL(19, 4) NULL,
  UnidadesEmEstoque INT NULL,
  UnidadesPedidas INT NULL,
  NivelDeReposicao INT NULL,
  Descontinuado INT NOT NULL,
  FOREIGN KEY (CodigoDoFornecedor) REFERENCES Fornecedores(CodigoDoFornecedor),
  FOREIGN KEY (CodigoDaCategoria) REFERENCES Categorias(CodigoDaCategoria)
);

CREATE TABLE Detalhes_do_Pedido (
  NumeroDoPedido INT PRIMARY KEY,
  CodigoDoProduto INT NULL,
  PrecoUnitário INT NULL,
  Quantidade INT NULL,
  Desconto INT NULL,
  FOREIGN KEY (CodigoDoProduto) REFERENCES Produtos(CodigoDoProduto)
);


-- ----------------------------------------------------------------------
-- EOF