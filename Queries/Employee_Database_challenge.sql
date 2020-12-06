--Deliverable 1, query 1
select 
 e.emp_no
,e.first_name
,e.last_name
,t.title
,t.from_date
,t.to_date
into retirement_titles
from employees e
inner join titles t on e.emp_no = t.emp_no
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
order by e.emp_no asc;

--Deliverable 1, query 2
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

--Deliverable 1, query 3
SELECT
 COUNT(title)
,title
INTO retiring_titles
FROM unique_titles
GROUP by title
ORDER BY COUNT(title) desc

--Deliverable 2
SELECT DISTINCT ON (e.emp_no)
 e.emp_no
,e.first_name
,e.last_name
,e.birth_date
,de.from_date
,de.to_date
,ttl.title

INTO mentorship_eligibility
FROM employees as e
inner join dept_emp as de on e.emp_no = de.emp_no
inner join titles as ttl on e.emp_no = ttl.emp_no
WHERE e.birth_date BETWEEN '1965-01-01' AND '1965-12-31' AND de.to_date = '9999-01-01'
ORDER BY emp_no