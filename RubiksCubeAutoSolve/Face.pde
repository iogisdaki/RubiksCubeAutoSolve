class Face {
  PVector normal; //a vector that points perpendicular to the face
  color colour;

  Face(PVector normal, color colour) {
    this.normal = normal;
    this.colour = colour;
  }

  void changeNormalOfFacesForZAxis(float angle) {
    PVector vector = new PVector();
    vector.x = round(normal.x * cos(angle) - normal.y * sin(angle));
    vector.y = round(normal.x * sin(angle) + normal.y * cos(angle));
    vector.z = round(normal.z);
    normal = vector;
  }

  void changeNormalOfFacesForYAxis(float angle) {
    PVector vector = new PVector();
    vector.x = round(normal.x * cos(angle) - normal.z * sin(angle));
    vector.z = round(normal.x * sin(angle) + normal.z * cos(angle));
    vector.y = round(normal.y);
    normal = vector;
  }

  void changeNormalOfFacesForXAxis(float angle) {
    PVector vector = new PVector();
    vector.y = round(normal.y * cos(angle) - normal.z * sin(angle));
    vector.z = round(normal.y * sin(angle) + normal.z * cos(angle));
    vector.x = round(normal.x);
    normal = vector;
  }

  void show() {
    pushMatrix();
    fill(colour);
    noStroke();
    //fixing the position of the squares of colours for the faces
    rectMode(CENTER);
    rotate(HALF_PI, normal.x, normal.y, normal.z);
    translate(0.5 * normal.x, 0.5 * normal.y, 0.5 * normal.z);
    if (abs(normal.x) > 0) { //along the x axis there needs to be a y rotation for the squares of colours for each cubie cause everything is drawn forward
      rotateY(HALF_PI);
    } else if (abs(normal.y) > 0) { //and along the y axis there needs to be a x rotation
      rotateX(HALF_PI);
    }
    square(0, 0, 1);
    popMatrix();
  }
}
