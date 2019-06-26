CREATE DATABASE projeto1;
USE projeto1;

CREATE TABLE clientes(
	id 			INT AUTO_INCREMENT,
    nome 		VARCHAR(100) 	NOT NULL,
    telefone 	VARCHAR(15) 	NOT NULL,
    rg			VARCHAR(12) 	NOT NULL,
    cpf			VARCHAR(14) 	NOT NULL,
    email		VARCHAR(100)	NOT NULL,
    endereco    VARCHAR(100)	NOT NULL,
    cidade		VARCHAR(50)		NOT NULL,
    uf    		VARCHAR(2)		NOT NULL,
    cep			VARCHAR(9)		NOT NULL,
    PRIMARY KEY(id)
);

INSERT INTO clientes (`id`,`nome`,`telefone`,`endereco`,`email`,`cidade`,`uf`,`cep`,`rg`,`cpf`) VALUES
(NULL, 'Jorge Rodrigo', '(11) 94300-1230', 'R. Salvador', 'jorgerodrigo@email.com', 'São Paulo', 'SP', '04440-100', '33.942.000-1', '444.222.111-01');
