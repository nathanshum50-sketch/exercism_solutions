#include "robot_simulator.h"

robot_status_t robot_create(robot_direction_t direction, int x, int y) {
    robot_status_t status;
    status.direction = direction;
    status.position.x = x;
    status.position.y = y;
    return status;
}

void robot_move(robot_status_t *robot, const char *commands) {
    for(int i = 0; commands[i] != '\0'; i++) {
        char command = commands[i];
        if(command == 'R') {
            robot->direction = (robot_direction_t)(((int)robot->direction + 1) % (DIRECTION_MAX));
        }
        else if(command == 'L') {
            robot->direction = (robot_direction_t)(((int)robot->direction - 1 + DIRECTION_MAX) % (DIRECTION_MAX));
        }
        else if(command == 'A') {
            switch(robot->direction) {
                case DIRECTION_NORTH:
                    robot->position.y += 1;
                    break;
                case DIRECTION_EAST:
                    robot->position.x += 1;
                    break;
                case DIRECTION_SOUTH:
                    robot->position.y -= 1;
                    break;
                case DIRECTION_WEST:
                    robot->position.x -= 1;
                    break;
                default:
                    break;
            }
        }
    }
    return;
}