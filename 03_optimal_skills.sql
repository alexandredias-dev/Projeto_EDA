/*
    Quais são as habilidades mais ideais (optimal skills) para engenheiros de dados?

    - Identificar habilidades que são ao mesmo tempo muito requisitadas (alta demanda) 
      e possuem altos salários médios.
    - Foco em vagas remotas, combinando volume de mercado e retorno financeiro 
      para guiar planos de estudo eficientes.
*/

SELECT 
   sd.skillS,
   ROUND(MEDIAN(jpf.salary_year_avg),0) AS median_salary,
   ROUND(LN(COUNT(jpf.*)),1) AS ln_demand_count,
   ROUND((MEDIAN(jpf.salary_year_avg) * LN(COUNT(jpf.*)))/1_000_000,2) AS optimal_score
FROM job_postings_fact AS jpf 
INNER JOIN skills_job_dim AS sjd     
    ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd 
    ON sjd.skill_id = sd.skill_id
WHERE
    job_title_short = 'Data Engineer'
    AND jpf.job_work_from_home = True
    AND jpf.salary_year_avg IS NOT NULL
GROUP BY
    sd.skills 
HAVING
    COUNT(jpf.*) > 100
ORDER BY
    optimal_score DESC
LIMIT 20;


/*

    ============================================================
    PROJETO: Análise do Mercado de Trabalho para Engenharia de Dados
    Query 03: As habilidades mais ideais (Optimal Skills - Demanda + Salário)
    ============================================================
    
    O que este código faz:
    1. Junta a tabela principal de vagas (jpf) com a tabela ponte de skills (sjd) 
       e a tabela de nomes das habilidades (sd).
    2. Filtra apenas para o cargo de Engenheiro de Dados ('Data Engineer'), 
       vagas remotas e que possuem salário anual informado.
    3. Agrupa por habilidade e restringe apenas àquelas com mais de 100 ocorrências (HAVING).
    4. Calcula a mediana salarial e aplica o logaritmo natural (LN) na contagem de vagas 
       para suavizar a escala gigante da demanda.
    5. Cria um `optimal_score` multiplicando a mediana pelo LN da demanda, gerando 
       um ranking equilibrado entre o que paga melhor e o que o mercado mais pede.

┌────────────┬───────────────┬─────────────────┬───────────────┐
│   skills   │ median_salary │ ln_demand_count │ optimal_score │
│  varchar   │    double     │     double      │    double     │
├────────────┼───────────────┼─────────────────┼───────────────┤
│ terraform  │      184000.0 │             5.3 │          0.97 │
│ python     │      135000.0 │             7.0 │          0.95 │
│ aws        │      137320.0 │             6.7 │          0.91 │
│ sql        │      130000.0 │             7.0 │          0.91 │
│ airflow    │      150000.0 │             6.0 │          0.89 │
│ spark      │      140000.0 │             6.2 │          0.87 │
│ snowflake  │      135500.0 │             6.1 │          0.82 │
│ kafka      │      145000.0 │             5.7 │          0.82 │
│ azure      │      128000.0 │             6.2 │          0.79 │
│ java       │      135000.0 │             5.7 │          0.77 │
│ scala      │      137290.0 │             5.5 │          0.76 │
│ git        │      140000.0 │             5.3 │          0.75 │
│ kubernetes │      150500.0 │             5.0 │          0.75 │
│ databricks │      132750.0 │             5.6 │          0.74 │
│ redshift   │      130000.0 │             5.6 │          0.73 │
│ gcp        │      136000.0 │             5.3 │          0.72 │
│ nosql      │      134415.0 │             5.3 │          0.71 │
│ hadoop     │      135000.0 │             5.3 │          0.71 │
│ pyspark    │      140000.0 │             5.0 │           0.7 │
│ mongodb    │      135750.0 │             4.9 │          0.67 │
└────────────┴───────────────┴─────────────────┴───────────────┘

*/