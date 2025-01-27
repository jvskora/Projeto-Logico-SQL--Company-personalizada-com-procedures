# Projeto Lógico SQL - Company

Bem-vindo ao repositório do **Projeto Lógico SQL - Company**, um modelo de banco de dados relacional projetado para gerenciar informações de uma organização empresarial. Este projeto é um exercício prático que combina modelagem de dados, criação de tabelas, constraints e otimização com índices para consultas específicas.

---

## 🎯 Objetivo do Projeto

Criar e implementar um banco de dados completo para a empresa fictícia **Company**, contemplando:

- Gerenciamento de departamentos, funcionários, cargos e projetos.
- Relacionamento entre funcionários, supervisores e dependentes.
- Controle de avaliações de desempenho e alocação de funcionários em projetos.
- Otimização de consultas SQL com o uso de índices.

---

## 📂 Estrutura do Projeto

### **Scripts SQL**

1. **Criação do Banco de Dados e Tabelas**
   - Estruturas completas com `PRIMARY KEY`, `FOREIGN KEY`, `CHECK`, `UNIQUE` e relacionamentos.

2. **Procedures**
   - Procedimentos armazenados para manipulação dinâmica de dados (inserção, atualização e exclusão).

3. **Consultas SQL**
   - Queries otimizadas para responder às perguntas principais:
     - Qual o departamento com maior número de funcionários?
     - Quais os departamentos por cidade?
     - Relação de empregados por departamento.

4. **Índices**
   - Índices criados para melhorar a performance das consultas mais frequentes e relevantes.

5. **Dados Populados**
   - O banco de dados contém 8 registros em cada tabela para testes e demonstração de funcionalidades.

---

## 🛠️ Tecnologias Utilizadas

- **SGBD**: MySQL 8.0
- **Ferramenta de Desenvolvimento**: MySQL Workbench
- **Linguagem**: SQL

---

## 🗃️ Estrutura do Banco de Dados

### Principais Tabelas:

1. **`department`**: Informações sobre departamentos.
2. **`employee`**: Dados pessoais e profissionais de funcionários.
3. **`project`**: Projetos gerenciados pela empresa.
4. **`works_on`**: Relação entre funcionários e projetos.
5. **`dependent`**: Dependentes dos funcionários.
6. **`job_titles`**: Tabela de cargos disponíveis na empresa.
7. **`performance_reviews`**: Avaliações de desempenho dos funcionários.

---

## 🔍 Consultas e Índices

### Consultas Respondidas:
1. **Qual o departamento com maior número de pessoas?**
   - Índice: `index_department_employee_count` na tabela `employee`.

2. **Quais são os departamentos por cidade?**
   - Índice: `index_department_locations_city` na tabela `department_locations`.

3. **Relação de empregados por departamento.**
   - Índice: `index_employee_department` na tabela `employee`.

**Motivação para os Índices:**
- Acelerar consultas baseadas em filtros e agrupamentos.
- Reduzir o tempo de execução de consultas críticas para o negócio.

---

## 🚀 Como Executar o Projeto

1. Clone este repositório:
   ```bash
   git clone https://github.com/jvskora/Projeto-Logico-SQL--Company-personalizada-com-procedures.git

2. Importe o arquivo SQL principal no MySQL Workbench.

3. Execute os scripts de criação do banco de dados, tabelas e índices.

4. Popule as tabelas com os dados fornecidos.

5. Teste as queries SQL disponíveis no repositório.
