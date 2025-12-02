namespace hellmath {
enum class AccountStatus {
    troll,
    user,
    guest,
    mod
};
// Task 1 - Define an `AccountStatus` enumeration to represent the four
// account types: `troll`, `guest`, `user`, and `mod`.

// Task 1 - Define an `Action` enumeration to represent the three
// permission types: `read`, `write`, and `remove`.
enum class Action {
    read,
    write,
    remove
};
// Task 2 - Implement the `display_post` function, that gets two arguments
// of `AccountStatus` and returns a `bool`. The first argument is the status of
// the poster, the second one is the status of the viewer.
bool display_post(AccountStatus poster, AccountStatus viewer) {
    switch(static_cast<int>(poster)) {
        case 0:
            return (static_cast<int>(viewer) == 0);
        default:
            return true;
    }
}
// Task 3 - Implement the `permission_check` function, that takes an
// `Action` as a first argument and an `AccountStatus` to check against. It
// should return a `bool`.
bool permission_check(Action action, AccountStatus checked) {
    int act = static_cast<int>(action);
    switch(static_cast<int>(checked)) {
        case 0:
        case 1:
            return (act != 2);
        case 2:
            return (act == 0);
        default:
            return true;
    }
}
// Task 4 - Implement the `valid_player_combination` function that
// checks if two players can join the same game. The function has two parameters
// of type `AccountStatus` and returns a `bool`.

bool valid_player_combination(AccountStatus player1, AccountStatus player2) {
    int second = static_cast<int>(player2);
    switch(static_cast<int>(player1)) {
        case 0:
            return second == 0;
        case 2:
            return false;
        default:
            return (second != 0 && second != 2);
    }
}
    
// Task 5 - Implement the `has_priority` function that takes two
// `AccountStatus` arguments and returns `true`, if and only if the first
// account has a strictly higher priority than the second.

bool has_priority(AccountStatus player1, AccountStatus player2) {
    int second = static_cast<int>(player2);
    switch(static_cast<int>(player1)) {
        case 1:
            return (second!=3 && second!= 1);
        case 2:
            return (second==0);
        case 3:
            return (second!=3);
        default:
            return false;
    }
}

}  // namespace hellmath
