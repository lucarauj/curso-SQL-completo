USE curso_sql;

SELECT * FROM funcionarios;

SELECT COUNT(*) FROM funcionarios;

SELECT SUM(salario) FROM funcionarios;

SELECT AVG(salario) FROM funcionarios;

SELECT MAX(salario) FROM funcionarios;

SELECT MIN(salario) FROM funcionarios;

SELECT DISTINCT(departamento) FROM funcionarios;

SELECT * FROM funcionarios ORDER BY salario DESC;

SELECT * FROM funcionarios LIMIT 2;

SELECT departamento, AVG(salario) FROM funcionarios GROUP BY departamento;

SELECT departamento, AVG(salario) FROM funcionarios GROUP BY departamento HAVING AVG(salario) > 1500;

SELECT nome FROM funcionarios WHERE departamento IN (SELECT departamento FROM funcionarios GROUP BY departamento HAVING AVG(salario) > 1500);
