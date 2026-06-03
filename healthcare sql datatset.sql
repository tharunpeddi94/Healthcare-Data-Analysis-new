select * from healthcare_data;
                        -- Exploratory Data Analysis By using SQL
                            -- Get All Patients With Cancer Disease
select name,age,gender,doctor,billing_amount
from healthcare_data
where medical_condition = 'cancer';
                               -- Total Bill Amount By Hospital
select hospital,sum(billing_amount) as Total_billing
from healthcare_data
group by hospital
order by Total_billing desc;
                            -- Patients Discharged After a Specific Date
select name,discharge_date
from healthcare_data
where discharge_date > '2024-01-01';
                              -- Average Age of Patients By treatment
select medical_condition,avg(age) as patients_age
from healthcare_data
group by medical_condition;
								-- Patients With Highest Bill Amount
select name,billing_amount
from healthcare_data
order by billing_amount desc
limit 5;
              -- calculate patients hospitalized age wise from maximum to minimum
select age,count(age) as agewise
from healthcare_data
group by age
order by agewise desc,age desc
limit 10;
               -- Ranking Age on the number of patients Hospitalized 
select age,count(age) as total,
dense_rank() over(order by count(age) desc)as rnk
from healthcare_data
group by age
having total > avg(age);
        -- finding count of medical condition of patients and listing it by maximum number of patients
select medical_condition,count(medical_condition) as total,
dense_rank() over(order by count(medical_condition) desc)as rnk
from healthcare_data
group by medical_condition
order by total desc;
            -- Finding Rank and maximum number of medicines recommended to patients based on medical condition
select medical_condition,medication,count(medication) as maximum_recommended,
dense_rank() over(order by count(medication) desc) as rnk
from healthcare_data
group by medical_condition,medication
order by maximum_recommended desc
limit 10;
                   -- Most Preferred Insurance Provider To patients Hospitalized
select insurance_provider,count(insurance_provider) as prefered_insu
from healthcare_data
group by insurance_provider
order by prefered_insu desc;
                               -- Finding Out Most Prefered Hospital
select hospital,count(hospital)as prefered_hospital
from healthcare_data 
group by hospital
order by prefered_hospital desc;
                      -- Identifying Total Billing Amount By Medical Condition
select medical_condition,round(sum(billing_amount),2) as total_billing
from healthcare_data
group by medical_condition
order by total_billing desc;
                        -- Indentifying Avg Billing Amount By Medical Condition
select medical_condition,round(avg(billing_amount),2) as avg_billing
from healthcare_data
group by medical_condition;
    -- Finding Billing Amount of Patients Admitted and Number of Days Spent In Respective Hospital
select medical_condition, name,hospital,datediff(discharge_date,admission_date) as number_of_days,
sum(billing_amount) over(partition by hospital order by hospital desc) as total_amount
from healthcare_data
order by medical_condition;
-- Finding Total Number of Days Spent By Patient In Hospital for a Given Medical Condition
select medical_condition, datediff(discharge_date,admission_date) as number_days, hospital,billing_amount
from healthcare_data;
-- Finding Hospitals Which Were Successful in Discharging Patients After Having Test Results As Normal with count of Days taken to get Results Normal
select medical_condition, hospital,datediff(discharge_date,admission_date)as days_count,test_results
from healthcare_data
where test_results = 'Normal'
order by medical_condition, hospital; 
                   -- calculate number of Blood type of Patients which lies Between Age 20 And 45
select age,blood_type,count(blood_type) as number_bloodtype
from healthcare_data 
where age between 20 and 45
group by age,blood_type
order by number_bloodtype desc;
           -- Provide List Of Hospitals Along With Count Of Patients Admitted In the Year 2024 and 2025
select distinct hospital,count(*) as patients_admitted
from healthcare_data 
where year in (2024,2025)
group by hospital
order by patients_admitted desc;
-- Find Avg, Min,max billing Amount for Each Insurance provider
select insurance_provider,round(avg(billing_amount),2) as avg_amount,min(billing_amount) as min_amount,max(billing_amount) as max_amount
from healthcare_data
group by insurance_provider;
                  -- Create A New Column That Categorizes Patients as High,Medium,Low Risk Based on their Medical Condition
select name, medical_condition,test_results,
case 
when test_results = "Inconclusive" then "Cannot be Discharged"
when test_results = "Normal" then "Can be Discharged"
when test_results = "abnormal" then "Need More Attention"
end as "status"
from healthcare_data;
                           -- Find the Total Amount by the Insurance Provider
select insurance_provider,round(sum(billing_amount),2) as total_amount
from healthcare_data
group by insurance_provider
order by total_amount desc;
								-- Count Monthly Admissions into Hospital
select month,count(*) as admissions
from healthcare_data
group by month
order by month;
                                  -- Calculate Monthly Revenue into Hospital
select month,round(sum(billing_amount),2) as monthly_revenue
from healthcare_data
group by month
order by month ;































