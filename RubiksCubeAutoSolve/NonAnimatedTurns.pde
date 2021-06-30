//turn front-back
void turnZ(int indexOfTheZaxisToBeTurned, int directionToTurn) {
  for (int i = 0; i < cube.length; i++) {
    Cubie cubie = cube[i];
    if (cubie.z == indexOfTheZaxisToBeTurned) {
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(directionToTurn * HALF_PI);
      matrix.translate(cubie.x, cubie.y);
      //m is a one-dimensional array of the matrix’s elements in column-major order.
      //https://www.youtube.com/watch?v=EGmVulED_4M&t=879s
      cubie.update(round(matrix.m02), round(matrix.m12), round(cubie.z));
      cubie.turnfacesOfZAxisCubies(directionToTurn);
    }
  }
  updateCubeNames();
}

//turn up-down
void turnY(int indexOfTheYaxisToBeTurned, int directionToTurn) {
  for (int i = 0; i < cube.length; i++) {
    Cubie cubie = cube[i];
    if (cubie.y == indexOfTheYaxisToBeTurned) {
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(directionToTurn * HALF_PI);
      matrix.translate(cubie.x, cubie.z);
      cubie.update(round(matrix.m02), round(cubie.y), round(matrix.m12));
      cubie.turnfacesOfYAxisCubies(directionToTurn);
    }
  }
  updateCubeNames();
}

//turn right-left
void turnX(int indexOfTheXaxisToBeTurned, int directionToTurn) {
  for (int i = 0; i < cube.length; i++) {
    Cubie cubie = cube[i];
    if (cubie.x == indexOfTheXaxisToBeTurned) {
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(directionToTurn * HALF_PI);
      matrix.translate(cubie.y, cubie.z);
      cubie.update(round(cubie.x), round(matrix.m02), round(matrix.m12));
      cubie.turnfacesOfXAxisCubies(directionToTurn);
    }
  }
  updateCubeNames();
}
