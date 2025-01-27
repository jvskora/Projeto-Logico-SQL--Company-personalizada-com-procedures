## Banco de Dados 'Company'
O banco de dados 'company' foi projetado para armazenar informações sobre departamentos, funcionários, projetos, dependentes e avaliações de desempenho. Ele inclui várias tabelas com relacionamentos entre elas, com o objetivo de suportar consultas sobre a estrutura da empresa, o desempenho dos funcionários, seus cargos, e a alocação de recursos. Além disso, índices foram criados para otimizar o desempenho das consultas.

## Tabelas e Estrutura
### department:
Armazena informações sobre departamentos, incluindo o nome, número, gerente, e orçamento do departamento.

Índices: idx_department_budget (para o orçamento).
employee:
Contém informações sobre os funcionários, como nome, SSN, data de nascimento, endereço, salário, supervisor, departamento e email.

Índices: idx_employee_dno (para o número do departamento), idx_employee_salary (para o salário), e idx_employee_email (para o email).
department_locations:
Armazena as localizações de cada departamento (por cidade).

Índice: idx_department_locations (para a cidade de localização).
project:
Contém informações sobre os projetos, incluindo nome, número, localização e o departamento responsável.

Índices: idx_project_dnum (para o número do departamento) e idx_project_plocation (para a localização do projeto).
works_on:
Relaciona os funcionários com os projetos em que trabalham, incluindo as horas trabalhadas e o cargo em cada projeto.

Índices: idx_works_on_essn (para o SSN do funcionário) e idx_works_on_pno (para o número do projeto).
dependent:
Armazena informações sobre os dependentes dos funcionários, incluindo nome, sexo, data de nascimento e relação com o funcionário.

Índice: idx_dependent_essn (para o SSN do funcionário).
job_titles:
Armazena informações sobre cargos na empresa, como o nome do cargo, salário mínimo e máximo.

Índices: idx_job_titles_min_salary (para o salário mínimo) e idx_job_titles_max_salary (para o salário máximo).
employee_job:
Relaciona funcionários aos cargos que ocupam, com datas de início.

Índice: idx_employee_job_ssn (para o SSN do funcionário).
performance_reviews:
Armazena avaliações de desempenho dos funcionários, incluindo SSN do revisor, data da avaliação, comentários e pontuação.

Índices: idx_performance_reviews_ssn (para o SSN do funcionário) e idx_performance_reviews_date (para a data da avaliação).

## Contribuições

Sinta-se à vontade para fazer melhorias ou sugestões via pull request.

## Licença

Este projeto pode ser usado, modificado e distribuído livremente.
