USE curso_sql;

SELECT * FROM funcionarios;

SELECT * FROM veiculos;

SELECT * FROM funcionarios f INNER JOIN veiculos v ON v.funcionario_id = f.id;

SELECT * FROM funcionarios f LEFT JOIN veiculos v ON v.funcionario_id = f.id;

SELECT * FROM funcionarios f RIGHT JOIN veiculos v ON v.funcionario_id = f.id;

INSERT INTO veiculos (funcionario_id, veiculo, placa) VALUES (null, "Moto", "SBV-0003");

SELECT * FROM funcionarios f LEFT JOIN veiculos v ON v.funcionario_id = f.id
UNION
SELECT * FROM funcionarios f RIGHT JOIN veiculos v ON v.funcionario_id = f.id;

CREATE TABLE cpf
(
	id INT UNSIGNED NOT NULL,
    cpf VARCHAR(14) NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_cpf FOREIGN KEY (id) REFERENCES funcionarios (id)
);

ALTER TABLE curso_sql.cpf RENAME TO curso_sql.cpfs;

INSERT INTO cpfs (id, cpf) VALUES 
(1, "111.111.111-11"),
(2, "222.222.222-22"),
(3, "333.333.333-33"),
(5, "555.555.555-55");

SELECT * FROM cpfs;

SELECT * FROM funcionarios INNER JOIN cpfs ON funcionarios.id = cpfs.id;
SELECT * FROM funcionarios INNER JOIN cpfs USING(id);

CREATE TABLE clientes 
(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    quem_indicou INT UNSIGNED,
    PRIMARY KEY (id),
    CONSTRAINT fk_quem_indicou FOREIGN KEY (quem_indicou) REFERENCES clientes (id)
);

INSERT INTO clientes (id, nome, quem_indicou) VALUES
(1, "André", NULL),
(2, "Samuel", 1),
(3, "Carlos", 2),
(4, "Rafael", 3);

UPDATE clientes SET quem_indicou = 1 WHERE id = 4; 

SELECT * FROM clientes;

SELECT a.nome, b.nome FROM clientes a JOIN clientes b ON a.quem_indicou = b.id;

SELECT * FROM funcionarios 
INNER JOIN veiculos ON veiculos.funcionario_id = funcionarios.id
INNER JOIN cpfs ON cpfs.id = funcionarios.id;

CREATE VIEW funcionarios_a AS SELECT * FROM funcionarios WHERE salario >= 1700;
UPDATE funcionarios SET SALARIO = 1500 WHERE id = 3;
SELECT * FROM funcionarios_a;


