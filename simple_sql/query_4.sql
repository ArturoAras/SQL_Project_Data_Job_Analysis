SELECT
        skills_job_dim.skill_id,
        skills_dim.skills AS skill_name,
        COUNT(job_postings_fact.job_id) AS remote_jobs
    FROM skills_job_dim

    INNER JOIN job_postings_fact ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id

    WHERE job_postings_fact.job_work_from_home = True
    GROUP BY skills_job_dim.skill_id, skill_name
    ORDER BY remote_jobs DESC
    LIMIT 5;