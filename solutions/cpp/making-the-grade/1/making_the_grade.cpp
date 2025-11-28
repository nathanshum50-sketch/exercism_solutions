#include <array>
#include <string>
#include <vector>

// Round down all provided student scores.
std::vector<int> round_down_scores(std::vector<double> student_scores) {
    int size = student_scores.size();
    std::vector<int> new_scores;
    for(int i=0; i < size; i++) {
        new_scores.emplace_back(static_cast<int>(student_scores.at(i)));
    }
    //Implement round_down_scores
    return new_scores;
}

// Count the number of failing students out of the group provided.
int count_failed_students(std::vector<int> student_scores) {
    // Implement count_failed_students
    int size = student_scores.size();
    int number = 0;
    for(int i=0; i < size; i++) {
        if(student_scores.at(i) <= 40) number++;
    } 
    return number;
}

// Create a list of grade thresholds based on the provided highest grade.
std::array<int, 4> letter_grades(int highest_score) {
    int increment = (highest_score-40)/4;
    std::array<int,4> grades {41,41+increment,41+increment*2,41+increment*3};
    // Implement letter_grades
    return grades;
}

// Organize the student's rank, name, and grade information in ascending order.
std::vector<std::string> student_ranking(
    std::vector<int> student_scores, std::vector<std::string> student_names) {
    // Implement student_ranking
    std::vector<std::string> ranking;
    int size = student_scores.size();
    for(int i=0; i < size; i++) {
        ranking.emplace_back(std::to_string(i+1) + ". " + student_names.at(i) + ": " + std::to_string(student_scores[i]));
    }
    return ranking;
}

// Create a string that contains the name of the first student to make a perfect
// score on the exam.
std::string perfect_score(std::vector<int> student_scores,
                          std::vector<std::string> student_names) {
    int size = student_scores.size();
    for(int i=0; i < size; i++) {
        if(student_scores[i] == 100) return student_names[i];
    }
    return "";
}
