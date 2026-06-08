/*
    Question: What are the most optimal skills to learn?
    - Optimal skills are those that are both in high demand and offer high salaries.
    - This querie concentrate on remote jobs with specified salaries.
*/

WITH skill_demand AS (
    SELECT 
    skills_dim.skill_id,
    UPPER(skills_dim.skills) AS skill_name,
    COUNT(skills_dim.skill_id) AS demand_count
    FROM job_postings_fact
    LEFT JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    LEFT JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE 
        job_postings_fact.job_title = 'Data Analyst'
        AND job_postings_fact.salary_year_avg IS NOT NULL
        --AND job_postings_fact.job_work_from_home = TRUE
    GROUP BY 
        skill_name,
        skills_dim.skill_id
), top_paying_skills AS (
    SELECT 
    DISTINCT UPPER(skills_dim.skills) AS skill,
    skills_dim.skill_id,
    TRUNC(AVG(JPF.salary_year_avg), 2) AS avg_salary_per_skill
    FROM skills_dim
    LEFT JOIN skills_job_dim sjd ON sjd.skill_id = skills_dim.skill_id
    LEFT JOIN job_postings_fact jpf ON jpf.job_id = sjd.job_id
    WHERE jpf.job_title_short = 'Data Analyst'
        AND jpf.salary_year_avg IS NOT NULL
        --AND jpf.job_location = 'Anywhere' --You can switch to remote jobs to focus on it
    GROUP BY
        skills_dim.skills,
        skills_dim.skill_id
)

SELECT
    skill_demand.skill_name,
    skill_demand.demand_count,
    top_paying_skills.avg_salary_per_skill
FROM skill_demand
INNER JOIN top_paying_skills ON top_paying_skills.skill_id = skill_demand.skill_id
ORDER BY
    demand_count DESC,
    avg_salary_per_skill DESC;



--Optimizing query

SELECT
    sd.skills AS skill_name,
    COUNT(jpf.job_id) AS jobs_per_skill,
    TRUNC(AVG(jpf.salary_year_avg), 2) AS avg_salary
FROM skills_dim sd

INNER JOIN skills_job_dim sjd ON sd.skill_id = sjd.skill_id
INNER JOIN job_postings_fact jpf ON jpf.job_id = sjd.job_id

WHERE
    jpf.salary_year_avg IS NOT NULL
    AND jpf.job_title_short = 'Data Analyst'
    AND jpf.job_work_from_home = TRUE
GROUP BY
    skill_name
HAVING
    COUNT(jpf.job_id) > 20
ORDER BY
    jobs_per_skill DESC
LIMIT 20

