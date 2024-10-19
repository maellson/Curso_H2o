-- Criação da tabela
CREATE TABLE situacao (
    Codi_Situ VARCHAR(2) PRIMARY KEY,
    Desc_Situ VARCHAR(50) NOT NULL,
    Defi_Situ TEXT
);

-- Inserção dos dados
INSERT INTO situacao (Codi_Situ, Desc_Situ, Defi_Situ) VALUES
('01', 'Ativo(a)', 'O Título tem situação Ativo quando ele representa um lançamento de um Auto de Infração, de uma Divida Ativa (IPTU) ou de uma Execução.'),
('02', 'Pendente', 'A situação Pendente refere-se apenas ao Título de pagamento parcelado muda para em proposta ao gerar o boleto.'),
('03', 'Em Proposta', 'A situação Em Proposta se refere ao Título de pagamento (cota única ou parcelado). Esse Título adquire esta situação quando o Contribuinte solicita pagamento do seu débito.'),
('04', 'Em Acordo', 'Apenas o Título de Parcelamento fica "Em Acordo", quando a primeira parcela do Parcelamento for paga.'),
('05', 'Liquidado(a)', 'O Título de PAGAMENTO (Cota Única ou Parcelamento) fica Liquidado quando for totalmente pago. O Título de Lançamento da CDA (Execução) quando a mesma for paga através de um Título de Pagamento.'),
('06', 'Em Negociacao Pendente', 'Refere-se ao Título de Lançamento de Auto de Infração: quando for solicitado um pagamento.'),
('07', 'Quitado', 'Refere-se ao Título de Lançamento de Auto de Infração: quando for paga uma cota única.'),
('09', 'Em Dívida', 'Títulos em dívida.'),
('10', 'Executado', 'Título de Auto de Infração, quando o mesmo for Executado.'),
('12', 'Cancelado(a)', 'Quando um Título de Pagamento é Cancelado. Quando um Título de Lançamento de Auto de Infração for cancelado, por causa do cancelamento do Auto.'),
('33', 'Suspenso(a) pela Justiça', 'Título de Lançamento de Auto de Infração ou CDA, quando o mesmo for suspenso(a) pela Justiça.'),
('39', 'Cancelado c/ Geração de Crédito', 'Situação criada para títulos com parcelas pagas, onde o pagamento gera um crédito para a pessoa.'),
('46', 'Suspensão Administrativa', 'Situação a ser atribuída a uma CDA.');


-- Criação da tabela
CREATE TABLE tipoTributos (
    Codi_Tipo VARCHAR(4) PRIMARY KEY,
    Desc_Tipo VARCHAR(100) NOT NULL
);

-- Inserção dos dados
INSERT INTO tipoTributos (Codi_Tipo, Desc_Tipo) VALUES
('1120', 'IPTU  -  Valor Parcelado'),
('1131', 'IPTU  -  Valor Total'),
('1317', 'ISS  -  Pessoa Jurídica  -  Valor Total'),
('1318', 'ISS  -  Pessoa Jurídica  -  Valor Parcelado'),
('1340', 'ISS  -  Pessoa Física  -  Cota Única c/ Desconto'),
('1341', 'ISS  -  Pessoa Física  -  Valor Total'),
('1342', 'ISS  -  Pessoa Física  -  Valor Parcelado'),
('6323', 'IPTU  -  Valor Total  (Dívida Ativa)'),
('6324', 'IPTU  -  Valor Parcelado (Dívida Ativa)'),
('6325', 'IPTU  -  CDA (CDA)'),
('6326', 'IPTU  -  Valor Total (CDA)'),
('6334', 'TCR -  CDA (Dívida)'),
('6335', 'TCR -  Valor Total  (CDA)'),
('6336', 'TCR -  Valor Parcelado  (CDA)'),
('9998', 'Lançamento Único TCR'),
('9999', 'Lançamento Único IPTU');




-- Criação da tabela TITULOS
CREATE TABLE TITULOS (
    Nume_Titu VARCHAR(12) PRIMARY KEY,
    Codi_Imov VARCHAR(6),
    Codi_Cont VARCHAR(6),
    Data_Lanc TIMESTAMP NOT NULL,
    Peri_Refe CHAR(6),
    Valo_Titu DECIMAL(15,10),
    Codi_Tipo VARCHAR(4),
    Codi_Situ VARCHAR(2)
);

-- Inserção dos dados
-- Inserção dos dados com o campo Codi_Cont
/*INSERT INTO TITULOS (Nume_Titu, Codi_Imov, Codi_Cont, Data_Lanc, Peri_Refe, Valo_Titu, Codi_Tipo, Codi_Situ) VALUES
('202300714608', '385239', NULL, '2023-01-06 19:10:00', '2023  ', 33.4742843900, '9998', '09'),
('202300714609', '385240', NULL, '2023-01-06 19:10:00', '2023  ', 12.9809938895, '1120', '05'),
('202300714614', '385242', NULL, '2023-01-06 19:10:00', '2023  ', 23.7305810315, '9998', '09'),
('202300714619', '385245', NULL, '2023-01-06 19:10:00', '2023  ', 122.6477917031, '9999', '09'),
('202300714620', '385245', NULL, '2023-01-06 19:10:00', '2023  ', 24.9783862313, '9998', '09');

*/

-- Criação da tabela IMOVEIS
CREATE TABLE IMOVEIS (
    Codi_Imov VARCHAR(6) PRIMARY KEY,
    Atividade VARCHAR(100),
    Tipo_Imovel VARCHAR(50),
    Desc_Bair VARCHAR(50),
    Coleta VARCHAR(3),
    Rede_Esgo VARCHAR(30),
    Garagem VARCHAR(3),
    Area_Terreno DECIMAL(10,2),
    Area_Predial DECIMAL(10,2),
    Patrimonio VARCHAR(20),
    VV_EDIFICACAO DECIMAL(15,2),
    VV_TERRENO DECIMAL(15,2),
    VV_TOTAL_IMOVEL DECIMAL(15,2)
);

/*
-- Inserção dos dados
INSERT INTO IMOVEIS (Codi_Imov, Atividade, Tipo_Imovel, Desc_Bair, Coleta, Rede_Esgo, Garagem, Area_Terreno, Area_Predial, Patrimonio, VV_EDIFICACAO, VV_TERRENO, VV_TOTAL_IMOVEL) VALUES
('065515', 'RESIDENCIAIS', 'PREDIAL', 'VILA DOS NAVEGANTES', 'SIM', 'COM REDE DE ESGOTO', 'SIM', 297.50, 107.39, 'PRIVADO', 15783.19, 925.33, 16708.52),
('065525', 'RESIDENCIAL FECHADO', 'PREDIAL', 'VILA DOS NAVEGANTES', 'SIM', 'COM REDE DE ESGOTO', 'NAO', 140.00, 34.00, 'PRIVADO', 4997.00, 857.62, 5854.62),
('065530', 'RESIDENCIAIS', 'PREDIAL', 'VILA DOS NAVEGANTES', 'SIM', 'COM REDE DE ESGOTO', 'NAO', 94.50, 96.43, 'PRIVADO', 19271.01, 417.53, 19688.54),
('065535', 'RESIDENCIAIS', 'PREDIAL', 'VILA DOS NAVEGANTES', 'SIM', 'COM REDE DE ESGOTO', 'NAO', 198.40, 60.00, 'PRIVADO', 16935.55, 801.20, 17736.75),
('065536', 'RESIDENCIAIS', 'PREDIAL', 'VILA DOS NAVEGANTES', 'SIM', 'COM REDE DE ESGOTO', 'NAO', 177.00, 105.23, 'PRIVADO', 21856.91, 778.63, 22635.54),
('065537', 'RESIDENCIAIS', 'PREDIAL', 'VILA DOS NAVEGANTES', 'SIM', 'COM REDE DE ESGOTO', 'SIM', 196.00, 90.25, 'PRIVADO', 25473.89, 767.35, 26241.24),
('065548', 'RESIDENCIAIS', 'PREDIAL', 'VILA DOS NAVEGANTES', 'SIM', 'SEM REDE DE ESGOTO', 'SIM', 117.00, 162.06, 'PRIVADO', 24936.03, 618.19, 25554.22),
('057762', 'MATERIAL DE CONSTRUCAO,MADEIRAS OU PEDRAS', 'PREDIAL', 'PRAIA DOS VARADOURES', 'SIM', 'SEM REDE DE ESGOTO', 'SIM', 952.00, 883.42, 'PRIVADO', NULL, NULL, NULL),
('057765', 'MATERIAL DE CONSTRUCAO, MADEIRAS OU PEDRAS', 'PREDIAL', 'PRAIA DOS VARADOURES', 'SIM', 'SEM REDE DE ESGOTO', 'NAO', 247.50, 247.50, 'PRIVADO', 159416.36, 2653.21, 162069.57);

*/

---

-- Criação da tabela PAGAMENTOS
CREATE TABLE PAGAMENTOS (
    Nume_Titu VARCHAR(12) NOT NULL,
    Nume_Parc VARCHAR(2),
    Codi_Tipo VARCHAR(4) ,
    Valor_Titulo DECIMAL(15,10),
    Data_Paga TIMESTAMP,
    Peri_Refe CHAR(6),
    Valor_Pago DECIMAL(15,10) ,
    PRIMARY KEY (Nume_Titu, Nume_Parc)
);

/*
-- Inserção dos dados
INSERT INTO PAGAMENTOS (Nume_Titu, Nume_Parc, Codi_Tipo, Valor_Titulo, Data_Paga, Peri_Refe, Valor_Pago) VALUES
('202301102240', '01', '1131', 117.8539278488, '2023-06-01 00:00:00', '2023  ', 134.0499300337),
('202301335606', '01', '1131', 34.8748820633, '2023-11-21 00:00:00', '2023  ', 40.1080242787),
('202300749635', '01', '1120', 15.2378660493, '2023-05-12 00:00:00', '2023  ', 15.2378660493),
('202300749635', '02', '1120', 15.2378660493, '2023-05-12 00:00:00', '2023  ', 14.4930027413),
('202300749635', '03', '1120', 15.2378660493, '2023-05-12 00:00:00', '2023  ', 13.4998516639),
('202300749635', '04', '1120', 15.2378660493, '2023-05-29 00:00:00', '2023  ', 13.1847171874),
('202301326769', '02', '1120', 106.1462045712, '2023-04-03 00:00:00', '2023  ', 106.1462045712);

*/

-- Criação da tabela CONTRIBUINTES
CREATE TABLE CONTRIBUINTES (
    Codi_Cont INT PRIMARY KEY,
    SituacaoContribuinte VARCHAR(20),
    Desc_Bair VARCHAR(50),
    AtividadeContribuinte VARCHAR(10),
    DescricaoAtividadeContribuinte VARCHAR(50)
);

/*
-- Inserção dos dados na tabela CONTRIBUINTES
INSERT INTO CONTRIBUINTES (Codi_Cont, SituacaoContribuinte, Desc_Bair, AtividadeContribuinte, DescricaoAtividadeContribuinte) VALUES
(57, 'Ativa', 'ZONA INDUSTRIAL NOVA', '30106', 'BORRACHAS, PLASTICOS COUROS OU PAPEIS E CONGENERES'),
(297, 'Ativa', NULL, '11523', 'CLINICA DE ULTRASONOGRAFIA'),
(528, 'Ativa', 'VILA ACADÊMICA', '10401', 'CONSTRUCAO CIVIL E ATIVIDADES AFINS'),
(531, 'Ativa', 'VILA CENTRAL', '10601', 'ENSINO DE 1 GRAU, 2 GRAU OU 3 GRAU'),
(742, 'Ativa', 'PRAIA DOS VARADOURES', '20113', 'MOVEIS EM GERAL'),
(1454, 'Ativa', 'VILA CENTRAL', '11508', 'AMBULATORIO OU POSTO DE ENFERMAGEM'),
(2286, 'Ativa', 'NAÇÕES UNIDAS', '10401', 'CONSTRUCAO CIVIL E ATIVIDADES AFINS');

*/