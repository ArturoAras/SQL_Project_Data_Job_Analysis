/*
Here is the breakdown of the most demanded skills for data analysts in 2023, based on job postings:
SQL is leading with a bold count of 8.
Python follows closely with 7 mentions.
Tableau is also highly sought after, with a bold count of 6.
Other skills like R, Snowflake, Pandas and Excel are also in demand.
*/


WITH top_ten_paying_jobs AS (
    SELECT 
        job_id,
        job_title,
        cd.name AS company_name,
        salary_year_avg,
        job_schedule_type,
        DATE(job_posted_date) AS job_posted_date
    FROM
        job_postings_fact
    LEFT JOIN company_dim cd ON cd.company_id = job_postings_fact.company_id
    WHERE salary_year_avg IS NOT NULL
        AND
            job_location = 'Anywhere'
        AND 
            job_title_short = 'Data Analyst'
    ORDER BY 
        salary_year_avg DESC
    LIMIT 10
)
SELECT 
    sd.skills AS skill_name,
    ttpj.*
FROM 
    skills_dim sd
INNER JOIN skills_job_dim sjd ON sd.skill_id = sjd.skill_id
INNER JOIN top_ten_paying_jobs ttpj ON ttpj.job_id = sjd.job_id
ORDER BY
    ttpj.salary_year_avg DESC


/*
[
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "salary_year_avg": "255829.5",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-06-18",
    "skill_name": "sql"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "salary_year_avg": "255829.5",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-06-18",
    "skill_name": "python"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "salary_year_avg": "255829.5",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-06-18",
    "skill_name": "r"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "salary_year_avg": "255829.5",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-06-18",
    "skill_name": "azure"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "salary_year_avg": "255829.5",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-06-18",
    "skill_name": "databricks"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "salary_year_avg": "255829.5",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-06-18",
    "skill_name": "aws"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "salary_year_avg": "255829.5",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-06-18",
    "skill_name": "pandas"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "salary_year_avg": "255829.5",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-06-18",
    "skill_name": "pyspark"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "salary_year_avg": "255829.5",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-06-18",
    "skill_name": "jupyter"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "salary_year_avg": "255829.5",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-06-18",
    "skill_name": "excel"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "salary_year_avg": "255829.5",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-06-18",
    "skill_name": "tableau"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "salary_year_avg": "255829.5",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-06-18",
    "skill_name": "power bi"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "salary_year_avg": "255829.5",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-06-18",
    "skill_name": "powerpoint"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "company_name": "Pinterest Job Advertisements",
    "salary_year_avg": "232423.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-12-05",
    "skill_name": "sql"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "company_name": "Pinterest Job Advertisements",
    "salary_year_avg": "232423.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-12-05",
    "skill_name": "python"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "company_name": "Pinterest Job Advertisements",
    "salary_year_avg": "232423.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-12-05",
    "skill_name": "r"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "company_name": "Pinterest Job Advertisements",
    "salary_year_avg": "232423.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-12-05",
    "skill_name": "hadoop"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "company_name": "Pinterest Job Advertisements",
    "salary_year_avg": "232423.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-12-05",
    "skill_name": "tableau"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "company_name": "Uclahealthcareers",
    "salary_year_avg": "217000.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-01-17",
    "skill_name": "sql"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "company_name": "Uclahealthcareers",
    "salary_year_avg": "217000.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-01-17",
    "skill_name": "crystal"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "company_name": "Uclahealthcareers",
    "salary_year_avg": "217000.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-01-17",
    "skill_name": "oracle"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "company_name": "Uclahealthcareers",
    "salary_year_avg": "217000.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-01-17",
    "skill_name": "tableau"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "company_name": "Uclahealthcareers",
    "salary_year_avg": "217000.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-01-17",
    "skill_name": "flow"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "company_name": "SmartAsset",
    "salary_year_avg": "205000.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-08-09",
    "skill_name": "sql"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "company_name": "SmartAsset",
    "salary_year_avg": "205000.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-08-09",
    "skill_name": "python"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "company_name": "SmartAsset",
    "salary_year_avg": "205000.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-08-09",
    "skill_name": "go"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "company_name": "SmartAsset",
    "salary_year_avg": "205000.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-08-09",
    "skill_name": "snowflake"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "company_name": "SmartAsset",
    "salary_year_avg": "205000.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-08-09",
    "skill_name": "pandas"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "company_name": "SmartAsset",
    "salary_year_avg": "205000.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-08-09",
    "skill_name": "numpy"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "company_name": "SmartAsset",
    "salary_year_avg": "205000.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-08-09",
    "skill_name": "excel"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "company_name": "SmartAsset",
    "salary_year_avg": "205000.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-08-09",
    "skill_name": "tableau"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "company_name": "SmartAsset",
    "salary_year_avg": "205000.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-08-09",
    "skill_name": "gitlab"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_name": "Inclusively",
    "salary_year_avg": "189309.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-12-07",
    "skill_name": "sql"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_name": "Inclusively",
    "salary_year_avg": "189309.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-12-07",
    "skill_name": "python"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_name": "Inclusively",
    "salary_year_avg": "189309.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-12-07",
    "skill_name": "azure"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_name": "Inclusively",
    "salary_year_avg": "189309.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-12-07",
    "skill_name": "aws"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_name": "Inclusively",
    "salary_year_avg": "189309.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-12-07",
    "skill_name": "oracle"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_name": "Inclusively",
    "salary_year_avg": "189309.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-12-07",
    "skill_name": "snowflake"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_name": "Inclusively",
    "salary_year_avg": "189309.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-12-07",
    "skill_name": "tableau"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_name": "Inclusively",
    "salary_year_avg": "189309.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-12-07",
    "skill_name": "power bi"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_name": "Inclusively",
    "salary_year_avg": "189309.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-12-07",
    "skill_name": "sap"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_name": "Inclusively",
    "salary_year_avg": "189309.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-12-07",
    "skill_name": "jenkins"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_name": "Inclusively",
    "salary_year_avg": "189309.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-12-07",
    "skill_name": "bitbucket"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_name": "Inclusively",
    "salary_year_avg": "189309.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-12-07",
    "skill_name": "atlassian"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_name": "Inclusively",
    "salary_year_avg": "189309.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-12-07",
    "skill_name": "jira"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "company_name": "Inclusively",
    "salary_year_avg": "189309.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-12-07",
    "skill_name": "confluence"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "company_name": "Motional",
    "salary_year_avg": "189000.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-01-05",
    "skill_name": "sql"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "company_name": "Motional",
    "salary_year_avg": "189000.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-01-05",
    "skill_name": "python"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "company_name": "Motional",
    "salary_year_avg": "189000.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-01-05",
    "skill_name": "r"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "company_name": "Motional",
    "salary_year_avg": "189000.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-01-05",
    "skill_name": "git"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "company_name": "Motional",
    "salary_year_avg": "189000.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-01-05",
    "skill_name": "bitbucket"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "company_name": "Motional",
    "salary_year_avg": "189000.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-01-05",
    "skill_name": "atlassian"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "company_name": "Motional",
    "salary_year_avg": "189000.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-01-05",
    "skill_name": "jira"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "company_name": "Motional",
    "salary_year_avg": "189000.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-01-05",
    "skill_name": "confluence"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "company_name": "SmartAsset",
    "salary_year_avg": "186000.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-07-11",
    "skill_name": "sql"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "company_name": "SmartAsset",
    "salary_year_avg": "186000.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-07-11",
    "skill_name": "python"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "company_name": "SmartAsset",
    "salary_year_avg": "186000.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-07-11",
    "skill_name": "go"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "company_name": "SmartAsset",
    "salary_year_avg": "186000.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-07-11",
    "skill_name": "snowflake"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "company_name": "SmartAsset",
    "salary_year_avg": "186000.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-07-11",
    "skill_name": "pandas"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "company_name": "SmartAsset",
    "salary_year_avg": "186000.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-07-11",
    "skill_name": "numpy"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "company_name": "SmartAsset",
    "salary_year_avg": "186000.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-07-11",
    "skill_name": "excel"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "company_name": "SmartAsset",
    "salary_year_avg": "186000.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-07-11",
    "skill_name": "tableau"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "company_name": "SmartAsset",
    "salary_year_avg": "186000.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-07-11",
    "skill_name": "gitlab"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "184000.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-06-09",
    "skill_name": "sql"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "184000.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-06-09",
    "skill_name": "python"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "184000.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-06-09",
    "skill_name": "r"
  }
]
*/