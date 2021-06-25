class Cubie {
  PMatrix3D matrixOfCubiePositions;
  int x = 0;
  int y = 0;
  int z = 0;

  Face blueFace = new Face(new PVector(0, 0, -1), color(0, 0, 255)); //blue for back
  Face greenFace = new Face(new PVector(0, 0, 1), color(0, 255, 0)); //green for front
  //y axis is flipped
  Face whiteFace = new Face(new PVector(0, 1, 0), color(255, 255, 255)); //white for bottom
  Face yellowFace = new Face(new PVector(0, -1, 0), color(255, 255, 0)); //yellow for up
  Face orangeFace = new Face(new PVector(1, 0, 0), color(255, 150, 0)); //orange for right
  Face redFace = new Face(new PVector(-1, 0, 0), color(255, 0, 0)); //red for left

  private Face[] faces = {
    blueFace,
    greenFace,
    whiteFace,
    yellowFace,
    orangeFace,
    redFace
  };

  Cubie(PMatrix3D matrixOfCubiePositions, int x, int y, int z) {
    this.matrixOfCubiePositions = matrixOfCubiePositions;
    this.x = x;
    this.y = y;
    this.z = z;
  }

  void turnfacesOfZAxisCubies(int direction) {
    for (Face face : faces) {
      face.changeNormalOfFacesForZAxis(direction * HALF_PI);
    }
  }

  void turnfacesOfYAxisCubies(int direction) {
    for (Face face : faces) {
      face.changeNormalOfFacesForYAxis(direction * HALF_PI);
    }
  }

  void turnfacesOfXAxisCubies(int direction) {
    for (Face face : faces) {
      face.changeNormalOfFacesForXAxis(direction * HALF_PI);
    }
  }

  void update(int x, int y, int z) {
    matrixOfCubiePositions.reset();
    matrixOfCubiePositions.translate(x, y, z);
    this.x = x;
    this.y = y;
    this.z = z;
  }

  void show() {
    noFill();
    stroke(0);
    strokeWeight(0.05);
    pushMatrix();
    applyMatrix(matrixOfCubiePositions);
    box(1);
    for (Face face : faces) {
      face.show();
    }
    popMatrix();
  }
}
