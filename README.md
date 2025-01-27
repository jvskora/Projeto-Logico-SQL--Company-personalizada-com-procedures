# Banco de Dados 'Company'

Este repositório contém o esquema de banco de dados para a empresa 'Company'. Ele foi projetado para gerenciar informações relacionadas a departamentos, funcionários, projetos, cargos e avaliações de desempenho, incluindo índices para otimizar consultas.

## Estrutura do Banco de Dados

### 1. **department**
Tabela que armazena informações sobre os departamentos da empresa.

- **Campos:**
  - `Dname`: Nome do departamento (VARCHAR(15), único, não nulo)
  - `Dnumber`: Número do departamento (INT, chave primária)
  - `Mgr_ssn`: SSN do gerente (CHAR(9))
  - `Mgr_start_date`: Data de início do gerente (DATE)
  - `Budget`: Orçamento do departamento (DECIMAL(15, 2))

- **Índices:**
  - `idx_department_budget` (para otimizar consultas relacionadas ao orçamento)

---

### 2. **employee**
Tabela que armazena informações sobre os funcionários da empresa.

- **Campos:**
  - `Fname`: Nome do funcionário (VARCHAR(15), não nulo)
  - `Minit`: Inicial do meio (CHAR(1))
  - `Lname`: Sobrenome do funcionário (VARCHAR(15), não nulo)
  - `Ssn`: SSN do funcionário (CHAR(9), chave primária)
  - `Bdate`: Data de nascimento (DATE)
  - `Address`: Endereço do funcionário (VARCHAR(100))
  - `Sex`: Sexo do funcionário (ENUM('M', 'F'), não nulo)
  - `Salary`: Salário do funcionário (DECIMAL(10, 2))
  - `Super_ssn`: SSN do supervisor (CHAR(9))
  - `Dno`: Número do departamento (INT, chave estrangeira)
  - `Email`: E-mail do funcionário (VARCHAR(100), único)
  - `Hire_date`: Data de contratação (DATE)

- **Índices:**
  - `idx_employee_dno` (para consultas por departamento)
  - `idx_employee_salary` (para consultas por salário)
  - `idx_employee_email` (para consultas por e-mail)

---

### 3. **department_locations**
Tabela que armazena as localizações de cada departamento.

- **Campos:**
  - `Dnumber`: Número do departamento (INT, chave estrangeira)
  - `Dlocation`: Localização do departamento (VARCHAR(30), não nulo)

- **Índice:**
  - `idx_department_locations` (para consultas por cidade de localização)

---

### 4. **project**
Tabela que armazena informações sobre os projetos da empresa.

- **Campos:**
  - `Pname`: Nome do projeto (VARCHAR(30), único, não nulo)
  - `Pnumber`: Número do projeto (INT, chave primária)
  - `Plocation`: Localização do projeto (VARCHAR(30))
  - `Dnum`: Número do departamento responsável (INT, chave estrangeira)
  - `Start_date`: Data de início do projeto (DATE)

- **Índices:**
  - `idx_project_dnum` (para consultas por departamento)
  - `idx_project_plocation` (para consultas por localização do projeto)

---

### 5. **works_on**
Tabela que relaciona os funcionários com os projetos em que trabalham.

- **Campos:**
  - `Essn`: SSN do funcionário (CHAR(9), chave estrangeira)
  - `Pno`: Número do projeto (INT, chave estrangeira)
  - `Hours`: Horas trabalhadas no projeto (DECIMAL(3, 1), não nulo)
  - `Role`: Cargo do funcionário no projeto (ENUM('Developer', 'Manager', 'Tester', 'Analyst', 'Other'))

- **Índices:**
  - `idx_works_on_essn` (para consultas por SSN de funcionário)
  - `idx_works_on_pno` (para consultas por número de projeto)

---

### 6. **dependent**
Tabela que armazena informações sobre os dependentes dos funcionários.

- **Campos:**
  - `Essn`: SSN do funcionário (CHAR(9), chave estrangeira)
  - `Dependent_name`: Nome do dependente (VARCHAR(15), não nulo)
  - `Sex`: Sexo do dependente (ENUM('M', 'F'), não nulo)
  - `Bdate`: Data de nascimento do dependente (DATE)
  - `Relationship`: Relação com o funcionário (ENUM('Spouse', 'Child', 'Parent', 'Other'), não nulo)

- **Índice:**
  - `idx_dependent_essn` (para consultas por SSN de funcionário)

---

### 7. **job_titles**
Tabela que armazena informações sobre cargos dentro da empresa.

- **Campos:**
  - `Job_id`: ID do cargo (INT, chave primária, AUTO_INCREMENT)
  - `Title_name`: Nome do cargo (VARCHAR(50), único, não nulo)
  - `Min_salary`: Salário mínimo para o cargo (DECIMAL(10, 2))
  - `Max_salary`: Salário máximo para o cargo (DECIMAL(10, 2))

- **Índices:**
  - `idx_job_titles_min_salary` (para consultas por salário mínimo)
  - `idx_job_titles_max_salary` (para consultas por salário máximo)

---

### 8. **employee_job**
Tabela que relaciona funcionários aos cargos que ocupam.

- **Campos:**
  - `Ssn`: SSN do funcionário (CHAR(9), chave estrangeira)
  - `Job_id`: ID do cargo (INT, chave estrangeira)
  - `Start_date`: Data de início do cargo (DATE)

- **Índice:**
  - `idx_employee_job_ssn` (para consultas por SSN de funcionário)

---

### 9. **performance_reviews**
Tabela que armazena avaliações de desempenho dos funcionários.

- **Campos:**
  - `Review_id`: ID da avaliação (INT, AUTO_INCREMENT, chave primária)
  - `Ssn`: SSN do funcionário (CHAR(9), chave estrangeira)
  - `Review_date`: Data da avaliação (DATE)
  - `Reviewer_ssn`: SSN do revisor (CHAR(9))
  - `Comments`: Comentários sobre a avaliação (TEXT)
  - `Score`: Pontuação da avaliação (INT, entre 1 e 10)

- **Índices:**
  - `idx_performance_reviews_ssn` (para consultas por SSN de funcionário)
  - `idx_performance_reviews_date` (para consultas por data da avaliação)

---

## Ex de Consultas

### 1. **Qual o departamento com maior número de pessoas?**

```sql
SELECT d.Dname, COUNT(e.Ssn) AS EmployeeCount
FROM department d
LEFT JOIN employee e ON d.Dnumber = e.Dno
GROUP BY d.Dname
ORDER BY EmployeeCount DESC
LIMIT 1;
```
### 2. **Quais são os departamentos por cidade?**
```sql
SELECT d.Dname, dl.Dlocation
FROM department d
JOIN department_locations dl ON d.Dnumber = dl.Dnumber
ORDER BY dl.Dlocation;
```
### 3. **Relação de empregados por departamento**
```sql
SELECT d.Dname, e.Fname, e.Lname
FROM department d
JOIN employee e ON d.Dnumber = e.Dno
ORDER BY d.Dname, e.Lname;
```

