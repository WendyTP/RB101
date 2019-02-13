## PEDAC on assignment- mortgage calculator



### Understand the problem

#### input :

1. **loan amount** :  ex. 250,000.00
2. **Annual Percentage Rate (APR)** : in percentage (ex. 6 %)
3. **loan duration** : in year

#### output:

1. **monthly interest rate**: calculated by dividing the APR by 12- in float number (ex. 0.06)
2. **loan duration in months**  : comes from transforming the loan duration input
3. **(optional) monthly payment** : calculated from the formula

#### rule:

monthly payment formula : `m = p * (j / (1 - (1 + j)**(-n)))`

m = monthly payment

p = loan amount

j = monthly interest rate

n = loan duration in months

### Example/ Test case

Example 1: 

input : 250000 ; 6 %; 30

output: 

monthly interest rate : 6%  / 12

loan duration in months : 30 * 12

monthly payment : with formula

Edge cases:

APR with 0 %

Bad inputs: 

**loan amount** : not numbers ; negative number; number with "," or space in it

**APR**: not numbers; negative number; number with "," or space in it; number with %; 

**loan duration (in yr):** not numbers; negative number; number with "," or space in it



### Data Structure

#### input: 

String --> float number

#### output:

monthly interest: float number

loan duration in month: float number

monthly payment : float number

#### rule/ requirement

### Algorithm

Greet the user

Request user input

Validate the input

(one request- > one validation ; another request -> another validation)

Convert the input : 

1. APR rate from % to decimal numbers (ex. 0.006)
2. Loan duration from year to month

Start the computation:

1. calculate monthly interest from APR
2. loan duration in month (see above conversion of input )
3. calculate monthly payment from formula 

Provide the computation result to the user

Ask the user if they want to continue another calculation

Salut



#####

Complete the first programme with simple validation --> modify validation --> simplify the puts message --> extract message to yaml file --> adding other language





#### 









