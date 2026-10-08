/*
    Quais são as habilidades mais bem pagas para engenheiros de dados?

    - Identificar as top 10 habilidades com os maiores salários médios para engenheiros de dados.
    - Foco em vagas remotas com salário anual informado.
*/

SELECT 
   sd.skillS,
   ROUND(MEDIAN(jpf.salary_year_avg),0) AS median_salary,
   COUNT(jpf.*) AS demand_count 
FROM job_postings_fact AS jpf 
INNER JOIN skills_job_dim AS sjd     
    ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd 
    ON sjd.skill_id = sd.skill_id
WHERE
    job_title_short = 'Data Engineer'
    AND jpf.job_work_from_home = True

GROUP BY
    sd.skills 
HAVING
    COUNT(jpf.*) > 100
ORDER BY
    median_salary DESC
LIMIT 10;


/*

    ============================================================
    PROJETO: Análise do Mercado de Trabalho para Engenharia de Dados
    Query 02: As 10 habilidades mais requisitadas para vagas remotas
    ============================================================
    
    O que este código faz:
    1. Junta a tabela principal de vagas (jpf) com a tabela ponte de skills (sjd) 
       e a tabela de nomes das habilidades (sd).
    2. Filtra apenas para o cargo de Engenheiro de Dados ('Data Engineer') 
       e para vagas que permitem trabalho remoto.
    3. Agrupa e conta quantas vezes cada habilidade aparece, ordenando da 
       mais pedida para a menos pedida (Top 10).

┌───────────┬───────────────┬──────────────┐
│  skills   │ median_salary │ demand_count │
│  varchar  │    double     │    int64     │
├───────────┼───────────────┼──────────────┤
│ rust      │      210000.0 │          232 │
│ golang    │      184000.0 │          912 │
│ terraform │      184000.0 │         3248 │
│ spring    │      175500.0 │          364 │
│ neo4j     │      170000.0 │          277 │
│ gdpr      │      169616.0 │          582 │
│ zoom      │      168438.0 │          127 │
│ graphql   │      167500.0 │          445 │
│ mongo     │      162250.0 │          265 │
│ fastapi   │      157500.0 │          204 │
└───────────┴───────────────┴──────────────┘

*/