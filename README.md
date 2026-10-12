# Explorando Dados com SQL — Análise do Mercado de Trabalho

Projeto de análise de dados utilizando SQL para explorar o mercado de trabalho de Engenharia de Dados, identificando as habilidades mais requisitadas, as tecnologias mais bem pagas e as competências que combinam demanda e remuneração.

## Tecnologias
- SQL
- DuckDB
- Git e GitHub
- VS Code

## Objetivos do projeto

Analisar dados reais de vagas de emprego para responder a três perguntas principais:

- Quais habilidades são mais requisitadas para profissionais de Engenharia de Dados?
- Quais habilidades estão associadas aos maiores salários?
- Quais competências oferecem uma boa combinação entre demanda e remuneração?

## Consultas SQL

- **`01_top_demanded_skills.sql`:** identifica as habilidades mais requisitadas nas vagas de Engenharia de Dados.
- **`02_top_paying_skills.sql`:** analisa as habilidades associadas aos maiores salários médios anuais, utilizando a mediana como métrica de remuneração.
- **`03_optimal_skills.sql`:** combina demanda e remuneração para identificar habilidades interessantes para desenvolver profissionalmente.

## Estrutura do projeto

```text
1_EDA/
├── sql/
│   ├── 01_top_demanded_skills.sql
│   ├── 02_top_paying_skills.sql
│   └── 03_optimal_skills.sql
└── README.md
```

## Conceitos de SQL praticados

- `JOIN` para relacionar diferentes tabelas.
- `GROUP BY` para agrupar os dados.
- `COUNT()`, `MEDIAN()` e `ROUND()` para realizar cálculos e agregações.
- `WHERE` e `HAVING` para filtrar registros e resultados agregados.
- `ORDER BY` e `LIMIT` para classificar e limitar os resultados.
- `IS NOT NULL` para filtrar valores ausentes.
- `LN()` para aplicar o logaritmo natural na construção de uma métrica de demanda.

## Principais aprendizados

O projeto ajudou a praticar consultas analíticas e a transformar dados de vagas de emprego em informações úteis para entender as exigências do mercado.

Entre os pontos explorados estão a importância de SQL e Python, a presença de plataformas de nuvem como AWS e Azure e a relação entre habilidades técnicas, demanda e remuneração.

## Objetivo

Projeto desenvolvido como parte dos meus estudos em Engenharia de Dados, com foco em SQL, análise exploratória de dados e consultas analíticas aplicadas a problemas reais.
