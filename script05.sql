CREATE USER 'lukas'@'192.999.999.99' IDENTIFIED BY '12345';
CREATE USER 'lukas'@'%' IDENTIFIED BY '12345';

CREATE USER 'lukas'@'localhost' IDENTIFIED BY '12345';
GRANT ALL ON curso_sql.* TO 'lukas'@'localhost';

CREATE USER 'lukas'@'%' IDENTIFIED BY 'senhaviagem';
GRANT SELECT ON curso_sql.* TO 'lukas'@'%';
GRANT INSERT ON curso_sql.funcionarios TO 'lukas'@'%';

REVOKE INSERT ON curso_sql.funcionarios FROM 'lukas'@'%';

REVOKE SELECT ON curso_sql.* FROM 'lukas'@'%';

REVOKE ALL ON curso_sql.* FROM 'lukas'@'localhost';

DROP USER 'lukas'@'localhost';
DROP USER 'lukas'@'%';

SELECT USER FROM mysql.USER;

SHOW GRANTS FOR 'root'@'localhost';