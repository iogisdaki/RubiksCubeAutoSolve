import peasy.*;
PeasyCam cam;//PeasyCam provides mouse-driven camera

//---------------change me if you like -------------------
float speed = 0.1;
//--------------------------------------------------------

int standardAlgorithmMoveIndexCounter = 0;
int standardAlgorithmIndex = 0;
int currentCubeIndexCounter = 0;
int shuffleMoveIndex = 0;

Cubie[] currentLayerCubies = new Cubie[4];
boolean currentLayerCubiesSolved[] = new boolean[4];
boolean userAllowedToEnterInput = true;
boolean solved = true;
String state;

Move currentMove;

WhiteDaisy whiteDaisy = new WhiteDaisy();
WhiteCross whiteCross = new WhiteCross();
WhiteCorners whiteCorners = new WhiteCorners();
SecondLayer secondLayer = new SecondLayer();
YellowCross yellowCross = new YellowCross();
YellowEdges yellowEdges = new YellowEdges();
YellowCornerCubies yellowCornerCubies = new YellowCornerCubies();
YellowCornerFaces yellowCornerFaces = new YellowCornerFaces();

void setup() {
  size(700, 700, P3D);//3D renderer
  cam = new PeasyCam(this, 400);
  initializeCubiePositionMatrix();
  makeRandomMoveSequence();
  setFirstMove();
  print("press space to suffle\n");
  print("press s to solve\n\n\n\n");
}

void draw() {
  noFill();
  background(51);
  scale(50);//to scale the cube according to the size of the screen

  currentMove.update();

  if (currentMove.finished()) {
    switch(state) {
    case "shuffleStarted":
      shuffleCube();
      break;
    case "daisyStarted":
      whiteDaisy.solve();
      break;
    case "whiteCrossStarted":
      whiteCross.solve();
      break;
    case "whiteCornersStarted":
      whiteCorners.solve();
      break;
    case "secondLayerStarted":
      secondLayer.solve();
      break;
    case "yellowCrossStarted":
      yellowCross.solve();
      break;
    case "yellowEdgesStarted":
      yellowEdges.solve();
      break;
    case "yellowCornersCubiesStarted":
      yellowCornerCubies.solve();
      break;
    case "yellowCornersFacesStarted":
      yellowCornerFaces.solve();
      break;
    }
  }
  animateTurns();
}

void animateTurns() {
  for (int i = 0; i < cube.length; i++) {
    push();
    if (abs(cube[i].z) > 0 && cube[i].z == currentMove.indexOfTheZaxisToBeTurned) {
      rotateZ(currentMove.angle);
    } else if (abs(cube[i].x) > 0 && cube[i].x == currentMove.indexOfTheXaxisToBeTurned) {
      rotateX(currentMove.angle);
    } else if (abs(cube[i].y) > 0 && cube[i].y == currentMove.indexOfTheYaxisToBeTurned) {
      rotateY(-currentMove.angle);//y is flipped
    }
    cube[i].show();
    pop();
  }
}

void setFirstMove() {
  currentMove = sequence.get(shuffleMoveIndex);
}

void setArrayToFalse(boolean array[]) {
  for (int i = 0; i < array.length; i++) {
    array[i] = false;
  }
}

boolean allCubesOfThisLayerDone() {
  return (currentCubeIndexCounter == 4);
}

void setParamsForMovingToTheNextCubie() {
  standardAlgorithmIndex = 0;
  standardAlgorithmMoveIndexCounter = 0;
  currentCubeIndexCounter++;
}

boolean thereAreUnsolvedCubiesInThisLayer() {
  return (!currentLayerCubiesSolved[0] || !currentLayerCubiesSolved[1]|| !currentLayerCubiesSolved[2] || !currentLayerCubiesSolved[3]);
}

int bolleantoInt(boolean bool) {
  if (bool == true)
    return 1;
  else
    return 0;
}

boolean oneOrTwoCubiesSolved() {
  return ((bolleantoInt(currentLayerCubiesSolved[0]) + bolleantoInt(currentLayerCubiesSolved[1]) + bolleantoInt(currentLayerCubiesSolved[2]) + bolleantoInt(currentLayerCubiesSolved[3])) < 2);
}

void setCurrentLayerCubies(Cubie[] passedCurrentLayerCubiesArray) {
  for (int i = 0; i < 4; i++) {
    currentLayerCubies[i] = passedCurrentLayerCubiesArray[i];
  }
}

void setToSolved(Cubie cubie) {
  if (cubie == currentLayerCubies[0]) {
    currentLayerCubiesSolved[0] = true;
  } else if (cubie == currentLayerCubies[1]) {
    currentLayerCubiesSolved[1] = true;
  } else if (cubie == currentLayerCubies[2]) {
    currentLayerCubiesSolved[2] = true;
  } else {
    currentLayerCubiesSolved[3] = true;
  }
}

boolean isSolved(Cubie cubie) {
  if (cubie == currentLayerCubies[0]) {
    return currentLayerCubiesSolved[0];
  } else if (cubie == currentLayerCubies[1]) {
    return currentLayerCubiesSolved[1];
  } else if (cubie == currentLayerCubies[2]) {
    return currentLayerCubiesSolved[2];
  } else {
    return currentLayerCubiesSolved[3];
  }
}

void setParamsForNextLayer() {
  currentCubeIndexCounter = 0;
  standardAlgorithmIndex = 0;
  standardAlgorithmMoveIndexCounter = 0;
}
