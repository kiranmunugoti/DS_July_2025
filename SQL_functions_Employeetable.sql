#Create employee table with primary key (employee id)
create table employee(
emp_id INT Primary key,
first_name varchar(40),
last_name varchar(30),
salary INT,
joining_date datetime,
department varchar(30),
gender varchar (10),
job_title varchar(20)
);

#Inserting sample data into the table
Insert into 
employee(emp_id, first_name, last_name, salary, joining_date, department, gender, job_title) 
values
(101,	'Malli',    'G',	50000.0,	'2020-09-20 11:16:30',	'IT',			'Male',		'Software Engineer'),
(102,	'Venu',		'S',	55000.0,	'2024-10-05 07:15:15',	'IT',			'Male',		'Software Engineer'),
(103,	'Anjali',	'R',	62000.0,	'2024-08-15 09:45:22',	'HR',			'Female',	'HR Manager'),
(104,	'Rajesh',	'K',	48000.0,	'2023-07-10 14:10:06',	'Finance',		'Male',		'Financial Analyst'),
(105,	'Priya',	'M',	53000.0,	'2024-06-25 18:30:44',	'IT',			'Female',	'Software Engineer'),
(106,	'Arjun',	'B',	67000.0,	'2024-09-05 12:25:12',	'Operations', 	'Male',		'Unknown'),
(107,	'Sneha',	'T',	60000.0,	'2024-05-19 08:20:33',	'Marketing',	'Female',	'Marketing Executive'),
(108,	'Vikram',	'P',	58000.0,	'2024-04-30 17:55:11',	'IT',			'Male',		'Software Engineer'),
(109,	'Kavita',	'L',	50000.0,	'2023-03-15 11:05:28',	'HR',			'Female',	'HR Manager'),
(110,	'Suresh',	'N',	62000.0,	'2024-02-28 15:40:19',	'Finance',		'Male',		'Financial Analyst'),
(111,	'Suresh',	'N',	62000.0,	'2024-02-28 15:40:19',	'Finance',		'Male',		'Financial Analyst'),
(112,	'Deepak',	'J',	65000.0,	'2022-09-22 16:30:30',	'Operations',	'Male',		'Unknown'),
(113,	'Roshni',	'D',	52000.0,    '2022-11-12 10:12:08',	'IT',			'Female',	'Software Engineer'),
(114,	'Sameer',	'C',	70000.0,	'2024-10-18 13:45:51',	'Marketing',	'Male',		'Marketing Executive'),
(115,	'Pooja',	'V',	56000.0,	'2024-07-07 19:10:14',	'HR',			'Female',	'HR Manager'),
(116,	'Harish',	'S',	48000.0,	'2024-06-02 06:35:49',	'Finance',		'Male',		'Financial Analyst'),
(117,	'Asha',		'Y',	51000.0,	'2024-05-21 14:22:40',	'IT',			'Female',	'Software Engineer'),
(118,	'Kiran',	'Z',	62000.0,	'2021-04-18 18:55:20',	'Operations',	'Male',		'Unknown'),
(119,	'Divya',	'M',	58000.0,	'2024-03-29 08:11:33',	'Marketing',	'Female',	'Marketing Executive'),
(120,	'Divya',	'M',	58000.0,	'2024-03-29 08:11:33',	'Marketing',	'Female',	'Marketing Executive'),
(121,	'Sunil',	'B',	60000.0,	'2024-02-17 12:47:52',	'HR',			'Male',		'HR Manager'),
(122,	'Meena',	'A',	49000.0,	'2020-01-05 16:25:41',	'IT',			'Female',	'Software Engineer');

#Clone an existing table using create
create table emp_tb AS
select * 
from employee;

# Write a query to get all employee detail from "employee" table
select * from employee;
# Select only top 1 record from employee table
select * from employee
order by emp_id limit 1;

#Select only bottom 1 record from employee table
select * from employee
order by emp_id desc limit 1;

#How to select a random record from a table? 
select * from employee
order by rand() limit 1;

# Write a query to get "first_name” in upper case as "first_name_upper", ‘first_name’ in lower case as ‘first_name_lower”
# Create a new column “full_name” by combining “first_name” &
# “last_name” with space as a separator.
# Add 'Hello ' to first_name and display result.

select upper(first_name) as firstname_upper,
upper(last_name) as lastname_upper,
concat(first_name, " ", last_name) as full_name,
concat('Hello', " ", first_name) as display_result
from employee;

#Select the employee details
select * from employee where first_name = 'Malli';
select * from employee where first_name in ('Malli', 'Meena', 'Anjali');
select * from employee where first_name not in ('Malli', 'Meena', 'Anjali');
select * from employee where first_name like "v%";
select * from employee where first_name like "%i";
select * from employee where first_name like "%o%";

#  Whose "first_name" start with any single character between 'm-v'
select * from employee where first_name between 'm%' and 'v%';
select * from employee where first_name not between 'm%' and 'v%';

# Whose "first_name" start with 'M' and contain 5 letters
select * from employee where first_name like "M___%";

#Write a query to get all unique values of"department" from the employee table
select distinct department from employee;

#Query to check the total records present in a table
select count(*) AS total_records from employee;

#query to print first letter of a Name in Upper Case and all other letter in Lower Case.
select concat(UPPER(SUBSTRING(first_name, 1, 1)), LOWER(SUBSTRING(first_name, 2))) AS formatted_name from employee;

#Write down the query to display all employee name in one cell separated by ','
SELECT GROUP_CONCAT(first_name ORDER BY first_name SEPARATOR ', ') AS employee_names
FROM employee;

# Query to get the Lowest values of "salary" from employee table
select * from employee
order by salary limit 1;
select min(salary) as Highest_salary from employee;

# Query to get the Highest values of "salary" from employee table
select * from employee
order by salary desc limit 1;
select max(salary) as Highest_salary from employee;

# Query to get the Average values of "salary" from employee table
select AVG(salary) as avg_salary from employee;

# Query to get the Highest salary - Lowest salary as diff_salary values of "salary" from employee table
select max(salary) - min(salary) as diff_salary from employee;

# Query to get the percentage of salary from employee table
select ((max(salary)-min(salary))/(max(salary)+min(salary)))*100 as percentage_salary from employee;

# Select “first_name” from the employee table after removing white spaces from right side spaces
select rtrim(first_name) from employee;

# Select “first_name” from the employee table after removing white spaces from left side spaces
select ltrim(first_name) from employee;

# Select “first_name” from the employee table after removing white spaces from both sides
select trim(first_name) from employee;

# Query to check no.of records present in a table where employees having 50k salary
select * from employee where salary = 50000;

#Find the most recently hired employee in each department
select * from employee
order by joining_date desc limit 1;

#--------------------- Case, when, the end statement Queries ---------------------------------------#

# Display first_name and gender as M/F.(if male then M, if Female then F)
select first_name, gender from employee;

# Display first_name, salary, and a salary category
select first_name, salary,
case when salary < 50000 then 'Low' 
when salary between 50000 and 60000 then 'Medium'
when salary > 60000 then 'high'
end as salary_category
from employee;

#Display first_name, department, and a department classification
select * from employee limit 5;
select first_name, department,
case when department = 'IT' then 'Technical'
when department = 'HR' then 'Human Resources'
when department = 'Finance' then 'Accounting'
else 'other' end as department_classification
from employee;

#Display first_name, salary, and eligibility for a salary raise.
select first_name, salary,
case when salary < 50000 then 'Eligible for Raise'
else 'Not Eligible' end as eligibility_for_raise
from employee;

#Display first_name, joining_date, and employment status
select * from employee limit 5;
select first_name, joining_date,
case when joining_date < '2022-01-01' then 'Experienced'
else 'New Hire' end as Employment_status
from employee;

#Display first_name, salary, and bonus amount.
select * from employee limit 5;
select first_name, salary,
case when salary > 60000 then salary * 0.10
when salary between 50000 and 60000 then salary * 0.07
else salary * 0.05 end as bonus_amount,
case when salary > 60000 then 'add 10% bonus'
when salary between 50000 and 60000 then 'add 7% bonus'
else 'add 5% bonus' end as bonus_to_add
from employee;

# Display first_name, salary, and seniority level.
select * from employee limit 5;
select first_name, salary,
case when salary > 60000 then 'Senior'
when salary between 50000 and 60000 then 'Mid-Level'
else 'Junior' end as Seniority_Level
from employee;

# Display first_name, department, and job level for IT employees
select * from employee limit 5;
select first_name, department,
case when salary > 55000 then 'Senior IT Employee'
else  'Other' end as Job_level
from employee;

#Display first_name, joining_date, and recent joiner status.
select first_name, joining_date,
case when joining_date >  '2024-01-01' then  'Recent Joiner'
else  'Long-Term Employee' end as Joiner_status
from employee;

# Display first_name, joining_date, and leave entitlement.
select first_name, joining_date,
case when joining_date < '2021-01-01' then 'assign 10 Days Leave'
when joining_date between '2021-01-01' and '2023-01-01' then 'assign 20 Days Leave'
else 'assign 25 Days Leave' end as leave_entitlement
from employee;

# Display first_name, salary, department, and promotion eligibility.
select * from employee limit 5;
select first_name, salary, department,
case when salary >60000 and department = 'IT' then 'Promotion Eligible'
else 'Not Eligible' end as 'Promotion_eligibility' 
from employee;

# Display first_name, salary, and overtime pay eligibility.
select * from employee limit 5;
select first_name, salary, department,
case when salary < 50000 then 'Eligible for Overtime Pay'
else 'Not Eligible' end as 'overtime_pay_eligibility' 
from employee;

# Display first_name, department, salary, and job title
select * from employee limit 5;
select first_name, salary, department,
case when department = 'HR' and  salary > 60000 then 'HR Executive'
when department = 'Finance' and salary > 55000 then 'Finance Manager'
else 'Regular Employee' end as 'Job_title' 
from employee;

# Display first_name, salary, and salary comparison to the company average.
select avg(salary) as Avg_salary from employee;
select first_name, salary,
case when salary > (select avg(salary) from employee) then 'Above Average'
else 'Below average' end as 'salary_comparison'
from employee;

#---------------------------------------- Group By ---------------------------------------#

# department and department wise total(sum) salary, in ascending and descending order according to salary.
select department, sum(salary) from employee
group by department
order by sum(salary); # Ascending 
select department, sum(salary) from employee
group by department
order by sum(salary) desc; # descending

# Write down the query to fetch Project name assign to more than one Employee
select * from project_details limit 5;
select project_name from project_details
group by project_name
having count(emp_id_no)>1;

# write the query to get the department, total no. of departments, total(sum) salary
select * from employee limit 5;
select department, count(department), sum(salary)
from employee
group by department;

# Get the department-wise salary details from the "employee table" table
select * from employee limit 5;
select department, round(avg(salary)) as avg_salary
from employee
group by department;

# department wise maximum salary 
select department, max(salary) as max_salary
from employee
group by department;

# Display department-wise employee count and categorize based on size.
select * from employee limit 5;
select department, 
case when (select count(department) as dep_count from employee
group by department
having dep_count >5) then 'Large'
when (select count(department) as dep_count from employee
group by department
having dep_count between 3 and 5) then 'Medium'
else 'small' end as department_size
from employee
group by department;

#  Display department-wise average salary and classify pay levels.
select department, round(avg(salary)) as avg_salary,
case when round(avg(salary)) > 60000 then 'High Pay'
when round(avg(salary)) between 50000 and 60000 then 'Medium pay'
else 'Low pay' end as Pay_levels
from employee
group by department;

# Display department, gender, and count of employees in each category
select * from employee limit 5;
select department, gender, count(emp_id)
from employee
group by department, gender
order by department;

# Display the number of employees who joined each year and categorize hiring trends.
select * from employee;
SELECT date_format(joining_date, '%Y') AS join_year,
count(*) AS total_hired,
case when count(*) > 5 THEN 'High Hiring'
when count(*) BETWEEN 3 AND 5 THEN 'Moderate Hiring'
else 'Low Hiring' end as hiring_trends
from employee
group by date_format(joining_date, '%Y');

# Display department-wise highest salary and classify senior roles.
select * from employee;
select department, max(salary) as highest_salary,
case when max(salary) > 70000 then 'Senior Leadership'
else 'Mid-Level' end as senior_leadership
from employee
group by department;

# Display department-wise count of employees earning more than 60,000.
select * from employee;
select department, count(*) as high_earners,
case when count(*) > 2 then 'High-Paying Team'
else 'Standard Team' end as team_department
from employee
group by department;

#----------------------------------------- Date time related queries -------------------------------#
# Query to extract the below things from joining_date column.
select joining_date,
year(joining_date) as joining_year,
month(joining_date) as joining_month,
day(joining_date) as joining_day,
curdate() as current_date
from employee;

# Create two new columns that calculate the difference between joining_date and the current date.
select joining_date,
datediff(curdate(), joining_date) AS days_since_joining,
period_diff(extract(year_month from curdate()), extract(year_month from joining_date)) as months_since_joining
from employee;

# Get all employee details from the employee table whose joining year is 2020.
select * from employee where year(joining_date) = 2020;

# Get all employee details from the employee table whose joining month is Feb.
select * from employee where month(joining_date) = 2;

# Get all employee details from employee table whose joining date between "2021-01-01" and "2021-12-01"
select * from employee where joining_date between '2021-01-01' and '2021-12-01';

# From the "employee table" and "ProjectDetail" for employees who have been assigned a project, sorted by first name.
select * from project_details;
select * from employee;
select * from employee
join project_details on employee.emp_id = project_details.emp_id_no
order by first_name;

# From the "employee table" and "ProjectDetail" for employees who have not been assigned a project, sorted by first name.
select * from project_details;
select * from employee;
select * from employee
left join project_details on employee.emp_id = project_details.emp_id_no
order by first_name;

# If an employee has no assigned project, display "-No Project Assigned," sorted by first name
select * from project_details;
select * from employee;
select *,
case when project_details.project_name = '' then 'No project Assigned'
else project_details.project_name end as unassigned_project
from employee
left join project_details on employee.emp_id = project_details.emp_id_no
order by first_name;

# Get all project names from the "ProjectDetail" table, even if they are not linked to any employee
select * from project_details;
select * from project_details
left join employee on project_details.emp_id_no = employee.emp_id
order by first_name;

# Find the project names that have not been assigned to any employee using the "employee table" and "ProjectDetail" table
select *, case when employee.emp_id is null then project_details.project_name
else employee.emp_id end as unassigned_emp
from project_details
left join employee on project_details.emp_id_no = employee.emp_id
order by first_name;

# Get the employee name and project name for employees who are assigned to more than one project
select employee.emp_id, employee.first_name, project_details.project_name
from employee
join project_details on project_details.emp_id_no = employee.emp_id
where employee.emp_id in 
(select emp_id_no from Project_details
group by emp_id_no
having count(project_id) > 1);

# Get the project name and the employee names of employees working on projects that have more than one employee assigned.
select e.emp_id, e.first_name, p.project_name
from employee as e
join project_details as p on e.emp_id = p.emp_id_no
where p.emp_id_no in (
select emp_id_no from project_details
group by emp_id_no
having count(emp_id) > 1);

# Get records from the ProjectDetail table where the corresponding employee ID does not exist in the employee table
select * from project_details;
select * from employee;
SELECT p.*
FROM project_details p
LEFT JOIN employee e ON p.emp_id_no = e.emp_id
WHERE e.emp_id IS NULL;

#---------------------------------------- Complex Ranking Scenarios ------------------------------------#
# Find the employees who earn more than the average salary of their department
select * from employee;
SELECT * FROM employee
WHERE employee.salary > (
    SELECT AVG(employee.salary)
    FROM employee
);

#Rank employees within each job title in every department based on salary.
SELECT * FROM
(SELECT *, RANK()
OVER (
PARTITION BY department, job_title
ORDER BY salary DESC) AS salary_rank
FROM employee) employee_salary
WHERE salary_rank <= 3;

# Find employees who belong to the top 10% earners within their department using PERCENT_RANK()
SELECT * FROM
(SELECT *, PERCENT_RANK()
OVER (
PARTITION BY department
ORDER BY salary DESC) AS salary_rank
FROM employee) rank_employee
WHERE salary_rank <= 0.10;

# Assign row numbers to employees based on their joining year using PARTITION BY YEAR(join_date).
SELECT *, 
ROW_NUMBER() OVER ( PARTITION BY YEAR(joining_date)
ORDER BY joining_date) AS year_joined
FROM employee;

# Rank employees based on the number of projects handled within each department.
SELECT * FROM employee;
SELECT * FROM project_details;
SELECT *, COUNT(project_details.project_id) AS project_count,
RANK() OVER(
PARTITION BY department
ORDER BY COUNT(project_details.project_id) DESC) as project_rank
FROM employee
LEFT JOIN project_details ON employee.emp_id = project_details.emp_id_no
GROUP BY emp_id, first_name,department;