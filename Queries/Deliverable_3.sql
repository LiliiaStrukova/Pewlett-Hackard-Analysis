-- Deliverable 3 - additional data
-- Retirement only 1952
SELECT DISTINCT ON (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	t.title,
	t.to_date,
	de.dept_no,
	d.dept_name
--INTO retirement_1952
FROM employees AS e
JOIN titles AS t
ON (e.emp_no = t.emp_no)
JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
JOIN departments AS d
ON (de.dept_no = d.dept_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1952-12-31')
	AND (t.to_date = '9999-01-01')
ORDER BY e.emp_no, t.to_date DESC;

-- Retirement (1952) by title
SELECT COUNT(title) AS "count", title
--INTO retirement_1952_title
FROM retirement_1952
GROUP BY title
ORDER BY count DESC;

-- Retirement (1952) by dept_name
SELECT COUNT(dept_name) AS "count", dept_name
--INTO retirement_1952_dept_name
FROM retirement_1952
GROUP BY dept_name
ORDER BY count DESC;

-- Expanding range for Mentorship Eligibility
SELECT DISTINCT ON (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
--INTO mentorship_eligibility_expanded
FROM employees AS e
JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
JOIN titles AS t
ON (e.emp_no = t.emp_no)
WHERE (de.to_date = '9999-01-01')
	AND (e.birth_date BETWEEN '1961-01-01' AND '1965-12-31')
ORDER BY emp_no, t.to_date DESC;

SELECT COUNT (title) AS "count", title
--INTO mentorship_titles_expanded
FROM mentorship_eligibility_expanded
GROUP BY title
ORDER BY count DESC;

SELECT COUNT (title) FROM mentorship_eligibility_expanded;

-- Checking hire date
SELECT * FROM employees
ORDER BY hire_date DESC;