SELECT 
    DISTINCT job_title_short,
    EXTRACT(YEAR FROM job_posted_date) AS year,
    TRUNC(AVG(salary_year_avg)) AS avg_salary_year_avg,
    TRUNC(AVG(salary_hour_avg)) AS avg_salary_hour_avg

    FROM job_postings_fact


    GROUP BY job_title_short, year
    ORDER BY year;
