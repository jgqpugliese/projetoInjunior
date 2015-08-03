
CREATE DATABASE hotel;

USE hotel;

CREATE TABLE usuario(
	id_usuario INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL ,
    senha VARCHAR (30) NOT NULL,
    email VARCHAR(40) NOT NULL UNIQUE KEY,
    cpf CHAR (11) NOT NULL UNIQUE KEY,
    tipo INT(1) NOT NULL,
    cep CHAR(8) NOT NULL
);


CREATE TABLE mes(
	id_mes INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nome_mes VARCHAR(30) NOT NULL
);

INSERT INTO mes VALUE(NULL,"JANEIRO");

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
insert INTO tipo_quarto VALUES (NULL,"Hipoalergenico");

CREATE TABLE quarto (
	id_quarto INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    id_tipo INT NOT NULL ,
    stado INT(1) NOT NULL,
    FOREIGN KEY (id_tipo)
		REFERENCES tipo_quarto(id_tipo)
);
insert into quarto VAlue (NULL, 1,0);

CREATE TABLE reserva(
	id_reserva INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    id_usuario INT NOT NULL ,
    id_quarto INT NOT NULL,
    data_entrada DATE NOT NULL,
    data_saida DATE NOT NULL,
    FOREIGN KEY (id_quarto)
		REFERENCES quarto(id_quarto),
	FOREIGN KEY (id_usuario)
		REFERENCES usuario(id_usuario)
);
INSERT INTO usuario VALUE
(NULL,"JOAO","123456","jgqpugliese@hotmail.com","12121212131",0,"24220071"),
(null ,"Daniel ", "125531","emailqualquer","12121212132",0,"24220072"),
(NULL, "Lorenna","123456","pudim@hotmail.com","12121212133",1,"24220073"); 

insert into ponto VAlues
(null,3,22,24,1,2014,2);

-- inserir na tablea reserva.
insert into reserva VAlUE (null,1,1,"2013-07-15","2013-07-18"),
(null,2,1,"2014-07-15","2014-07-18");

-- select perfeido do cliente. Nunca apagar.select para ver as reservas de um usuario especifico
SELECT reserva.data_entrada ,reserva.data_saida,reserva.id_quarto, tipo_quarto.tipo from usuario ,reserva join quarto join tipo_quarto 
	where reserva.id_usuario = usuario.id_usuario --  mudar essa linha.
    and reserva.id_quarto =  quarto.id_quarto
    and quarto.id_tipo = tipo_quarto.id_tipo ;
    
-- select do funcionario, pra ver todos as reservas 
SELECT reserva.id_usuario ,reserva.data_entrada ,reserva.data_saida,reserva.id_quarto, tipo_quarto.tipo from usuario ,reserva join quarto join tipo_quarto 
	where reserva.id_usuario = usuario.id_usuario
    and reserva.id_quarto =  quarto.id_quarto
    and quarto.id_tipo = tipo_quarto.id_tipo ;

-- select do ponto de um usuario especifico 
select ponto.id_usuario, ponto.hora_entrada , ponto.hora_saida from ponto, usuario 
where ponto.id_usuario =  usuario.id_usuario; -- ususario.id_usuario vem do  login 
    
-- check in 
update quarto 
set quarto.stado = 1
	where quarto.id_quarto = 1 ;-- aqui vem o numero quarto
    
-- check out
update quarto 
set quarto.stado = 0
	where quarto.id_quarto = 1 ;-- aqui vem o numero quarto

 
SELECT quarto.id_quarto, tipo_quarto.tipo , quarto.stado  from quarto, tipo_quarto
	where tipo_quarto.id_tipo = quarto.id_tipo ; 
    -- and stado = 1;
	-- and stado = 0;

