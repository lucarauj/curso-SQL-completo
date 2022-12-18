CREATE TABLE pedidos
(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    descricao VARCHAR(100) NOT NULL,
    valor DOUBLE NOT NULL DEFAULT '0',
    pago VARCHAR(3) NOT NULL DEFAULT 'Não',
    PRIMARY KEY (id)
);

INSERT INTO pedidos (descricao, valor) VALUES
('TV', 3000),
('Geladeira', 1400),
('DVD', 300);

SELECT * FROM pedidos;

DROP PROCEDURE limpa_pedidos;

DELIMITER $$

CREATE PROCEDURE limpa_pedidos ()
BEGIN
	DELETE FROM pedidos WHERE pago = 'Não';
END$$

DELIMITER ;

CALL limpa_pedidos ();

CREATE TABLE estoque
(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    descricao VARCHAR(50) NOT NULL,
    quantidade INT NOT NULL,
    PRIMARY KEY (id)
);

SELECT * FROM estoque;

SELECT * FROM pedidos;

CREATE TRIGGER gatilho_limpa_pedidos BEFORE INSERT ON estoque
FOR EACH ROW CALL limpa_pedidos;

INSERT INTO pedidos (descricao, valor) VALUES
('TV', 3000),
('Geladeira', 1400),
('DVD', 300);

INSERT INTO estoque (descricao, quantidade) VALUES
('Fogão', 5);

INSERT INTO pedidos (descricao, valor) VALUES
('TV', 3000),
('Geladeira', 1400),
('DVD', 300);

UPDATE pedidos SET pago = 'Sim' WHERE id = 8;
