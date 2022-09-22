CREATE DATABASE oficina;
USE oficina;

CREATE TABLE cliente (
	idCliente INT auto_increment PRIMARY KEY,
    Nome VARCHAR(45) NOT NULL,
    CPF CHAR(11),
    CNPJ CHAR(15),
    constraint unique_cliente_cpf UNIQUE(CPF),
    constraint unique_cliente_CNPJ UNIQUE(CNPJ)
);

-- Equipe
CREATE TABLE equipe(
	idEquipe INT auto_increment PRIMARY KEY,
	Descricao VARCHAR(45) NOT NULL
);

-- Veículo
CREATE TABLE veiculo(
	idVeiculo INT auto_increment PRIMARY KEY,
	idCliente INT NOT NULL,
    marca VARCHAR(45) NOT NULL,
    modelo VARCHAR(45) NOT NULL,
    ano int NOT NULL,
    idEquipe INT NOT NULL,
    CONSTRAINT fk_veiculo_cliente FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),
    CONSTRAINT fk_veiculo_equipe FOREIGN KEY (idEquipe) REFERENCES Equipe(idEquipe)
);


--  Servico
CREATE TABLE servico(
	idServico INT auto_increment PRIMARY KEY,
	descricao VARCHAR(45) NOT NULL,
    valor FLOAT NOT NULL,
	prazoFinal time
);

-- Peca
CREATE TABLE peca(
	idPeca INT auto_increment PRIMARY KEY,
	descricao VARCHAR(45) NOT NULL,
    valor FLOAT not null
);

CREATE TABLE Os(
	idOS INT auto_increment PRIMARY KEY,
    dataEmissao DATETIME DEFAULT CURRENT_TIMESTAMP,
    valor FLOAT,
    status VARCHAR(45),
    dataConclusao DATETIME,
    Autorizacao VARCHAR(45),
    idVeiculo INT NOT NULL,
    idEquipe INT NOT NULL,
    CONSTRAINT fk_os_veiculo FOREIGN KEY (idVeiculo) REFERENCES veiculo(idVeiculo)
);

CREATE TABLE servicoPeca(
	idOs INT NOT NULL,
    idPeca INT NOT NULL,
    quantidade FLOAT NOT NULL,
    CONSTRAINT fk_servicopeca_os FOREIGN KEY (idOs) REFERENCES Os(idOs),
    CONSTRAINT fk_servicopeca_peca FOREIGN KEY (idPeca) REFERENCES peca(idPeca)
);

CREATE TABLE OsServico(
	idOs INT NOT NULL,
    idServico INT NOT NULL,
    quantidade FLOAT NOT NULL,
    CONSTRAINT fk_osservico_os FOREIGN KEY (idOs) REFERENCES Os(idOs),
    CONSTRAINT fk_osservico_servico FOREIGN KEY (idServico) REFERENCES servico(idServico)
);