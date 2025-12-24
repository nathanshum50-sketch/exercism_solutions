// Headers from the standard library should be inserted at the top via
// #include <LIBRARY_NAME>
#include <cmath>

// daily_rate calculates the daily rate given an hourly rate
double daily_rate(double hourly_rate) {
    // Implement a function to calculate the daily rate given an hourly
    // rate
    return hourly_rate*8;
}

// apply_discount calculates the price after a discount
double apply_discount(double before_discount, double discount) {
    // Implement a function to calculate the price after a discount.
    return before_discount*(100-discount)/100;
}

// monthly_rate calculates the monthly rate, given an hourly rate and a discount
// The returned monthly rate is rounded up to the nearest integer.
int monthly_rate(double hourly_rate, double discount) {
    // Implement a function to calculate the monthly rate, and apply a
    // discount.
    double raw_rate = hourly_rate*8*22*(100-discount)/100;
    int cut_rate = floor(raw_rate);
    if (cut_rate == raw_rate) {
        return cut_rate;
    } else {
        return cut_rate + 1;
    }
}

// days_in_budget calculates the number of workdays given a budget, hourly rate,
// and discount The returned number of days is rounded down (take the floor) to
// the next integer.
int days_in_budget(int budget, double hourly_rate, double discount) {
    // Implement a function that takes a budget, an hourly rate, and a
    // discount, and calculates how many complete days of work that covers.
    double raw_rate = hourly_rate*8*(100-discount)/100;
    double base_day = budget/raw_rate;
    return floor(base_day);
}
