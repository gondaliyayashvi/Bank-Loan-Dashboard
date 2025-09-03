select * from bank_load_data

select COUNT(id)as Total_Loan_Applications from bank_load_data

select COUNT(id)as PMTD_Total_Loan_Applications from bank_load_data
where MONTH(issue_date) = 11
and YEAR(issue_date)=2021

select SUM(loan_amount)as MTD_Total_Funded_Amount from bank_load_data
where MONTH(issue_date)=12 and YEAR(issue_date)=2021

select SUM(total_payment) as MTD_Total_Amount_Received from bank_load_data
where MONTH(issue_date)= 12 and YEAR(issue_date)=2021

select SUM(total_payment) as PMTD_Total_Amount_Received from bank_load_data
where MONTH(issue_date)= 11 and YEAR(issue_date)=2021

select ROUND(avg(int_rate),4)*100 as Avg_Interest_Rate from bank_load_data

select ROUND(avg(int_rate),4)*100 as MTD_Avg_Interest_Rate from bank_load_data
where MONTH(issue_date)=12 and YEAR(issue_date)=2021

select ROUND(avg(int_rate),4)*100 as PMTD_Avg_Interest_Rate from bank_load_data
where MONTH(issue_date)=11 and YEAR(issue_date)=2021

select ROUND(AVG(dti),4)*100 as PMTD_Avg_DTI from bank_load_data
where MONTH(issue_date)=11 and YEAR(issue_date)=2021

select loan_status from bank_load_data

select 
(COUNT(case when loan_status = 'Fully Paid' or loan_status='Current' then id end)*100)
/
COUNT(id) as Good_Loan_Percentage
from bank_load_data

select COUNT(id) as Good_Loan_Applications from bank_load_data
where loan_status = 'Fully Paid' or loan_status='Current'

select sum(loan_amount) as Good_Loan_Funded_Amount from bank_load_data
where loan_status = 'Fully Paid' or loan_status='Current'

select sum(total_payment) as Good_Loan_Received_Amount from bank_load_data
where loan_status = 'Fully Paid' or loan_status='Current'

select
(COUNT(case when loan_status='Charged off' then id end )*100.0)/
COUNT(id) as Bad_Loan_Percentage
from bank_load_data

select COUNT(id) as Bad_Loan_Applications from bank_load_data
where loan_status='Charged Off'

select SUM(loan_amount) as Bad_Loan_Funded_Amount from bank_load_data
where loan_status='Charged Off'

select SUM(total_payment) as Bad_Loan_Amount_Received from bank_load_data
where loan_status='Charged Off'

select 
loan_status,
count(id) as LoanCount,
sum(total_payment) as Total_Amount_Received,
SUM(loan_amount)as Total_Funded_Amount,
avg(int_rate*100)as Interest_Rate,
AVG(dti*100)as DTI
from bank_load_data
group by loan_status

select 
loan_status,
sum(total_payment) as MTD_Total_Amount_Received,
SUM(loan_amount)as MTD_Total_Funded_Amount
from bank_load_data
where MONTH(issue_date)=12
group by loan_status

select 
MONTH(issue_date) as Month_Number,
DATENAME(MONTH,issue_date)as Month_Name,
COUNT(id)as Total_Loan_Applications,
SUM(loan_amount) as Total_Funded_Amount,
SUM(total_payment)as Total_Received_Amount
from bank_load_data
group by MONTH(issue_date),DATENAME(MONTH,issue_date)
order by MONTH(issue_date)

SELECT 
	address_state AS State, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_load_data
GROUP BY address_state
ORDER BY�address_state

SELECT 
	term AS Term, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_load_data
GROUP BY term
ORDER�BY�term

SELECT 
	emp_length AS Employee_Length, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_load_data
GROUP BY emp_length
ORDER�BY�emp_length

SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_load_data
GROUP BY purpose
ORDER�BY�purpose

SELECT 
	home_ownership AS Home_Ownership, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_load_data
GROUP BY home_ownership
ORDER BY home_ownership