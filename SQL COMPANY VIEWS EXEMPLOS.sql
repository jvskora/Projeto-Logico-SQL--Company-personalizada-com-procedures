-- Número de empregados por departamento e localidade
CREATE VIEW num_employees_by_department_location AS
SELECT d.Dname, dl.Dlocation, COUNT(e.Ssn) AS num_employees
FROM department d
JOIN department_locations dl ON d.Dnumber = dl.Dnumber
LEFT JOIN employee e ON d.Dnumber = e.Dno
GROUP BY d.Dname, dl.Dlocation;

-- Lista de departamentos e seus gerentes
CREATE VIEW department_managers AS
SELECT d.Dname, d.Mgr_ssn, e.Fname AS Manager_First_Name, e.Lname AS Manager_Last_Name
FROM department d
JOIN employee e ON d.Mgr_ssn = e.Ssn;

-- Projetos com maior número de empregados (ordenados de forma decrescente)
CREATE VIEW projects_with_most_employees AS
SELECT p.Pname, COUNT(w.Essn) AS num_employees
FROM project p
JOIN works_on w ON p.Pnumber = w.Pno
GROUP BY p.Pname
ORDER BY num_employees DESC;

-- Lista de projetos, departamentos e gerentes
CREATE VIEW project_department_managers AS
SELECT p.Pname, d.Dname AS Department_Name, e.Fname AS Manager_First_Name, e.Lname AS Manager_Last_Name
FROM project p
JOIN department d ON p.Dnum = d.Dnumber
JOIN employee e ON d.Mgr_ssn = e.Ssn;

-- Empregados com dependentes e se são gerentes
CREATE VIEW employees_with_dependents_and_managers AS
SELECT e.Fname, e.Lname, e.Ssn, e.Sex, dep.Dependent_name, dep.Relationship, 
       CASE WHEN e.Ssn IN (SELECT Mgr_ssn FROM department) THEN 'Yes' ELSE 'No' END AS Is_Manager
FROM employee e
LEFT JOIN dependent dep ON e.Ssn = dep.Essn
ORDER BY e.Lname, e.Fname;

-- Definindo Permissões de Acesso:
-- Criação do usuário 'gerente'
CREATE USER 'gerente'@'localhost' IDENTIFIED BY 'senha_segura';

-- Conceder permissões ao gerente
GRANT SELECT ON company.num_employees_by_department_location TO 'gerente'@'localhost';
GRANT SELECT ON company.department_managers TO 'gerente'@'localhost';
GRANT SELECT ON company.projects_with_most_employees TO 'gerente'@'localhost';
GRANT SELECT ON company.project_department_managers TO 'gerente'@'localhost';

-- Negar acesso a informações de empregados sem permissão para acessar departamentos e gerentes
GRANT SELECT ON company.employees_with_dependents_and_managers TO 'gerente'@'localhost' WITH GRANT OPTION;

-- Aplica as permissões
FLUSH PRIVILEGES;

-- Restrição de Permissões para o Gerente (sem acesso direto aos detalhes dos departamentos e gerentes):
-- Negar permissão para acessar a tabela 'employee' diretamente
REVOKE ALL PRIVILEGES ON company.employee FROM 'gerente'@'localhost';

--  Outros Usuários e Permissões:
-- Criação de usuário 'analista'
CREATE USER 'analista'@'localhost' IDENTIFIED BY 'senha_analista';

-- Conceder permissões ao analista (acesso limitado)
GRANT SELECT ON company.num_employees_by_department_location TO 'analista'@'localhost';
GRANT SELECT ON company.projects_with_most_employees TO 'analista'@'localhost';

-- Aplica as permissões
FLUSH PRIVILEGES;
