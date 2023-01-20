--explore data
select * 
from ['HR Employee Attrition$']

--count of our dataset
select COUNT(* )
from ['HR Employee Attrition$']

--list of departments
select distinct department
from ['HR Employee Attrition$']

select distinct EducationField
from ['HR Employee Attrition$']

--Find details of employees under attrition that have 5+ years of experinece in between age group of 27-35

select *
from ['HR Employee Attrition$']
where Age between 27 and 35
and TotalWorkingYears >=5

--Total count of employees under attrition that have 5+ years of experinece in between age group of 27-35
select count(*)
from ['HR Employee Attrition$']
where Age between 27 and 35
and TotalWorkingYears >=5


--fetch the details of employee having maximum and minimum salary working in different departments who received less than 13% salary hike

select department,
   MAX(MonthlyIncome) as TotalMaxSalary,
   MIN(MonthlyIncome) as TotalMinSalary
from ['HR Employee Attrition$']
where PercentSalaryHike <13
group by Department
order by max(MonthlyIncome) desc

--calculate the average monthly income of all employee who worked more than 3 years and whose education background is medical

select AVG(MonthlyIncome) as AverageMonthlyIncome
from ['HR Employee Attrition$']
where YearsAtCompany >3
and EducationField = 'medical'


--Identify the total number of male and female employees under attrition whose marital status is married and havent received promotion in the last 2 years
select gender, count(employeeId) as TotalNumer
from ['HR Employee Attrition$']
where MaritalStatus ='married'
and YearsSinceLastPromotion = 2
and Attrition = 'Yes'
group by Gender

--employee with max perfomance rating but no promotion for 4 years and above
select *
from ['HR Employee Attrition$']
where PerformanceRating = (select max(PerformanceRating) from ['HR Employee Attrition$'])
and YearsSinceLastPromotion >= 4

select max(PerformanceRating) 
from ['HR Employee Attrition$']


--who has max and min percentage salary hike
select YearsAtCompany, 
PerformanceRating,YearsSinceLastPromotion,
max(PercentSalaryHike) as maxPercentSalaryHike,
min(PercentSalaryHike) as minPercentSalaryHike
from ['HR Employee Attrition$']
group by YearsAtCompany,PerformanceRating,YearsSinceLastPromotion
order by max(PercentSalaryHike) desc, min(PercentSalaryHike) asc

--employee working overtime but are given min salary hike and are more than 5 years with company in attrition
select *
from ['HR Employee Attrition$']
where OverTime = 'Yes'
and PercentSalaryHike = (select min(PercentSalaryHike) from ['HR Employee Attrition$'])
and YearsAtCompany > 5
and Attrition = 'Yes'

--employee working overtime but are given max salary hike and have spent less than 5 years with company
select *
from ['HR Employee Attrition$']
where OverTime = 'Yes'
and PercentSalaryHike = (select max(PercentSalaryHike) from ['HR Employee Attrition$'])
and YearsAtCompany < 5

--employee not working overtime but are given max salary hike and have spent less than 5 years with company

select *
from ['HR Employee Attrition$']
where OverTime = 'No'
and PercentSalaryHike = (select max(PercentSalaryHike) from ['HR Employee Attrition$'])
and YearsAtCompany < 5

--What is the maximum/minimum relationship satisfaction
select MaritalStatus, max(RelationshipSatisfaction) as MaxRelationshipSatisfaction, 
min(RelationshipSatisfaction) as MinRelationshipSatisfaction
from ['HR Employee Attrition$']
group by MaritalStatus