USE curso_sql;

CREATE table salarios
(
	faixa varchar(45) not null,
    inicio double not null,
    fim double not null,
    PRIMARY KEY (faixa)
);

INSERT INTO funcionarios (nome, salario, departamento) VALUES ('Fernando', 1400, 'TI');
INSERT INTO funcionarios (nome, salario, departamento) VALUES ('Guilherme', 2500, 'JURÍDICO');
INSERT INTO funcionarios (nome, salario, departamento) VALUES ('Fábio', 1700, 'TI');
INSERT INTO funcionarios (nome, salario, departamento) VALUES ('José', 1800, 'MARKETING');
INSERT INTO funcionarios (nome, salario, departamento) VALUES ('Isabela', 2200, 'JURÍDICO');

SELECT * FROM funcionarios;
SELECT * FROM funcionarios WHERE salario > 2000;
SELECT * FROM funcionarios WHERE nome = 'José';
SELECT * FROM funcionarios WHERE id = 3;

UPDATE funcionarios SET salario = salario * 1.1 WHERE nome = 'Fernando';
SELECT * FROM funcionarios WHERE nome = 'Fernando';

SET SQL_SAFE_UPDATES = 0;
UPDATE funcionarios SET salario = ROUND(salario * 1.1, 2);

DELETE FROM funcionarios WHERE id = 4;

INSERT INTO veiculos (funcionario_id, veiculo, placa) VALUES (1, 'Gol', 'SBV-0056');
INSERT INTO veiculos (funcionario_id, veiculo, placa) VALUES (1, 'Corsa', 'XOQ-2366');

UPDATE veiculos SET funcionario_id = 5 WHERE id = 2;

SELECT * FROM veiculos;

INSERT INTO salarios (faixa, inicio, fim) VALUES ('Analista Jr', 1000, 2000);
INSERT INTO salarios (faixa, inicio, fim) VALUES ('Analista Pleno', 2000, 4000);

SELECT * FROM salarios;

SELECT * FROM funcionarios apelido WHERE apelido.salario > 2200;
SELECT nome, salario FROM funcionarios apelido WHERE salario > 2200;
SELECT nome AS 'funcionario', salario FROM funcionarios WHERE salario > 2200;

SELECT * FROM funcionarios WHERE nome = "Guilherme"
UNION
SELECT * FROM funcionarios WHERE id = 5;