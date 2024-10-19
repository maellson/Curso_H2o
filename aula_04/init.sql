-- Criação das Tabelas
CREATE TABLE unidadeSaude (
    id UUID PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    endereco VARCHAR(255) NOT NULL
);

CREATE TABLE profissionalSaude (
    id UUID PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    CBO VARCHAR(20) NOT NULL,
    descricao_CBO VARCHAR(255) NOT NULL
);

CREATE TABLE paciente (
    id UUID PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    bairro VARCHAR(100) NOT NULL,
    dataNascimento DATE NOT NULL,
    sexo CHAR(1) NOT NULL
);

CREATE TABLE atendimento (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    id_unidade UUID NOT NULL,
    nome_unidade VARCHAR(255) NOT NULL,
    id_paciente UUID NOT NULL,
    nome_paciente VARCHAR(255) NOT NULL,
    id_profissionalSaude UUID NOT NULL,
    nome_profissionalSaude VARCHAR(255) NOT NULL,
    CBO_profissional VARCHAR(20) NOT NULL,
    descricao_CBO_profissional VARCHAR(255) NOT NULL,
    data_hora_atendimento TIMESTAMP NOT NULL,
    CID VARCHAR(20) NOT NULL,
    FOREIGN KEY (id_unidade) REFERENCES unidadeSaude(id),
    FOREIGN KEY (id_paciente) REFERENCES paciente(id),
    FOREIGN KEY (id_profissionalSaude) REFERENCES profissionalSaude(id)
);

-- Inserindo Dados na Tabela unidadeSaude
INSERT INTO unidadeSaude (id, nome, endereco) VALUES
(gen_random_uuid(), 'Unidade de Saúde Central', 'Rua A, 123'),
(gen_random_uuid(), 'Unidade de Saúde Zona Norte', 'Rua B, 456'),
(gen_random_uuid(), 'Unidade de Saúde Zona Sul', 'Rua C, 789');

-- Inserindo Dados na Tabela profissionalSaude
INSERT INTO profissionalSaude (id, nome, CBO, descricao_CBO) VALUES
(gen_random_uuid(), 'Dr. João Silva', '2251-01', 'Médico Clínico Geral'),
(gen_random_uuid(), 'Dra. Maria Souza', '2251-01', 'Médico Clínico Geral'),
(gen_random_uuid(), 'Dr. Carlos Nunes', '2251-01', 'Médico Clínico Geral'),
(gen_random_uuid(), 'Enf. Ana Pereira', '2235-01', 'Enfermeiro'),
(gen_random_uuid(), 'Enf. Paulo Lima', '2235-01', 'Enfermeiro'),
(gen_random_uuid(), 'Tec. José Costa', '3222-01', 'Técnico de Enfermagem');
