-- Create a Table joining retirement_info and titles.
SELECT ri.emp_no,
    ri.first_name,
    ri.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
INTO retirement_titles
FROM retirement_info as ri
LEFT JOIN titles as ti
ON ri.emp_no = ti.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) 
rt.emp_no,
rt.first_name,
rt.last_name,
rt.title

INTO unique_titles
FROM retirement_titles AS rt
WHERE rt.to_date = ('9999-01-01')
ORDER BY rt.emp_no ASC, rt.to_date DESC;

-- Count the number of retirees by job title
SELECT COUNT (ut.emp_no), ut.title
INTO retiring_titles
FROM unique_titles AS ut
GROUP BY ut.title
ORDER BY COUNT DESC;