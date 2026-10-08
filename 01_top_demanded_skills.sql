/*
    Quais são as habilidades mais requisitadas para engenheiros de dados?

-Identificar as top 10 habilidades mais requisitadas para engenheiros de dados.
-Foco em vagas remotas

*/

SELECT 
   sd.skillS,
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
ORDER BY
    demand_count DESC
LIMIT 10;



/*
    ==========================================================
    PROJETO: Análise do Mercado de Trabalho para Engenharia de Dados
    Query 01: As 10 habilidades mais requisitadas para vagas remotas
    ============================================================
    
    O que este código faz:
    1. Junta a tabela principal de vagas (jpf) com a tabela ponte de skills (sjd) 
       e a tabela de nomes das habilidades (sd).
    2. Filtra apenas para o cargo de Engenheiro de Dados ('Data Engineer') 
       e para vagas que permitem trabalho remoto.
    3. Agrupa e conta quantas vezes cada habilidade aparece, ordenando da 
       mais pedida para a menos pedida (Top 10).


┌────────────┬──────────────┐
│   skills   │ demand_count │
│  varchar   │    int64     │
├────────────┼──────────────┤
│ sql        │        29221 │
│ python     │        28776 │
│ aws        │        17823 │
│ azure      │        14143 │
│ spark      │        12799 │
│ airflow    │         9996 │
│ snowflake  │         8639 │
│ databricks │         8183 │
│ java       │         7267 │
│ gcp        │         6446 │
└────────────┴──────────────┘


A princípio o objetivo era listar as 10 habilidades mais requisitadas para engenheiro de dados no Brasil
Mas a base de dados ficou vazia, ficaria assim:

SELECT 
   sd.skillS,
   COUNT(jpf.*) AS demand_count 
FROM job_postings_fact AS jpf 
INNER JOIN skills_job_dim AS sjd     
    ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd 
    ON sjd.skill_id = sd.skill_id
WHERE
    job_title_short = 'Data Engineer'
    AND jpf.job_location = 'Brasil'

GROUP BY
    sd.skills 
ORDER BY
    demand_count DESC
LIMIT 10;

*/