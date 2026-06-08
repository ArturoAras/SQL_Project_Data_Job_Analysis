SELECT 
    table_a.company_id, 
    company_dim.name AS company_name, 
    table_a.job_count,
    CASE
        WHEN table_a.job_count < 10 THEN 'SMALL'
        WHEN table_a.job_count BETWEEN 10 AND 50 THEN 'MEDIUM'
        ELSE 'LARGE'
    END AS company_size
FROM (
    SELECT 
        DISTINCT company_id,
        COUNT(job_id) AS job_count
    FROM job_postings_fact
    GROUP BY company_id
    ORDER BY company_id ASC
) AS table_a
LEFT JOIN company_dim ON company_dim.company_id = table_a.company_id
LIMIT 50;