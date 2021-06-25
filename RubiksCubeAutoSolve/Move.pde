class Move {
  float angle = 0;
  int indexOfTheXaxisToBeTurned = 0; // if 1 turn right row, if  -1 turn left row
  int indexOfTheYaxisToBeTurned = 0; // if 1 turn bottom row, if  -1 turn top row
  int indexOfTheZaxisToBeTurned = 0; // if 1 turn front row, if  -1 turn back row
  int direction = 0; //direction -> turn clockwise or counterclockwise
  boolean animating = false;
  boolean finished = false;

  Move(int indexOfTheXaxisToBeTurned, int indexOfTheYaxisToBeTurned, int indexOfTheZaxisToBeTurned, int direction) {
    this.indexOfTheXaxisToBeTurned = indexOfTheXaxisToBeTurned;
    this.indexOfTheYaxisToBeTurned = indexOfTheYaxisToBeTurned;
    this.indexOfTheZaxisToBeTurned = indexOfTheZaxisToBeTurned;
    this.direction = direction;
  }

  void start() {
    animating = true;
    finished = false;
    this.angle = 0;
  }

  boolean finished() {
    return finished;
  }

  void update() {
    if (animating) {
      angle += direction * speed;
      if (abs(angle) > HALF_PI) {
        angle = 0;
        animating = false;
        finished = true;
        updateActualPositionOfCubiesWhenDoneAnimating();
      }
    }
  }

  private void updateActualPositionOfCubiesWhenDoneAnimating() {
    if (abs(indexOfTheZaxisToBeTurned) > 0) { //technically the middle rows of the cube aka 0 doesn't turn
      turnZ(indexOfTheZaxisToBeTurned, direction);
    } else if (abs(indexOfTheXaxisToBeTurned) > 0) {
      turnX(indexOfTheXaxisToBeTurned, direction);
    } else if (abs(indexOfTheYaxisToBeTurned) > 0) {
      turnY(indexOfTheYaxisToBeTurned, direction);
    }
  }
}
