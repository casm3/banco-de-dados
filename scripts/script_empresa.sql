-- 1. Criando as Tabelas do banco

CREATE TABLE departamento (
    numero INT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE empregado (
    cpf VARCHAR(14) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE,
    salario NUMERIC(10, 2), -- 10 dígitos totais com 2 casas decimais
    numero_departamento INT,
    FOREIGN KEY (numero_departamento) REFERENCES departamento(numero)
);

CREATE TABLE projeto (
    codigo INT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    localizacao VARCHAR(50)
);

CREATE TABLE empregado_projeto (
    cpf_empregado VARCHAR(14),
    codigo_projeto INT,
    horas NUMERIC(5, 1),
    PRIMARY KEY (cpf_empregado, codigo_projeto),
    FOREIGN KEY (cpf_empregado) REFERENCES empregado(cpf),
    FOREIGN KEY (codigo_projeto) REFERENCES projeto(codigo)
);

-- 2. Povoamento do Banco

INSERT INTO departamento (numero, nome) VALUES 
    (1, 'Pesquisa e Desenvolvimento'),
    (2, 'Recursos Humanos'),
    (3, 'Tecnologia da Informação');

INSERT INTO empregado (cpf, nome, data_nascimento, salario, numero_departamento) VALUES 
    ('111.111.111-11', 'João Silva', '1985-01-15', 5500.00, 1),
    ('222.222.222-22', 'Maria Luiza', '1990-05-22', 6200.00, 3),
    ('333.333.333-33', 'Carlos Eduardo', '1982-11-08', 4800.00, 1),
    ('444.444.444-44', 'Ana Beatriz', '1995-03-10', 3500.00, 2),
    ('555.555.555-55', 'Fernando Souza', '1988-07-30', 5900.00, 3);

INSERT INTO projeto (codigo, nome, localizacao) VALUES 
    (10, 'App Mobile', 'São Paulo'),
    (20, 'Migração Cloud', 'Recife'),
    (30, 'Treinamento Corporativo', 'Garanhuns');

INSERT INTO empregado_projeto (cpf_empregado, codigo_projeto, horas) VALUES 
    ('111.111.111-11', 10, 32.5),
    ('111.111.111-11', 20, 7.5),
    ('222.222.222-22', 20, 40.0),
    ('333.333.333-33', 10, 20.0),
    ('444.444.444-44', 30, 40.0),
    ('555.555.555-55', 20, 15.0),
    ('555.555.555-55', 30, 25.0);
