Curso SQL Completo

### Conceitos importantes:

- SGBD: Sistema Gerenciador de Banco de Dados;
- SQL: Linguagem Estruturada de Consulta;
- DDL (Data Definition Language): Linguagem de Definição de Dados (CREATE, ALTER, DROP);
– DML (Data Manipulation Language): Linguagem de Manipulação de Dados (INSERT, UPDATE, DELETE);
– DQL (Data Query Language): Linguagem de Consulta de Dados (SELECT);
– DCL (Data Control Language): Linguagem de Controle de Dados (GRANT, REVOKE)
– DTL (Data Transaction Language): Linguagem de Transação de Dados (START TRANSACTION, COMMIT, ROLLBACK);
- Chave Primária (Primary Key, PK): Coluna com valores únicos;
- Chave Estrangeira (Foreign Key, FK): Coluna que armazena a chave primária de outra tabela;
- Unsigned: o tipo de dado não armazena valores negativos;
- Not null (NN): o campo não pode ficar vazio;
- Default: define um valor padrão para inicialização;
- Auto-increment (AI): o campo é preenchido automaticamente;

### Bancos de dados mais utilizados:

- MySQL
- PostgreSQL
- Oracle
- SQL Server
- Firebird

### Meu Primeiro comando MySQL:

```
CREATE DATABASE curso_sql;
```

### Comando para selecionar o banco criado:

```
USE curso_sql;
```

### Criando uma tabela:

```
CREATE table funcionarios
(
    id int unsigned not null auto_increment,
    nome varchar(45) not null,
    salario double not null default '0',
    departamento varchar(45),
    PRIMARY KEY (id)
);
```

### Criando outra tabela com chave estrangeira:

```
CREATE table veiculos
(
    id int unsigned not null auto_increment,
    funcionario_id int unsigned default null,
    veiculo varchar(45) not null default '',
    placa varchar(10) not null default '',
    PRIMARY KEY (id),
    CONSTRAINT fk_veiculos_funcionarios FOREIGN KEY (funcionario_id) REFERENCES funcionarios (id)
);
```

### Alterando nome e tipo de campo em uma tabela:

```
ALTER table funcionarios CHANGE COLUMN nome nome_func varchar(50) not null;
```

### Comando para excluir uma tabela:

```
DROP table salarios;
```

### Comando para criar um índice em uma tabela:

```
CREATE INDEX nomes ON funcionarios (nome(6));
```

### Salvando/Abrindo os comandos utilizados em um script:

- File -> Save Script As...
- File -> Open SQL Script...


### Comando para inserir dados:

```
INSERT INTO funcionarios (nome, salario, departamento) VALUES ('Fernando', 1400, 'TI');
```

### Comando para pesquisar dados:

```
SELECT * FROM funcionarios;
```

### Comando para atualizar UM dado:

```
UPDATE funcionarios SET salario = salario * 1.1 WHERE nome = 'Fernando';
```

### Comando para atualizar TODOS os dados:

```
SET SQL_SAFE_UPDATES = 0; ( = 1; para ativar a atualização segura)
UPDATE funcionarios SET salario = salario * 1.1;
```

### Configurando as casas decimais dos dados (ROUND):

```
UPDATE funcionarios SET salario = ROUND(salario * 1.1, 2);
```

### Comando para excluir "dados":

```
DELETE FROM funcionarios WHERE id = 4;
```

### Filtros de Seleção (WHERE):

```
=, !=, >, >=, <, <=, IS NULL, IS NOT NULL, BETWEEN (entre intervalo), LIKE (valor parcial), AND, OR, NOT.
```

```
SELECT * FROM funcionarios WHERE salario > 2000;
```

### Comando para dar um apelido para um campo da tabela:

```
SELECT * FROM funcionarios apelido WHERE salario > 2200;
```
```
SELECT * FROM funcionarios apelido WHERE apelido.salario > 2200;
```

### Filtrando resultados em uma pesquisa:

```
SELECT nome, salario FROM funcionarios WHERE salario > 2200;
```

### Alterando cabeçalho de uma coluna durante seleção:

```
SELECT nome AS 'funcionario', salario FROM funcionarios WHERE salario > 2200;
```

### Comando para unir seleções em uma tabela: (UNION ALL: não elemina elementos duplicados da seleção)

```
SELECT * FROM funcionarios WHERE nome = "Guilherme"
UNION
SELECT * FROM funcionarios WHERE id = 5;
```

### Relacionamento entre tabelas


(INNER JOIN) - Join padrão.

```
SELECT * FROM funcionarios f INNER JOIN veiculos v ON v.funcionario_id = f.id;
```

(EQUI JOIN) - Chaves de mesmo nome entre tabelas.

```
SELECT * FROM T1 JOIN T2 USING Chave; [Elimina os campos em comum]
```

(NON EQUI JOIN) - Relacionamento sem um campo em comum.

```
SELECT * FROM funcionarios INNER JOIN cpfs USING(id);
```

(OUTER JOIN, LEFT JOIN, LEFT OUTER JOIN) - Linhas que não satisfazem a condição de união. [lado esquerdo como base]

```
SELECT * FROM funcionarios f LEFT JOIN veiculos v ON v.funcionario_id = f.id; 
```

(RIGHT JOIN, RIGHT OUTER JOIN) - Linhas que não satisfazem a condição de união. [lado direito como base]

```
SELECT * FROM funcionarios f RIGHT JOIN veiculos v ON v.funcionario_id = f.id;
```

(FULL OUTER JOIN) - Linhas que satisfazem e não satisfazem a condição de união. [Implementação para MySQL]:

```
SELECT * FROM funcionarios f LEFT JOIN veiculos v ON v.funcionario_id = f.id
UNION
SELECT * FROM funcionarios f RIGHT JOIN veiculos v ON v.funcionario_id = f.id;
```

(SELF JOIN) - União da tabela com ela mesma.

```
SELECT a.nome, b.nome FROM clientes a JOIN clientes b ON a.quem_indicou = b.id;
```

### Relacionamento TRIPLO entre tabelas

```
SELECT * FROM funcionarios 
INNER JOIN veiculos ON veiculos.funcionario_id = funcionarios.id
INNER JOIN cpfs ON cpfs.id = funcionarios.id;
```

### Criação de VIEW:

```
CREATE VIEW funcionarios_a AS SELECT * FROM funcionarios WHERE salario >= 1700;
```
```
SELECT * FROM funcionarios_a;
```
```
ALTER VIEW Nome Propriedade;
```
```
DROP VIEW Nome;
```

### Funções de agregação:

- COUNT: contagem de registros de uma consulta;

```
SELECT COUNT(*) FROM funcionarios;
```

- SUM: soma de valores;

```
SELECT SUM(salario) FROM funcionarios;
```

- AVG: média de valores;

```
SELECT AVG(salario) FROM funcionarios;
```

- MAX: valor máximo retornado pela consulta;

```
SELECT MAX(salario) FROM funcionarios;
```

- MIN: valor mínimo retornado pela consulta;

```
SELECT MIN(salario) FROM funcionarios;
```

### Funções de agregação:

- DISTINCT: seleciona valores únicos, sem repetição;

```
SELECT DISTINCT (departamento) FROM funcionários;
```

- ORDER BY(ASC/DESC): ordena o resultado baseado nas colunas informadas;

```
SELECT * FROM funcionarios ORDER BY salario DESC;
```

- LIMIT: limita o número de resultados retornados;

```
SELECT * FROM funcionarios LIMIT 2;
```

- OFFSET: indica quantos registros devem ser avançados na busca;

```
SELECT * FROM funcionarios OFFSET 2;
```

```
SELECT * FROM funcionarios LIMIT 1, 2; (1 = OFFSET, 2 = LIMIT)
```

### Funções de agregação:

- GROUP BY: agrupamento de registros por categoria;

```
SELECT departamento, AVG(salario) FROM funcionarios GROUP BY departamento;
```

- HAVING (possui): filtro de seleção para agrupamento;

```
SELECT departamento, AVG(salario) FROM funcionarios GROUP BY departamento HAVING AVG(salario) > 1500;
```

### Subqueries: consultas com filtro de seleção baseado em uma lista ou outra seleção [IN/NOT IN];

```
SELECT nome FROM funcionarios WHERE departamento IN (SELECT departamento FROM funcionarios GROUP BY departamento HAVING AVG(salario) > 1500);
```

### DCL - Controle de dados: forma de garantir que somente pessoas autorizadas possam realizar ações com os dados

- Níveis de acesso;
- Níveis de ações;

```
Acesso ao servidor > Acesso ao banco > Acesso à tabela > Acesso à coluna > Acesso ao registro > Acesso à operação desejada
```

- CREATE USER Nome: cria usuário

- DROP USER Nome: exclui usuário;

- GRANT ação ON estrutura TO usuário: habilita acessos;

- REVOKE ação ON estrutura TO usuário: revoga acessos;

### Ações controladas:

- ALL, SELECT, INSERT, UPDATE, DELETE;

### Estruturas controladas:

- TABLE, VIEW, SEQUENCE;

### Criando usuário:

```
CREATE USER 'lukas'@'192.999.999.99' IDENTIFIED BY '12345';
```
```
CREATE USER 'lukas'@'localhost' IDENTIFIED BY '12345';
```
```
CREATE USER 'lukas'@'%' IDENTIFIED BY '12345';
```

### Configurando permissões:

```
GRANT ALL ON curso_sql.* TO 'lukas'@'localhost';
```
```
GRANT SELECT ON curso_sql.* TO 'lukas'@'%';
```
```
GRANT INSERT ON curso_sql.funcionarios TO 'lukas'@'%';
```

### Configurando permissões:

```
REVOKE INSERT ON curso_sql.funcionarios FROM 'lukas'@'%';
```

### Excluindo usuário:

```
DROP USER 'lukas'@'localhost';
```

### Executando pesquisa de usuários:

```
SELECT USER FROM mysql.USER;
```

### Executando pesquisa de permissões dos usuários:

```
SHOW GRANTS FOR 'root'@'localhost';
```

### Transações (ACID):

- Atomicidade;
- Consistência;
- Isolamento;
- Durabilidade;

### DTL - Linguagem de Transação de dados:

- START TRANSACTION: inicia a transação;
- COMMIT: concretiza a transação;
- ROLLBACK: anula a transação;

### Mecanismos de armazenamento (Transactions):

```
SHOW ENGINES;
```

```
CREATE TABLE contas_bancarias
(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    titular VARCHAR(45) NOT NULL,
    saldo DOUBLE NOT NULL,
    PRIMARY KEY (id)
) ENGINE = InnoDB;
```

```
START TRANSACTION;
UPDATE contas_bancarias SET saldo = saldo - 100 WHERE id = 1;
UPDATE contas_bancarias SET saldo = saldo + 100 WHERE id = 2;
COMMIT; concretiza a transação
ROLLBACK; anula a transação
```

### Stored Procedures - blocos de código SQL armazenados no banco:

- Centralização;
- Segurança;
- Performance;
- Suporte a transações;


### Criando uma Stored Procedures:

```
DELIMITER $$

CREATE PROCEDURE limpa_pedidos ()
BEGIN
	DELETE FROM pedidos WHERE pago = 'Não';
END$$

DELIMITER ;
```

### Invocando uma Stored Procedures:

```
CALL nome ();
```

```
EXECUTE nome;
```

### Excluindo uma Stored Procedures:

```
DROP PROCEDURE nome;
```

### Triggers (gatilhos) - eventos que disparam códigos SQL:

- As mesmas vantagens das Stored Procedures;
- Execução de código SQL baseado em eventos;

### Tipos de Triggers:

- BEFORE INSERT;
- BEFORE UPDATE;
- BEFORE DELETE;
- AFTER INSERT;
- AFTER UPDATE;
- AFTER DELETE;
- TEMPORAIS

### Criando um Triggers:

```
CREATE TRIGGER gatilho_limpa_pedidos BEFORE INSERT ON estoque
FOR EACH ROW CALL limpa_pedidos;
```

### Excluindo um Trigger:

```
DROP TRIGGER nome;
```
