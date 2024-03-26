-- Criar o banco de dados
CREATE DATABASE Empresa;

-- Usar o banco de dados
USE Empresa;

-- Criar tabela "Funcionarios"
CREATE TABLE Funcionarios (
    FuncionarioID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100),
    Cargo VARCHAR(100),
    Salario DECIMAL(10, 2)
);

-- Criar tabela "Registros"
CREATE TABLE Registros (
    RegistroID INT PRIMARY KEY AUTO_INCREMENT,
    FuncionarioID INT,
    DataHora DATETIME,
    Acao VARCHAR(100)
);

-- Criar trigger para registrar as inserções na tabela Funcionarios
DELIMITER $$
CREATE TRIGGER RegistrarInsercaoFuncionario AFTER INSERT ON Funcionarios
FOR EACH ROW
BEGIN
    INSERT INTO Registros (FuncionarioID, DataHora, Acao)
    VALUES (NEW.FuncionarioID, NOW(), 'Inserção de funcionário');
END$$
DELIMITER ;

-- Inserir um funcionário e verificar o registro no histórico
INSERT INTO Funcionarios (Nome, Cargo, Salario)
VALUES ('João', 'Desenvolvedor', 3000);

-- Verificar o registro na tabela Registros
SELECT * FROM Registros;
