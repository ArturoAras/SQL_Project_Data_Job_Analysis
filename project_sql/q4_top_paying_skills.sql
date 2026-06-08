/*
    Question: What are the top paying skills for Data Analysts?
    - Look at the average salary asociated with each skill for Data Analyst job postings.
    - Focus on roles with specified salaries.
    - This reveals how specific skills impact on salary levels for Data Analysts and helps to
        identify the most financially rewarding skills in the field to acquire.
*/

SELECT 
    DISTINCT UPPER(sd.skills),
    TRUNC(AVG(JPF.salary_year_avg), 2) AS avg_salary_per_skill
FROM skills_dim sd
LEFT JOIN skills_job_dim sjd ON sjd.skill_id = sd.skill_id
LEFT JOIN job_postings_fact jpf ON jpf.job_id = sjd.job_id

WHERE jpf.job_title_short = 'Data Analyst'
    AND jpf.salary_year_avg IS NOT NULL
   -- AND jpf.job_location = 'Anywhere' --You can switch to remote jobs to focus on it
GROUP BY
    sd.skills, sd.skill_id
ORDER BY
    avg_salary_per_skill DESC


