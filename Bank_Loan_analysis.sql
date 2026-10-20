select * from loan;
use Bank_loanDB;

-- A) Total Loan Applications

select count(id) as Total_Loan_Applications from loan;

select count(id) as MTD_Total_Loan_Applications from loan
where month(issue_date) = 12 and year(issue_date) = 2021;

select count(id) as PMTD_Total_Loan_Applications from loan
where month(issue_date) = 11 and year(issue_date) = 2021;
-- PMTD Means Previous Month To Date (November)

-- B) Total Funded Amount
 
 select sum(loan_amount) as Total_Funded_Amount from loan;

 select sum(loan_amount) as MTD_Total_Funded_Amount from loan
 where month(issue_date) = 12 and year(issue_date) = 2021;

 select sum(loan_amount) as PMTD_Total_Funded_Amount from loan
 where month(issue_date) = 11 and year(issue_date) = 2021;

-- C) Total Amount Received

 select sum(total_payment) as Total_Amount_Received from loan;
 
 select sum(total_payment) as MTD_Total_Amount_Received from loan
 where month(issue_date) = 12 and year(issue_date) = 2021;

 select sum(total_payment) as PMTD_Total_Amount_Received from loan
 where month(issue_date) = 11 and year(issue_date) = 2021;

-- D) Average Interest Rate
  
  select round(avg(int_rate),4) * 100 as Avg_interest_Rate
  from loan; 
     -- round function been used here beacause it tells how many digits you want.                
  
  select round(avg(int_rate),4) * 100 as MTD_Avg_interest_Rate
  from loan
  where month(issue_date) = 12 and year(issue_date) = 2021;

  select round(avg(int_rate),4) * 100 as PMTD_Avg_interest_Rate
  from loan
  where month(issue_date) = 11 and year(issue_date) = 2021;

-- D) Avg Debt-to-income ratio (DTI)

   select round(avg(dti),4) * 100 as Avg_DTI from loan;

   select round(avg(dti),4) * 100 as MDT_Avg_DTI from loan
   where month(issue_date) = 12 and year(issue_date) = 2021;

   select round(avg(dti),4) * 100 as PMDT_Avg_DTI from loan
   where month(issue_date) = 11 and year(issue_date) = 2021;

-- Good Loan
   
 -- A) Good Loan Application Percentage
    Select
        count(case when loan_status = 'Fully Paid' 
        or loan_status = 'Current'
        then id end) * 100
        /
        count(id) as Good_Loan_Percentage
    from loan;

 -- B) Good Loan Applications
       
       select count(ID) as Good_Loan_Applications from loan
       where loan_status = 'Fully Paid' or loan_status = 'Current';

 -- C) Good Loan Funded Amount
        
        select sum(loan_amount) as Good_loan_funded_amount
        from loan
        where loan_status = 'Fully paid' or loan_status = 'Current';

 -- D) Good loan Amount Received
   
        Select sum(total_payment) as Good_loan_amount_received
        from loan
        where loan_status = 'Fully Paid' or loan_status = 'Current';

-- Bad Loans

 -- A) Bad Loan Application Percentage
     
       select 
           round(count(case when
           loan_status = 'Charged Off'
           then id end),4) * 100
           /
           count(id) as Bad_loan_percentage
        from loan;

 -- B) Bad Loan Applications
     
       select count(id) as Total_Bad_Loan_Applications
       from loan
       where loan_status = 'Charged Off';

 -- C) Bad Loan Funded Amount

       select sum(loan_amount) as Bad_Loan_Funded_Amount
       from loan
       where loan_status = 'Charged Off';

 -- D) Bad Loan Total Received Amount

       select sum(total_payment) as Bad_loan_Amount_Received
       from loan
       where loan_status = 'Charged Off';


--  Checking Loan Status

     select loan_status,
         count(id) as Loan_Count,
         sum(total_payment) as Total_Amount_Received,
         sum(loan_amount) as Total_Funded_Amount,
         avg(int_rate * 100)as Interest_Rate,
         avg(dti * 100) as DTI
     from loan
     group by loan_status;

-- MTD Amount Received and Total Funded Amount

     Select loan_status,
          sum(total_payment) as MTD_Total_Amount_Received,
          sum(loan_amount) as MTD_Total_Funded_Amount
     from loan
     where month(issue_date) = 12 or month(issue_date) = 2021
     group by loan_status;

-- Charts ( Dashboard 2) 

  -- A) Monthly Trends By issue date (Matrix to be shown is mentioned below.)

        select 
            month(issue_date) as Month_Number,
            datename(month,issue_date) as Month_Name,
            count(id) as Total_Loan_Applications,
            sum(loan_amount) as Total_Funded_Amount,
            sum(total_payment) as Total_Received_Amount
        from loan
        group by month(issue_date),datename(month,issue_date) 
        order by month(issue_date);
        
  -- B) Region sales
        
        select 
            address_state as Region,
            count(id) as Total_Loan_Applications,
            sum(loan_amount) as Total_Funded_Amount,
            sum(total_payment) as Total_Received_Amount
        from loan
        group by address_state
        order by Total_Funded_Amount desc; -- Wanted to see the Region with highest Given Loan

  -- C) Long Term Analysis

         select 
            term,
            count(id) as Total_Loan_Applications,
            sum(loan_amount) as Total_Funded_Amount,
            sum(total_payment) as Total_Received_Amount
         from loan
         group by term
         order by term desc;

  -- D) Employee Length Analysis


         select 
              emp_length as emp_loan_period,
              count(id) as Total_Loan_Applications,
              sum(loan_amount) as Total_Funded_Amount,
              sum(total_payment) as Total_Received_Amount
         from loan
         group by emp_length 
         order by emp_loan_period desc;

  -- E) loan purpose

         select 
              purpose as Loan_Purpose,
              count(id) as Total_Loan_Applications,
              sum(loan_amount) as Total_Funded_Amount,
              sum(total_payment) as Total_Received_Amount
         from loan
         group by purpose
         order by  count(id) desc;

  -- F) Home ownership
          
          select 
               home_ownership,
               count(id) as Total_Loan_Applications,
               sum(loan_amount) as Total_Funded_Amount,
               sum(total_payment) as Total_Received_Amount
         from loan
         group by home_ownership 
         order by count(id) desc;

  