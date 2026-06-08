SELECT 
    DISTINCT EXTRACT(MONTH FROM job_posted_date) AS month,
    COUNT(job_id) AS job_count 
    FROM job_postings_fact

    WHERE EXTRACT(YEAR FROM job_posted_date) = 2023
    GROUP BY month;