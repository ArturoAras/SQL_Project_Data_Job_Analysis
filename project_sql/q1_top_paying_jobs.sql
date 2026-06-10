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

/*

[
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst",
    "company_name": "Mantys",
    "job_location": "Anywhere",
    "job_country": "India",
    "salary_year_avg": "650000.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-02-20"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Director of Analytics",
    "company_name": "Meta",
    "job_location": "Anywhere",
    "job_country": "United States",
    "salary_year_avg": "336500.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-08-23"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Associate Director- Data Insights",
    "company_name": "AT&T",
    "job_location": "Anywhere",
    "job_country": "United States",
    "salary_year_avg": "255829.5",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-06-18"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst, Marketing",
    "company_name": "Pinterest Job Advertisements",
    "job_location": "Anywhere",
    "job_country": "United States",
    "salary_year_avg": "232423.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-12-05"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Data Analyst (Hybrid/Remote)",
    "company_name": "Uclahealthcareers",
    "job_location": "Anywhere",
    "job_country": "United States",
    "salary_year_avg": "217000.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-01-17"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Principal Data Analyst (Remote)",
    "company_name": "SmartAsset",
    "job_location": "Anywhere",
    "job_country": "United States",
    "salary_year_avg": "205000.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-08-09"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Director, Data Analyst - HYBRID",
    "company_name": "Inclusively",
    "job_location": "Anywhere",
    "job_country": "United States",
    "salary_year_avg": "189309.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-12-07"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "company_name": "Motional",
    "job_location": "Anywhere",
    "job_country": "United States",
    "salary_year_avg": "189000.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-01-05"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "Principal Data Analyst",
    "company_name": "SmartAsset",
    "job_location": "Anywhere",
    "job_country": "United States",
    "salary_year_avg": "186000.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-07-11"
  },
  {
    "job_title_short": "Data Analyst",
    "job_title": "ERM Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "job_location": "Anywhere",
    "job_country": "United States",
    "salary_year_avg": "184000.0",
    "job_schedule_type": "Full-time",
    "job_posted_date": "2023-06-09"
  }
]

*/