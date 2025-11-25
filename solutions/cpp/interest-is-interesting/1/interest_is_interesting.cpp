// interest_rate returns the interest rate for the provided balance.
double interest_rate(double balance) {
    if(balance >= 5000) return 2.475;
    else if(balance >= 1000) return 1.621;
    else if(balance >= 0) return 0.5;
    return 3.213;
}

// yearly_interest calculates the yearly interest for the provided balance.
double yearly_interest(double balance) {
    //Implement the yearly_interest function
    return balance*interest_rate(balance)/100;
}

// annual_balance_update calculates the annual balance update, taking into
// account the interest rate.
double annual_balance_update(double balance) {
    // Implement the annual_balance_update function
    return yearly_interest(balance)+balance;
}

// years_until_desired_balance calculates the minimum number of years required
// to reach the desired balance.
int years_until_desired_balance(double balance, double target_balance) {
    // Implement the years_until_desired_balance function
    int years_needed = 0;
    
    while(target_balance > balance) {
        balance = annual_balance_update(balance);
        ++years_needed;
    }
    return years_needed;
}
