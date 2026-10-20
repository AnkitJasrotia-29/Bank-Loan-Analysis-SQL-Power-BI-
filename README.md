# Bank Loan Analysis Dashboard

A Power BI dashboard built on 38,576 bank loan records. It shows how much money the bank lends, how much it gets back, and which loans end up going bad.

## About the project

Banks lend a lot of money, and a small share of loans always goes unpaid. The question is how big that share is and where it comes from. This dashboard answers the basics: how many loans were issued, how much was funded, how much has come back, and how good loans compare with bad ones.

The SQL queries used to get the numbers are in `Sql_Query_Doc.docx`. The Power BI report uses the same logic, so the figures match.

**Who it's for:** anyone reviewing loan performance, such as bank analysts, risk teams, or a hiring manager looking at my portfolio.

## Dataset

The data is in `Bank_loan.csv`: 38,576 loans and 24 columns.

| Group | Columns |
|---|---|
| Loan | `id`, `loan_amount`, `term`, `int_rate`, `installment`, `grade`, `sub_grade`, `purpose`, `loan_status` |
| Borrower | `member_id`, `emp_title`, `emp_length`, `home_ownership`, `annual_income`, `dti`, `address_state`, `verification_status`, `application_type` |
| Dates | `issue_date`, `last_credit_pull_date`, `last_payment_date`, `next_payment_date` |
| Payments | `total_payment`, `total_acc` |

## Tools used

- **SQL**: KPI and chart queries
- **Excel**: source data
- **Power BI**: data model, DAX measures, and the report

## How the numbers are defined

- **Good loan:** status is *Fully Paid* or *Current*
- **Bad loan:** status is *Charged Off*
- **Total amount received:** sum of `total_payment`
- **MTD:** December, the latest month in the data
- **MoM:** December compared with November

## What's in the dashboard

The report has three pages. Each page has filters for State, Grade, and Purpose.

**1. Summary**
- Headline KPIs: total applications, funded amount, amount received, average interest rate, and average DTI, each with MTD and MoM change
- Good loan vs bad loan split with applications, funded amount, and amount received
- A loan status table (Fully Paid, Current, Charged Off)

**2. Overview**
- Amount received by month
- Amount received by state (map)
- Breakdown by loan term, employment length, loan purpose, and home ownership
- A measure selector so the charts can switch between applications, funded amount, and amount received

**3. Details**
- Loan-level records for checking individual loans


## What the data shows

**Overall**
- 38.6K loan applications, $435.8M funded, $473.1M received
- Average interest rate is 12.0% and average DTI is 13.3%
- In December, applications were up 6.9% on November, funded amount up 13.0%, and amount received up 15.84%

**Good vs bad loans**
- 86.18% of loans are good (about 33K) and 13.82% are bad (about 5K)
- The bank funded $65.5M of bad loans and got back $37.3M, a shortfall of roughly $28M
- Good loans brought back $435.8M against $370.2M funded
- Charged-off loans carry a higher average interest rate (13.88%) than fully paid ones (11.64%)

**Trends and segments**
- Monthly amount received roughly doubles over the year, from $28M in January to $58M in December
- Debt consolidation is the biggest purpose by far at $253.8M, followed by credit card at $65.2M
- 36-month loans bring in 62.3% of the money received, and 60-month loans bring in 37.7%
- Borrowers with a mortgage ($238.5M) or who rent ($201.8M) make up most of the repayments
- Borrowers with 10+ years of employment have the highest amount received at $126M
- California stands out on the state map


## What I learned

- Writing KPI logic in SQL first makes it easy to check the Power BI numbers.
- MTD and MoM measures need a clear definition of "latest month", otherwise the comparison is wrong.
- A single good/bad flag is enough to turn raw loan statuses into something a manager can read at a glance.

## Contact

**Ankit Jasrotia**

- LinkedIn: [ankit-jasrotia-245b0937b](https://www.linkedin.com/in/ankit-jasrotia-245b0937b)
- GitHub: [AnkitJasrotia-29](https://github.com/AnkitJasrotia-29)
- Email: [ankitjasrotia767@gmail.com](mailto:ankitjasrotia767@gmail.com)
