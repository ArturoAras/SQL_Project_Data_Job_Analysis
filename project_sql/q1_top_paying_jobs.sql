/*
 - What are the top-paying Data Analyst jobs in 2023?
 - Identify the top 10 highest-paying Data Analyst roles that are available remotely.
 - Focuses on job postings with specified salaries (remove nulls).
 - Why? Highlight the top-paying opportunities for Data Analysts, offering insights into employment options and salary expectations in the field.
*/

SELECT 
    job_title_short,
    job_title,
    cd.name AS company_name,
    job_location, 
    job_country,
    salary_year_avg,
    job_schedule_type,
    DATE(job_posted_date) AS job_posted_date
    FROM
        job_postings_fact
    LEFT JOIN
        company_dim cd ON cd.company_id = job_postings_fact.company_id
    WHERE 
        salary_year_avg IS NOT NULL
        AND
            job_location = 'Anywhere'
        AND 
            job_title_short = 'Data Analyst'
    ORDER BY 
        salary_year_avg DESC
    LIMIT 10;