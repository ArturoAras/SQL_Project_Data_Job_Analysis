/*
    Question: What are the top 5 most demanded skills for Data Analyst positions?
    This query retrieves the top five most demanded skills for Data Analyst positions by counting the occurrences of each skill in job postings.
    The jobs were filtered to include only the Data Analyst positions.
    The results include the skill name in uppercase.

    
*/

SELECT 
    UPPER(skills_dim.skills) AS skill_name,
    COUNT(skills_dim.skill_id) AS demand_count
FROM job_postings_fact
LEFT JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
LEFT JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_postings_fact.job_title = 'Data Analyst'
GROUP BY 
    skill_name
ORDER BY 
    demand_count DESC
LIMIT 5