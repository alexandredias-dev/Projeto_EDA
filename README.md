# 🔍 Explorando Dados com SQL: Análise do Mercado de Trabalho

![Projeto 1 overview](../Images/1_1_Project1_EDA.png)

Um projeto de SQL que analisa o mercado de trabalho de Engenharia de Dados utilizando dados reais de vagas de emprego. Ele demonstra a minha capacidade de escrever SQL analítico de qualidade de produção, projetar consultas eficientes e transformar perguntas de negócios em insights orientados a dados.

## 🧾 Resumo Executivo (Para Recrutadores e Gestores)

* **🚀 Escopo do Projeto:** Desenvolvimento de 3 consultas SQL analíticas principais para responder a perguntas críticas sobre o mercado de Engenharia de Dados.
* **🏗️ Arquitetura de Dados:** Utilização de `JOINs` multi-tabelas em um modelo **Star Schema** (tabelas fato e dimensão) para extrair insights limpos e confiáveis.
* **📊 Análise Avançada:** Aplicação de agregações estatísticas, filtros (`HAVING`) e normalização matemática (`LN`) para equilibrar demanda versus remuneração.
* **💡 Principais Entregas:** Inteligência acionável sobre a dominância de ferramentas (SQL/Python), tendências de infraestrutura em nuvem e benchmarks salariais.

### Atalhos Rápidos (Principais Entregas):
* [`01_top_demanded_skills.sql`](./sql/01_top_demanded_skills.sql) – Análise de demanda por meio de junções relacionais multi-tabelas.
* [`02_top_paying_skills.sql`](./sql/02_top_paying_skills.sql) – Benchmarking salarial utilizando agregações por mediana.
* [`03_optimal_skills.sql`](./sql/03_optimal_skills.sql) – Consulta de otimização avançada equilibrando alta demanda e maior remuneração.

---

## 🧩 O Problema & Contexto

Analistas de dados e engenheiros precisam de respostas baseadas em dados para questões estratégicas fundamentais:
* 🎯 **Alta Demanda:** Quais habilidades técnicas são mais buscadas pelos empregadores?
* 💰 **Maiores Salários:** Quais tecnologias comandam os salários mais altos do mercado?
* ⚖️ **Equilíbrio Ideal:** Qual é o conjunto de competências ideal que equilibra alta procura com o máximo retorno financeiro?

Para resolver isso, o projeto consulta um *Data Warehouse* analítico estruturado no modelo dimensional **Star Schema**. A arquitetura da base de dados é composta por:

![Data Warehous](../Images/1_2_Data_Warehouse.png)

* **Tabela Fato (`job_postings_fact`):** Tabela central contendo os detalhes das vagas (títulos dos cargos, localizações, salários, datas, etc.).
* **Tabelas Dimensão:**
  * `company_dim`: Informações das empresas vinculadas às vagas.
  * `skills_dim`: Catálogo de habilidades com nomes e tipos das tecnologias.
* **Tabela Ponte / Associativa (`skills_job_dim`):** Resolve a relação de muitos-para-muitos (*many-to-many*) entre as vagas e as habilidades.

Ao consultar essas tabelas interconectadas, extraí insights valiosos sobre a demanda por competências, padrões salariais e as combinações ideais de habilidades para cargos de Engenharia de Dados.

---

## 🧰 Stack Tecnológica

* 🐤 **Motor de Consulta:** DuckDB para consultas analíticas rápidas no padrão OLAP.
* 🧮 **Linguagem:** SQL (estilo ANSI com funções analíticas avançadas).
* 📊 **Modelo de Dados:** Star Schema (com tabelas fato, dimensão e ponte).
* 🛠️ **Ambiente de Desenvolvimento:** VS Code para edição de SQL + Terminal com CLI do DuckDB.
* 📦 **Controle de Versão:** Git/GitHub para versionamento dos scripts SQL.

---

## 📂 Estrutura do Repositório

```text
1_EDA/
├── 01_top_demanded_skills.sql    # Consulta de análise de demanda
├── 02_top_paying_skills.sql      # Consulta de análise salarial
├── 03_optimal_skills.sql         # Otimização combinada de demanda/salário
└── README.md                     # Você está aqui
```
## 🏗️ Visão Geral da Análise

### Estrutura das Consultas
* **Habilidades Mais Requisitadas (`Top Demanded Skills`):** Identifica as 10 competências com maior volume de vagas para posições remotas de Engenharia de Dados.
* **Habilidades Mais Bem Pagas (`Top Paying Skills`):** Analisa as 25 competências com maiores salários, integrando métricas de remuneração e demanda.
* **Habilidades Ideais (`Optimal Skills`):** Calcula um escore ideal utilizando o logaritmo natural da demanda combinado com a mediana salarial para identificar as tecnologias mais valiosas para se aprender.

### Principais Insights
* 🧠 **Linguagens Core:** SQL e Python aparecem de forma massiva nas vagas de emprego, consolidando-se como as competências mais essenciais.
* ☁️ **Plataformas de Nuvem:** AWS e Azure são pilares fundamentais para papéis modernos de Engenharia de Dados.
* 🧱 **Infraestrutura e Ferramental:** Ferramentas como Kubernetes, Docker e Terraform estão fortemente associadas a faixas salariais *premium*.
* 🔥 **Ecossistema Big Data:** O Apache Spark demonstra forte demanda aliada a uma remuneração altamente competitiva.

---

## 💻 Habilidades em SQL Demonstradas

### Design e Otimização de Consultas
* **Joins Complexos:** Operações multi-tabela `INNER JOIN` cruzando `job_postings_fact`, `skills_job_dim` e `skills_dim`.
* **Agregações Estatísticas:** Uso de `COUNT()`, `MEDIAN()` e `ROUND()` para análises analíticas precisas.
* **Filtragem Avançada:** Lógica booleana com cláusulas `WHERE` e múltiplas condições (`job_title_short`, `job_work_from_home`, `salary_year_avg IS NOT NULL`).
* **Ordenação e Limitação:** `ORDER BY` com `DESC` e `LIMIT` estruturado para análises do tipo Top-N.

### Técnicas de Análise de Dados
* **Agrupamento:** Uso de `GROUP BY` para análise categórica segmentada por habilidade.
* **Funções Matemáticas:** Aplicação de `LN()` (Logaritmo Natural) para suavizar e normalizar métricas de demanda assimétricas.
* **Métricas Calculadas:** Criação de um *optimal score* derivado, combinando a demanda transformada por logaritmo com o salário mediano.
* **Cláusula HAVING:** Filtragem eficiente de resultados agregados (foco em habilidades com mais de 100 ocorrências).
* **Tratamento de Nulos:** Filtragem rigorosa para descartar registros incompletos (`salary_year_avg IS NOT NULL`).



