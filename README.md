# Banco de Dados - `company`

Este repositório contém a implementação de um banco de dados relacional para gerenciar informações de uma empresa, incluindo departamentos, empregados, projetos, dependentes, cargos e avaliações de desempenho. O banco de dados possui **views** otimizadas para consultas e **permissões de acesso** baseadas em tipos de usuário.

## Estrutura Principal

- **Department**: Informações dos departamentos.
- **Employee**: Dados dos empregados.
- **Project**: Detalhes dos projetos.
- **Works_on**: Relação entre empregados e projetos.
- **Dependent**: Dependentes dos empregados.
- **Job_titles**: Cargos e salários.
- **Employee_job**: Empregados e seus cargos.
- **Performance_reviews**: Avaliações de desempenho.

## Views Criadas

1. **Número de empregados por departamento e localidade**.
2. **Lista de departamentos e seus gerentes**.
3. **Projetos com maior número de empregados**.
4. **Lista de projetos, departamentos e gerentes**.
5. **Empregados com dependentes e se são gerentes**.

## Permissões de Acesso

- **Gerente**: Acesso a empregados e departamentos.
- **Analista**: Acesso a algumas views relacionadas a empregados e projetos.

## Como Executar

1. Execute o script `tabelas.sql` para criar as tabelas.
2. Execute `populacoes.sql` para inserir dados.
3. Execute `views.sql` para criar as views.
4. Use `usuarios.sql` para definir permissões de usuários.

## Contribuições

Sinta-se à vontade para fazer melhorias ou sugestões via pull request.

## Licença

Este projeto pode ser usado, modificado e distribuído livremente.
