#include "vehicle_purchase.h"
#include <sstream>

namespace vehicle_purchase {

// needs_license determines whether a license is needed to drive a type of
// vehicle. Only "car" and "truck" require a license.
bool needs_license(std::string kind) {
    // Return true if you need a license for that kind of vehicle.
    return (kind=="car"||kind=="truck");
}

// choose_vehicle recommends a vehicle for selection. It always recommends the
// vehicle that comes first in lexicographical order.
std::string choose_vehicle(std::string option1, std::string option2) {
    // Return the final decision in a sentence.
    size_t length1 = option1.length();
    size_t length2 = option2.length();
    size_t min;
    bool larger=true;
    std::string returned;
    if(length1 > length2) {
        min = length2;
    } else {
        min = length1;
        larger = false;
    }
    for(size_t i=0; i < min; i++) {
        if(option1[i]==option2[i]) continue;
        int charge1 = (int)option1[i], charge2 = (int)option2[i];
        if(charge1 >= 97 && charge1 <= 122) charge1 -= 32;
        if(charge2 >= 97 && charge2 <= 122) charge2 -= 32;
        if(charge1 >= 65 && charge2 <= 90 && charge2 >= 65 && charge2 <= 90) {
            if(charge1 > charge2) {
                returned = option2;
            } else {
                returned = option1;
            }
            std::ostringstream oss;
            oss << returned << " is clearly the better choice.";
            return oss.str();
        }
    }
    if(larger) {
        returned = option2;
    } else {
        returned = option1;
    }
    std::ostringstream oss;
    oss << returned << " is clearly the better choice.";
    return oss.str();
}

// calculate_resell_price calculates how much a vehicle can resell for at a
// certain age.
double calculate_resell_price(double original_price, double age) {
    // Return the age-corrected resell price.
    if(age < 3) {
        return original_price*0.8;
    } else if(age < 10) {
        return original_price*0.7;
    }
    return original_price*0.5;
}

}  // namespace vehicle_purchase
