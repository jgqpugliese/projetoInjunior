

CREATE DATABASE hotel;

USE hotel;

CREATE TABLE usuario(
	id_usuario INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL ,
    senha VARCHAR (30) NOT NULL,
    email VARCHAR(40) NOT NULL UNIQUE KEY,
    tipo INT(1) NOT NULL,
    cep CHAR(8) NOT NULL
);


CREATE TABLE mes(
	id_mes INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nome_mes VARCHAR(30) NOT NULL
);


CREATE TABLE ponto(
	id_ponto INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    id_usuario INT NOT NULL,
    hora_entrada INT NOT NULL,
    hora_saida INT NOT NULL,
    id_mes INT NOT NULL,
    ano INT NOT NULL,
    hora_trabalhada INT NOT NULL,
    FOREIGN KEY (id_usuario)
		REFERENCES usuario(id_usuario),
	FOREIGN KEY (id_mes)
		REFERENCES mes(id_mes),
	UNIQUE KEY (id_usuario , hora_entrada, hora_saida , id_mes ,ano)
);


CREATE TABLE tipo_quarto(
	id_tipo INT AUTO_INCREMENT NOT NULL PRIMARY KEY, 
    tipo VARCHAR(30) NOT NULL UNIQUE KEY 
);


CREATE TABLE quarto (
	id_quarto INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    id_tipo INT NOT NULL ,
    stado INT(1) NOT NULL,
    FOREIGN KEY (id_tipo)
		REFERENCES tipo_quarto(id_tipo)
);


CREATE TABLE reserva(
	id_reserva INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    id_usuario INT NOT NULL ,
    id_quarto INT NOT NULL,
    data_entrada INT NOT NULL,
    data_saida INT NOT NULL,
    FOREIGN KEY (id_quarto)
		REFERENCES quarto(id_quarto),
	FOREIGN KEY (id_usuario)
		REFERENCES usuario(id_usuario)
);