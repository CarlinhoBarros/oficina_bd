CREATE DATABASE IF NOT EXISTS oficina;

USE oficina;

-- tabela mecanico
CREATE TABLE Mecanico(
	Id_mecanico INT NOT NULL AUTO_INCREMENT,
    Nome VARCHAR(45) NOT NULL,
    Salario FLOAT NOT NULL,
    Contato CHAR(11) NOT NULL,
    CPF CHAR(11) NOT NULL,
    CONSTRAINT chk_salario
		CHECK (Salario > 1500.0),
    CONSTRAINT pk_mecanico
		PRIMARY KEY (Id_mecanico),
    CONSTRAINT unique_CPF
		UNIQUE (CPF)
) AUTO_INCREMENT = 1;

-- tabela cliente
CREATE TABLE Cliente(
	Id_cliente INT NOT NULL AUTO_INCREMENT,
    Nome VARCHAR(45) NOT NULL,
    Contato CHAR(11) NOT NULL,
    CPF CHAR(11) NOT NULL,
    CONSTRAINT pk_cliente
		PRIMARY KEY (Id_cliente),
    CONSTRAINT unique_CPF
		UNIQUE (CPF)
) AUTO_INCREMENT = 1;

-- tabela veiculo
CREATE TABLE Veiculo(
	Id_veiculo INT NOT NULL AUTO_INCREMENT,
    Id_cliente INT NOT NULL,
    Placa CHAR(7) NOT NULL,
    CONSTRAINT pk_veiculo
		PRIMARY KEY (Id_veiculo),
    CONSTRAINT unique_placa
		UNIQUE (Placa),
    CONSTRAINT fk_cliente 
		FOREIGN KEY (Id_cliente)
		REFERENCES Cliente (Id_cliente)
) AUTO_INCREMENT = 1;

CREATE TABLE Atendimento(
	Id_atendimento INT NOT NULL AUTO_INCREMENT,
	Id_mecanico INT NOT NULL,
    Id_veiculo INT NOT NULL,
    Diagnostico VARCHAR(255) NOT NULL,
    Valor FLOAT NOT NULL,
    Data DATE NOT NULL,
    CONSTRAINT pk_atendimento PRIMARY KEY (Id_atendimento),
    CONSTRAINT fk_mecanico FOREIGN KEY (Id_mecanico) REFERENCES Mecanico (Id_mecanico),
    CONSTRAINT fk_veiculo FOREIGN KEY (Id_veiculo) REFERENCES Veiculo (Id_veiculo)
) AUTO_INCREMENT = 1;

show tables;