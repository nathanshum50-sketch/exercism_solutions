#include <string>

namespace log_line {
std::string message(std::string line) {
    int place = line.find(":");
    return line.substr(place+2);
}

std::string log_level(std::string line) {
    int end = line.find("]");
    return line.substr(1,end-1);
}

std::string reformat(std::string line) {
    return message(line) + " (" + log_level(line) + ")";
}
}  // namespace log_line
