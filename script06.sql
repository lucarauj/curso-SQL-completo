SHOW ENGINES;

CREATE TABLE contas_bancarias
(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    titular VARCHAR(45) NOT NULL,
    saldo DOUBLE NOT NULL,
    PRIMARY KEY (id)
) ENGINE = InnoDB;

INSERT INTO contas_bancarias (titular, saldo) VALUES ('Lucas', 1000);
INSERT INTO contas_bancarias (titular, saldo) VALUES ('Maaseias', 850);

SELECT * FROM contas_bancarias;

START TRANSACTION;
UPDATE contas_bancarias SET saldo = saldo - 100 WHERE id = 1;
UPDATE contas_bancarias SET saldo = saldo + 100 WHERE id = 2;
ROLLBACK;

START TRANSACTION;
UPDATE contas_bancarias SET saldo = saldo - 100 WHERE id = 1;
UPDATE contas_bancarias SET saldo = saldo + 100 WHERE id = 2;
COMMIT;