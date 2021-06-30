//yellow corner faces
//turn cube upside down and work from that perspective
//hold a cubie on the front right and check if its normal is correct(if yellow is in the bottom facing downward)
//if not do righy alg until its solved
//then move the bottom to the right so the next cube appears on the front right and repeat the same for all 4 cubies until they are solved

class YellowCornerFaces extends SolutionAlgorithm{
  void solve() {

    if (inThisLayerForTheFirstTime()) {
      setArrayToFalse(currentLayerCubiesSolved);
      checkForYellowCornerFacesAlreadyFacingUp();
    }
    if (!allCubesOfThisLayerDone()) {
      if (standardAlgorithmIndex == 0) {

        Cubie[] yellowCorners = {redYellowBlueCorner, redYellowGreenCorner, orangeYellowBlueCorner, orangeYellowGreenCorner};
        Cubie currentCubieGettingChecked = yellowCorners[currentCubeIndexCounter];
        standardAlgorithmMoveIndexCounter = 0;

        if (!isSolved(currentCubieGettingChecked)) {
          standardAlgorithmIndex = 1;
        } else {
          doMove(turnTopRowLeft);
          currentCubeIndexCounter++;
        }
      } else if (standardAlgorithmIndex == 1) {
        if (currentMove.finished()) {
          Move[] movesSequence = {turnLeftRowDown, turnBottomRowRight, turnLeftRownUp, turnBottomRowLeft};
          if (standardAlgorithmFinished()) {
            if (currentCubeIndexCounter == 3 && redYellowBlueCorner.yellowFace.normal.x == 0 && redYellowBlueCorner.yellowFace.normal.y == -1 && redYellowBlueCorner.yellowFace.normal.z == 0 && redYellowBlueCorner.redFace.normal.x == 0 && redYellowBlueCorner.redFace.normal.y == 0 && redYellowBlueCorner.redFace.normal.z == 1 && redYellowBlueCorner.blueFace.normal.x == -1 && redYellowBlueCorner.blueFace.normal.y == 0 && redYellowBlueCorner.blueFace.normal.z == 0) {//yellow red blue
              setToSolved(orangeYellowGreenCorner);
              currentCubeIndexCounter++;
              doMove(turnTopRowLeft);
            }
            if (currentCubeIndexCounter == 0 && redYellowGreenCorner.yellowFace.normal.x == 0 && redYellowGreenCorner.yellowFace.normal.y == -1 && redYellowGreenCorner.yellowFace.normal.z == 0 && redYellowGreenCorner.redFace.normal.x == -1 && redYellowGreenCorner.redFace.normal.y == 0 && redYellowGreenCorner.redFace.normal.z == 0 && redYellowGreenCorner.greenFace.normal.x == 0 && redYellowGreenCorner.greenFace.normal.y == 0 && redYellowGreenCorner.greenFace.normal.z == 1) {//yellow red green
              setToSolved(redYellowBlueCorner);
              currentCubeIndexCounter++;
              doMove(turnTopRowLeft);
            }
            if (currentCubeIndexCounter == 2 && orangeYellowBlueCorner.yellowFace.normal.x == 0 && orangeYellowBlueCorner.yellowFace.normal.y == -1 && orangeYellowBlueCorner.yellowFace.normal.z == 0 && orangeYellowBlueCorner.orangeFace.normal.x == -1 && orangeYellowBlueCorner.orangeFace.normal.y == 0 && orangeYellowBlueCorner.orangeFace.normal.z == 0 && orangeYellowBlueCorner.blueFace.normal.x == 0 && orangeYellowBlueCorner.blueFace.normal.y == 0 && orangeYellowBlueCorner.blueFace.normal.z == 1) {//yellow orange blue
              setToSolved(orangeYellowBlueCorner);
              currentCubeIndexCounter++;
              doMove(turnTopRowLeft);
            }
            if (currentCubeIndexCounter == 1 && orangeYellowGreenCorner.yellowFace.normal.x == 0 && orangeYellowGreenCorner.yellowFace.normal.y == -1 && orangeYellowGreenCorner.yellowFace.normal.z == 0 && orangeYellowGreenCorner.orangeFace.normal.x == 0 && orangeYellowGreenCorner.orangeFace.normal.y == 0 && orangeYellowGreenCorner.orangeFace.normal.z == 1 && orangeYellowGreenCorner.greenFace.normal.x == -1 && orangeYellowGreenCorner.greenFace.normal.y == 0 && orangeYellowGreenCorner.greenFace.normal.z == 0) {//yellow orange green
              setToSolved(redYellowGreenCorner);
              currentCubeIndexCounter++;
              doMove(turnTopRowLeft);
            }
            standardAlgorithmIndex = 0;
          } else {
            applyStandardAlgorithmMoves(movesSequence);
          }
        }
      }
    } else {
      setParamsForNextLayer();
      print("yellow corner faces done\n");
      if (topRowColoursNotAligned()) {
        doMove(turnTopRowLeft);
      }
      print("cube done :)\n\n\n\n");
      userAllowedToEnterInput = false;
      solved = true;
      state = "";
    }
  }

  private void checkForYellowCornerFacesAlreadyFacingUp() {
    if (redYellowBlueCorner.yellowFace.normal.x == 0 && redYellowBlueCorner.yellowFace.normal.y == -1 && redYellowBlueCorner.yellowFace.normal.z == 0 && redYellowBlueCorner.redFace.normal.x == -1 && redYellowBlueCorner.redFace.normal.y == 0 && redYellowBlueCorner.redFace.normal.z == 0 && redYellowBlueCorner.blueFace.normal.x == 0 && redYellowBlueCorner.blueFace.normal.y == 0 && redYellowBlueCorner.blueFace.normal.z == -1) {//yellow red blue
      setToSolved(orangeYellowGreenCorner);
    }
    if (redYellowGreenCorner.yellowFace.normal.x == 0 && redYellowGreenCorner.yellowFace.normal.y == -1 && redYellowGreenCorner.yellowFace.normal.z == 0 && redYellowGreenCorner.redFace.normal.x == -1 && redYellowGreenCorner.redFace.normal.y == 0 && redYellowGreenCorner.redFace.normal.z == 0 && redYellowGreenCorner.greenFace.normal.x == 0 && redYellowGreenCorner.greenFace.normal.y == 0 && redYellowGreenCorner.greenFace.normal.z == 1) {//yellow red green
      setToSolved(redYellowBlueCorner);
    }
    if (orangeYellowBlueCorner.yellowFace.normal.x == 0 && orangeYellowBlueCorner.yellowFace.normal.y == -1 && orangeYellowBlueCorner.yellowFace.normal.z == 0 && orangeYellowBlueCorner.orangeFace.normal.x == 1 && orangeYellowBlueCorner.orangeFace.normal.y == 0 && orangeYellowBlueCorner.orangeFace.normal.z == 0 && orangeYellowBlueCorner.blueFace.normal.x == 0 && orangeYellowBlueCorner.blueFace.normal.y == 0 && orangeYellowBlueCorner.blueFace.normal.z == -1) {//yellow orange blue
      setToSolved(orangeYellowBlueCorner);
    }
    if (orangeYellowGreenCorner.yellowFace.normal.x == 0 && orangeYellowGreenCorner.yellowFace.normal.y == -1 && orangeYellowGreenCorner.yellowFace.normal.z == 0 && orangeYellowGreenCorner.orangeFace.normal.x == 1 && orangeYellowGreenCorner.orangeFace.normal.y == 0 && orangeYellowGreenCorner.orangeFace.normal.z == 0 && orangeYellowGreenCorner.greenFace.normal.x == 0 && orangeYellowGreenCorner.greenFace.normal.y == 0 && orangeYellowGreenCorner.greenFace.normal.z == 1) {//yellow orange green
      setToSolved(redYellowGreenCorner);
    }
  }

  private boolean inThisLayerForTheFirstTime() {
    return currentCubeIndexCounter == 0;
  }

  private boolean topRowColoursNotAligned() {
    return (redYellowEdge.redFace.normal.x == 0 && redYellowEdge.redFace.normal.y == 0 && redYellowEdge.redFace.normal.z == 1);
  }

  private boolean standardAlgorithmFinished() {
    return standardAlgorithmMoveIndexCounter > 3;
  }
}
