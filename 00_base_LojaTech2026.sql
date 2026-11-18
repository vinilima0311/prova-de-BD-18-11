-- =====================================================================
-- SCRIPT BASE - Avaliação Prática de SQL (MySQL 8 / Workbench)
-- Execute este script UMA vez, inteiro, antes de começar a prova.
-- Faça commit deste arquivo no repositório sem alterá-lo.
-- =====================================================================

DROP DATABASE IF EXISTS LojaTech2026;
CREATE DATABASE LojaTech2026 CHARACTER SET utf8mb4;
USE LojaTech2026;

CREATE TABLE Clientes (
    Codigo         INT AUTO_INCREMENT PRIMARY KEY,
    Nome           VARCHAR(100) NOT NULL,
    Cidade         VARCHAR(60),
    UF             CHAR(2),
    Email          VARCHAR(100),
    DataNascimento DATE
);

CREATE TABLE Produtos (
    Codigo     INT AUTO_INCREMENT PRIMARY KEY,
    Descricao  VARCHAR(150) NOT NULL,
    ValorVenda DECIMAL(9,2) NOT NULL,
    Ativo      TINYINT(1) NOT NULL DEFAULT 1
);

CREATE TABLE Vendas (
    Codigo     INT AUTO_INCREMENT PRIMARY KEY,
    Cliente    INT NOT NULL,
    Produto    INT NOT NULL,
    DataVenda  DATE,
    Quantidade INT,
    ValorVenda DECIMAL(18,2),   -- valor UNITÁRIO efetivamente praticado
    CONSTRAINT fkVendasClientes FOREIGN KEY (Cliente) REFERENCES Clientes (Codigo),
    CONSTRAINT fkVendasProdutos FOREIGN KEY (Produto) REFERENCES Produtos (Codigo)
);

INSERT INTO Clientes (Nome, Cidade, UF, Email, DataNascimento) VALUES
('João da Silva',       'São José dos Campos', 'SP', 'joao@uol.com',          '1987-10-22'),
('Ivete Sangalo',       'Salvador',            'BA', 'ivete@hotmail.com',     '1980-10-22'),
('Mario Alberto',       'São José dos Campos', 'SP', 'mario@gmail.com',       '1981-11-13'),
('Paulo Cunha',         'São José dos Campos', 'SP', 'paulo@hotmail.com',     '1980-01-01'),
('Maria das Dores',     'Taubaté',             'SP', 'maria@gmail.com',       '1977-01-02'),
('Paula Dutra',         'Caçapava',            'SP', 'paula@uol.com',         '1986-08-07'),
('Cristina dos Santos', 'Belo Horizonte',      'MG', 'cristina@uai.com.br',   '1988-08-22'),
('Júlia Monteiro',      'Jacareí',             'SP', 'julia@gmail.com',       '1985-03-13'),
('André Marques',       'Rio de Janeiro',      'RJ', 'andre@g1.com',          '1979-11-15'),
('Camila Capello',      'São Paulo',           'SP', 'CAPELLO@hotmail.com',   '1990-07-22'),
('Saulo Medeiros',      'Manaus',              'AM', NULL,                    '1995-03-12'),
('Karina Bach',         'Rio de Janeiro',      'RJ', 'karina@gmail.com',      '2000-07-24');

INSERT INTO Produtos (Descricao, ValorVenda, Ativo) VALUES
('3DS MAX 2020 - MODELAGEM, RENDER, EFEITOS',                 161.95, 1),
('MICROCONTROLADOR ARDUINO',                                  181.50, 1),
('ACIONAMENTOS ELÉTRICOS',                                     94.00, 1),
('ADMINISTRAÇÃO DE DEPARTAMENTO PESSOAL',                      85.00, 1),
('ADMINISTRAÇÃO DE SISTEMAS DE INFORMAÇÃO',                   107.00, 1),
('ADOBE FLASH PROFESSIONAL CS5 CRIANDO E ANIMANDO',            83.00, 0),
('ADOBE ILLUSTRATOR CS6 - DESCOBRINDO E CONQUISTANDO',        131.00, 1),
('ADOBE PHOTOSHOP CS5 - IMAGENS PROFISSIONAIS',                96.50, 1),
('PROGRAMAÇÃO EM PYTHON PARA INICIANTES',                     120.00, 1),
('PHP COM HTML5 E CSS3',                                      152.00, 1),
('VIRTUALIZAÇÃO DO SISTEMA OPERACIONAL LINUX',                 97.50, 1);

INSERT INTO Vendas (Cliente, Produto, DataVenda, Quantidade, ValorVenda) VALUES
(1,  2,  '2024-04-22', 2, 170.00),
(1,  9,  '2025-03-12', 1, 120.00),
(2,  6,  '2023-12-21', 1,  75.00),
(2,  5,  '2024-11-10', 2, 100.00),
(2,  2,  '2025-02-14', 1, 181.50),
(3,  7,  '2025-06-10', 1, 120.00),
(3,  10, '2025-06-10', 3, 140.00),
(4,  4,  '2024-12-21', 1,  85.00),
(4,  5,  '2025-07-01', 1, 107.00),
(5,  3,  '2025-08-15', 1,  94.00),
(5,  9,  '2025-09-02', 7, 110.00),
(6,  1,  '2026-01-23', 1, 150.00),
(6,  8,  '2026-02-05', 2,  90.00),
(7,  10, '2026-03-18', 1, 152.00),
(8,  9,  '2026-04-02', 2, 120.00),
(9,  2,  '2026-05-20', 1, 160.00),
(9,  7,  '2026-05-20', 1, 131.00),
(10, 1,  '2026-06-11', 1, 161.95),
(10, 9,  '2026-07-09', 1,  99.00),
(10, 10, '2026-08-30', 2, 152.00),
(1,  10, '2026-09-14', 1, 145.00),
(3,  2,  '2026-10-05', 1, 181.50);
