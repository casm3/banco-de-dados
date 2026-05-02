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
    (3, 'Tecnologia da Informação'),
    (4, 'Inovação'),
    (5, 'Vendas');

INSERT INTO empregado (cpf, nome, data_nascimento, salario, numero_departamento) VALUES 
    ('111.111.111-11', 'João Silva', '1985-01-15', 5500.00, 1),
    ('222.222.222-22', 'Maria Luiza', '1990-05-22', 6200.00, 3),
    ('333.333.333-33', 'Carlos Eduardo', '1982-11-08', 4800.00, 1),
    ('444.444.444-44', 'Ana Beatriz', '1995-03-10', 3500.00, 2),
    ('555.555.555-55', 'Fernando Souza', '1988-07-30', 5900.00, 3),
    ('666.666.666-66', 'Patrícia Lima', '1992-08-14', 4200.00, 2),
    ('777.777.777-77', 'Roberto Alves', '1980-12-05', 7500.00, 1),
    ('888.888.888-88', 'Camila Rocha', '1998-02-20', 3100.00, 5),
    ('999.999.999-99', 'Marcos Gomes', '1987-09-25', 5300.00, 5),
    ('101.101.101-01', 'Luciana Costa', '1991-04-30', 8100.00, 3),
    ('202.202.202-02', 'Bruno Martins', '1985-06-12', 4500.00, 1),
    ('303.303.303-03', 'Aline Ferreira', '1994-10-18', 6800.00, 3),
    ('404.404.404-04', 'Diego Mendes', '1989-01-22', 3800.00, 2);

INSERT INTO projeto (codigo, nome, localizacao) VALUES 
    (10, 'App Mobile', 'São Paulo'),
    (20, 'Migração Cloud', 'Recife'),
    (30, 'Treinamento Corporativo', 'Garanhuns'),
    (40, 'E-commerce B2B', 'São Paulo'),
    (50, 'Automação RH', 'Recife'),
    (60, 'Expansão Agreste', 'Garanhuns');

INSERT INTO empregado_projeto (cpf_empregado, codigo_projeto, horas) VALUES 
    ('111.111.111-11', 10, 32.5),
    ('111.111.111-11', 20, 7.5),
    ('222.222.222-22', 20, 40.0),
    ('333.333.333-33', 10, 20.0),
    ('444.444.444-44', 30, 40.0),
    ('555.555.555-55', 20, 15.0),
    ('555.555.555-55', 30, 25.0),
    ('666.666.666-66', 50, 20.0),
    ('666.666.666-66', 30, 10.0),
    ('777.777.777-77', 10, 15.0),
    ('777.777.777-77', 40, 25.0),
    ('888.888.888-88', 60, 40.0),
    ('999.999.999-99', 60, 35.0),
    ('101.101.101-01', 20, 20.0),
    ('101.101.101-01', 40, 20.0),
    ('202.202.202-02', 10, 10.0),
    ('202.202.202-02', 50, 30.0),
    ('303.303.303-03', 40, 40.0),
    ('404.404.404-04', 50, 40.0);
