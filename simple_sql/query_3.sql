--Los cinco skills más demandados en 2023
SELECT 
    DISTINCT skills_job_dim.skill_id,
    skills_dim.skills AS skill_name, 
    COUNT(skills_job_dim.skill_id) AS skill_count 
FROM skills_job_dim

LEFT JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
GROUP BY skills_job_dim.skill_id, skill_name
ORDER BY skill_count DESC
LIMIT 5