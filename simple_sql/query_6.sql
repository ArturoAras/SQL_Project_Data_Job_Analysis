WITH jobs_per_company AS (
    SELECT 
        DISTINCT company_id,
        COUNT(*) AS number_of_jobs
    FROM job_postings_fact
    GROUP BY company_id
    ORDER BY company_id )

SELECT 
    company_dim.name AS name,
    jpc.number_of_jobs AS number_of_jobs
FROM company_dim

INNER JOIN jobs_per_company jpc ON jpc.company_id = company_dim.company_id
ORDER BY number_of_jobs DESC;