//yellow cross
//look if the yellow cross is already solved
//it doesn't matter about the cubie's second colour
//if not there are three cases
//if no yellow edges in the right possition do front to the right, righty alg, front to the left
//if only two yellow edges forming an l shape  are correct then turn the top accordingly until the one yellow cube is on the back and one is on the left and do the same algorithm
//if only two yellow edges forming a line shape are correct then turn the top so that the line is horizontal, not vertical and do the same algorithm

class YellowCross {
  void solve() {

    Cubie[] yellowEdges = {redYellowEdge, yellowBlueEdge, yellowGreenEdge, orangeYellowEdge};

    setCurrentLayerCubies(yellowEdges);
    setArrayToFalse(currentLayerCubiesSolved);
    checkForYellowEdgesAlreadyFacingUp();

    if (thereAreUnsolvedCubiesInThisLayer()) {
      if (standardAlgorithmIndex == 0) {

        standardAlgorithmMoveIndexCounter = 0;

        //there are three cases
        //no edges solved
        //l shaped eges solved
        //line solved

        //no or 1 egdes
        if (oneOrTwoCubiesSolved()) {
          standardAlgorithmIndex = 1;
        }
        //l shaped
        else if (isSolved(redYellowEdge) && isSolved(yellowBlueEdge) && !isSolved(yellowGreenEdge) && !isSolved(orangeYellowEdge)) {
          standardAlgorithmIndex = 1;
        } else if (isSolved(redYellowEdge) && isSolved(orangeYellowEdge) && !isSolved(yellowGreenEdge) && !isSolved(yellowBlueEdge)) {
          doMove(turnTopRowLeft);
        } else if (isSolved(yellowBlueEdge) && isSolved(yellowGreenEdge) && !isSolved(redYellowEdge) && !isSolved(orangeYellowEdge)) {
          doMove(turnTopRowRight);
        } else if (isSolved(yellowGreenEdge) && isSolved(orangeYellowEdge) && !isSolved(redYellowEdge) && !isSolved(yellowBlueEdge)) {
          doMove(turnTopRowRight);
        }
        //line solved
        else if ((isSolved(redYellowEdge) && isSolved(yellowGreenEdge) && !isSolved(yellowBlueEdge) && !isSolved(orangeYellowEdge))||(isSolved(redYellowEdge) && isSolved(yellowGreenEdge) && isSolved(yellowBlueEdge) && !isSolved(orangeYellowEdge))||(isSolved(redYellowEdge) && isSolved(yellowGreenEdge) && !isSolved(yellowBlueEdge) && isSolved(orangeYellowEdge))) {
          standardAlgorithmIndex = 1;
        } else if ((isSolved(yellowBlueEdge) && isSolved(orangeYellowEdge) && !isSolved(redYellowEdge) && !isSolved(yellowGreenEdge))||(isSolved(redYellowEdge) && isSolved(yellowGreenEdge) && isSolved(yellowBlueEdge) && !isSolved(orangeYellowEdge))||(isSolved(redYellowEdge) && isSolved(yellowGreenEdge) && !isSolved(yellowBlueEdge) && isSolved(orangeYellowEdge))) {
          doMove(turnTopRowRight);
        }
      } else if (standardAlgorithmIndex == 1) {
        if (currentMove.finished()) {
          Move[] movesSequence = {turnFrontRowRight, turnRightRowUp, turnTopRowLeft, turnRightRowDown, turnTopRowRight, turnFrontRowLeft};
          if (standardAlgorithmFinished()) {
            standardAlgorithmIndex = 0;
          } else {
            applyStandardAlgorithmMoves(movesSequence);
          }
        }
      }
    } else {
      setParamsForNextLayer();
      state = "yellowEdgesStarted";
      print("yellow cross done\n");
      print("doing yellow edges...");
    }
  }

  private void checkForYellowEdgesAlreadyFacingUp() {
    Cubie[] yellowEdges = {redYellowEdge, yellowBlueEdge, yellowGreenEdge, orangeYellowEdge};
    for (int counter = 0; counter < 4; counter++) {
      if (yellowEdges[counter].x == -1 && yellowEdges[counter].y == -1 && yellowEdges[counter].z == 0 && yellowEdges[counter].yellowFace.normal.x == 0 && yellowEdges[counter].yellowFace.normal.y == -1 && yellowEdges[counter].yellowFace.normal.z == 0) {
        setToSolved(redYellowEdge);
      }
      if (yellowEdges[counter].x == 0 && yellowEdges[counter].y == -1 && yellowEdges[counter].z == -1 && yellowEdges[counter].yellowFace.normal.x == 0 && yellowEdges[counter].yellowFace.normal.y == -1 && yellowEdges[counter].yellowFace.normal.z == 0) {
        setToSolved(yellowBlueEdge);
      }
      if (yellowEdges[counter].x == 1 && yellowEdges[counter].y == -1 && yellowEdges[counter].z == 0 && yellowEdges[counter].yellowFace.normal.x == 0 && yellowEdges[counter].yellowFace.normal.y == -1 && yellowEdges[counter].yellowFace.normal.z == 0 ) {
        setToSolved(yellowGreenEdge);
      }
      if (yellowEdges[counter].x == 0 && yellowEdges[counter].y == -1 && yellowEdges[counter].z == 1 && yellowEdges[counter].yellowFace.normal.x == 0 && yellowEdges[counter].yellowFace.normal.y == -1 && yellowEdges[counter].yellowFace.normal.z == 0) {
        setToSolved(orangeYellowEdge);
      }
    }
  }

  private boolean standardAlgorithmFinished() {
    return standardAlgorithmMoveIndexCounter > 5;
  }
}
