#include <string>
#include <vector>
using namespace std;

namespace election {

// The election result struct is already created for you:

struct ElectionResult {
    // Name of the candidate
    std::string name{};
    // Number of votes the candidate has
    int votes{};
};

// vote_count takes a reference to an `ElectionResult` as an argument and will
// return the number of votes in the `ElectionResult.

int vote_count(ElectionResult& elected) {
    return elected.votes;
}

void increment_vote_count(ElectionResult& elected,int number) {
    elected.votes += number;
}

// increment_vote_count takes a reference to an `ElectionResult` as an argument
// and a number of votes (int), and will increment the `ElectionResult` by that
// number of votes.

// determine_result receives the reference to a final_count and returns a
// reference to the `ElectionResult` of the new president. It also changes the
// name of the winner by prefixing it with "President". The final count is given
// in the form of a `reference` to `std::vector<ElectionResult>`, a vector with
// `ElectionResults` of all the participating candidates.

ElectionResult& determine_result(vector<ElectionResult>& given) {
    int max=-1;
    int space=0;
    int size=given.size();
    for(int i=0; i < size; i++) {
        if(given[i].votes > max) {
            max = given[i].votes;
            space = i;
        }
    }
    given.at(space).name = "President " + given.at(space).name;
    ElectionResult& president{given.at(space)};
    return president;
}

}  // namespace election
