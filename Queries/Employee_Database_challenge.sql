-- Deliverable 1
-- Checking original tables
SELECT * FROM employees;
SELECT * FROM titles;

-- Joining tables for Retirement Titles table
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
--INTO retirement_titles
FROM employees AS e
JOIN titles AS t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT * FROM retirement_titles;

SELECT DISTINCT ON (emp_no) emp_no,
	first_name,
	last_name,
	title
--INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

-- Number of employees by their most recent job title who are about to retire
SELECT * FROM unique_titles;

-- Number of titles
SELECT COUNT(title) FROM unique_titles;

-- Retiring Titles
SELECT COUNT(title) AS "count", title
--INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;

-- Deliverable 2
-- Checking original tables
SELECT * FROM employees;
SELECT * FROM dept_emp;
SELECT * FROM titles;

-- Joining tables
SELECT DISTINCT ON (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
-- INTO mentorship_eligibility
FROM employees AS e
JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
JOIN titles AS t
ON (e.emp_no = t.emp_no)
WHERE (de.to_date = '9999-01-01')
	AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no, t.to_date DESC;

-- Mentorship Eligibility participants
SELECT COUNT (title) FROM mentorship_eligibility;

-- Mentorship Eligibility per title
SELECT COUNT (title) AS "count", title
--INTO mentorship_titles_1965
FROM mentorship_eligibility
GROUP BY title
ORDER BY count DESC;