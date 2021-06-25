//second layer
//looking at the second layer edges and then
//if they're stuck in the middle layer (y = 0) in the wrong position move them up
//if they're in the top layer turn until its on the right position according to the colour of its two faces and
//if it needs to go the the right side: turn up left, then righy alg, turn cube left and do lefty alg from that perspective
//if it needs to go the the left side: turn up right, then lefty alg, turn cube right and do righty alg from that perspective
//if its solved move on to the next cubie

class SecondLayer {
  void solve() {

    Cubie[] secondLayerCubies = {redBlueEdge, redGreenEdge, orangeBlueEdge, orangeGreenEdge};

    setCurrentLayerCubies(secondLayerCubies);
    setArrayToFalse(currentLayerCubiesSolved);
    checkForSecondLayerCubiesAlreadyInTheRightPosition();

    if (!allCubesOfThisLayerDone()) {
      if (standardAlgorithmIndex == 0) {
        standardAlgorithmMoveIndexCounter = 0;

        Cubie currentCubieGettingChecked = secondLayerCubies[currentCubeIndexCounter];

        int x = currentCubieGettingChecked.x;
        int y = currentCubieGettingChecked.y;
        int z = currentCubieGettingChecked.z;

        if (!isSolved(currentCubieGettingChecked)) {
          if (y == 0) {//if a edge is stuck on the middle move it up
            if (x == -1 && z == -1) {
              standardAlgorithmIndex = 3;
            } else if (x == -1 && z == 1) {
              standardAlgorithmIndex = 5;
            } else if (x == 1 && z == -1) {
              standardAlgorithmIndex = 21;
            } else if (x == 1 && z == 1) {
              standardAlgorithmIndex = 23;
            }
          } else if (y == -1) {//if the cubie is on the top move it to the right position and the do righty alg until solved
            if (x == 0 && z == -1) {//1
              if (currentCubieGettingChecked == redBlueEdge) {
                if (redBlueEdge.blueFace.normal.x == 0 && redBlueEdge.blueFace.normal.y == 0 && redBlueEdge.blueFace.normal.z == -1) {//it needs to go to the right
                  standardAlgorithmIndex = 3;
                } else {
                  doMove(turnTopRowRight);
                }
              } else if (currentCubieGettingChecked == redGreenEdge) {
                doMove(turnTopRowRight);
              } else if (currentCubieGettingChecked == orangeBlueEdge) {
                if (orangeBlueEdge.blueFace.normal.x == 0 && orangeBlueEdge.blueFace.normal.y == 0 && orangeBlueEdge.blueFace.normal.z == -1) {//it needs to go to the left
                  standardAlgorithmIndex = 211;
                } else {
                  doMove(turnTopRowLeft);
                }
              } else if (currentCubieGettingChecked == orangeGreenEdge) {
                doMove(turnTopRowRight);
              }
            } else if (x == -1 && z == 0) {//2
              if (currentCubieGettingChecked == redBlueEdge) {
                if (redBlueEdge.redFace.normal.x == -1 && redBlueEdge.redFace.normal.y == 0 && redBlueEdge.redFace.normal.z == 0) {//it needs to go to the left
                  standardAlgorithmIndex = 31;
                } else {
                  doMove(turnTopRowLeft);
                }
              } else if (currentCubieGettingChecked == redGreenEdge) {
                if (redGreenEdge.redFace.normal.x == -1 && redGreenEdge.redFace.normal.y == 0 && redGreenEdge.redFace.normal.z == 0) {//it needs to go to the right
                  standardAlgorithmIndex = 5;
                } else {
                  doMove(turnTopRowRight);
                }
              } else if (currentCubieGettingChecked == orangeBlueEdge) {
                doMove(turnTopRowRight);
              } else if (currentCubieGettingChecked == orangeGreenEdge) {
                doMove(turnTopRowRight);
              }
            } else if (x == 1 && z == 0) {//3
              if (currentCubieGettingChecked == redBlueEdge) {
                doMove(turnTopRowRight);
              } else if (currentCubieGettingChecked == redGreenEdge) {
                doMove(turnTopRowRight);
              } else if (currentCubieGettingChecked == orangeBlueEdge) {
                if (orangeBlueEdge.orangeFace.normal.x == 1 && orangeBlueEdge.orangeFace.normal.y == 0 && orangeBlueEdge.orangeFace.normal.z == 0) {//it needs to go to the right
                  standardAlgorithmIndex = 21;
                } else {
                  doMove(turnTopRowRight);
                }
              } else if (currentCubieGettingChecked == orangeGreenEdge) {
                if (orangeGreenEdge.orangeFace.normal.x == 1 && orangeGreenEdge.orangeFace.normal.y == 0 && orangeGreenEdge.orangeFace.normal.z == 0) {//it needs to go to the left
                  standardAlgorithmIndex = 231;
                } else {
                  doMove(turnTopRowLeft);
                }
              }
            } else if (x == 0 && z == 1) {//4
              if (currentCubieGettingChecked == redBlueEdge) {
                doMove(turnTopRowRight);
              } else if (currentCubieGettingChecked == redGreenEdge) {
                if (redGreenEdge.greenFace.normal.x == 0 && redGreenEdge.greenFace.normal.y == 0 && redGreenEdge.greenFace.normal.z == 1) {//it needs to go to the left
                  standardAlgorithmIndex = 51;
                } else {
                  doMove(turnTopRowLeft);
                }
              } else if (currentCubieGettingChecked == orangeBlueEdge) {
                doMove(turnTopRowRight);
              } else if (currentCubieGettingChecked == orangeGreenEdge) {
                if (orangeGreenEdge.greenFace.normal.x == 0 && orangeGreenEdge.greenFace.normal.y == 0 && orangeGreenEdge.greenFace.normal.z == 1) {//it needs to go to the right
                  standardAlgorithmIndex = 23;
                } else {
                  doMove(turnTopRowRight);
                }
              }
            }
          }
        } else {
          currentCubeIndexCounter++;
        }
      } else if (standardAlgorithmIndex == 3) {
        if (currentMove.finished()) {
          Move[] movesSequence = {turnTopRowLeft, turnLeftRowDown, turnTopRowLeft, turnLeftRownUp, turnTopRowRight, turnBacktRowRight, turnTopRowRight, turnBackRowLeft, turnTopRowLeft};
          if (standardAlgorithmFinished()) {
            standardAlgorithmIndex = 0;
          } else {
            applyStandardAlgorithmMoves(movesSequence);
          }
        }
      } else if (standardAlgorithmIndex == 31) {
        if (currentMove.finished()) {
          Move[] movesSequence = {turnTopRowRight, turnBacktRowRight, turnTopRowRight, turnBackRowLeft, turnTopRowLeft, turnLeftRowDown, turnTopRowLeft, turnLeftRownUp, turnTopRowRight};
          if (standardAlgorithmFinished()) {
            standardAlgorithmIndex = 0;
          } else {
            applyStandardAlgorithmMoves(movesSequence);
          }
        }
      } else if (standardAlgorithmIndex == 5) {
        if (currentMove.finished()) {
          Move[] movesSequence = {turnTopRowLeft, turnFrontRowRight, turnTopRowLeft, turnFrontRowLeft, turnTopRowRight, turnLeftRownUp, turnTopRowRight, turnLeftRowDown, turnTopRowLeft};
          if (standardAlgorithmFinished()) {
            standardAlgorithmIndex = 0;
          } else {
            applyStandardAlgorithmMoves(movesSequence);
          }
        }
      } else if (standardAlgorithmIndex == 51) {
        if (currentMove.finished()) {
          Move[] movesSequence = {turnTopRowRight, turnLeftRownUp, turnTopRowRight, turnLeftRowDown, turnTopRowLeft, turnFrontRowRight, turnTopRowLeft, turnFrontRowLeft, turnTopRowRight};
          if (standardAlgorithmFinished()) {
            standardAlgorithmIndex = 0;
          } else {
            applyStandardAlgorithmMoves(movesSequence);
          }
        }
      } else if (standardAlgorithmIndex == 21) {
        if (currentMove.finished()) {
          Move[] movesSequence = {turnTopRowLeft, turnBackRowLeft, turnTopRowLeft, turnBacktRowRight, turnTopRowRight, turnRightRowDown, turnTopRowRight, turnRightRowUp, turnTopRowLeft};
          if (standardAlgorithmFinished()) {
            standardAlgorithmIndex = 0;
          } else {
            applyStandardAlgorithmMoves(movesSequence);
          }
        }
      } else if (standardAlgorithmIndex == 211) {
        if (currentMove.finished()) {
          Move[] movesSequence = {turnTopRowRight, turnRightRowDown, turnTopRowRight, turnRightRowUp, turnTopRowLeft, turnBackRowLeft, turnTopRowLeft, turnBacktRowRight, turnTopRowRight};
          if (standardAlgorithmFinished()) {
            standardAlgorithmIndex = 0;
          } else {
            applyStandardAlgorithmMoves(movesSequence);
          }
        }
      } else if (standardAlgorithmIndex == 23) {
        if (currentMove.finished()) {
          Move[] movesSequence = {turnTopRowLeft, turnRightRowUp, turnTopRowLeft, turnRightRowDown, turnTopRowRight, turnFrontRowLeft, turnTopRowRight, turnFrontRowRight, turnTopRowLeft};
          if (standardAlgorithmFinished()) {
            standardAlgorithmIndex = 0;
          } else {
            applyStandardAlgorithmMoves(movesSequence);
          }
        }
      } else if (standardAlgorithmIndex == 231) {
        if (currentMove.finished()) {
          Move[] movesSequence = {turnTopRowRight, turnFrontRowLeft, turnTopRowRight, turnFrontRowRight, turnTopRowLeft, turnRightRowUp, turnTopRowLeft, turnRightRowDown, turnTopRowRight};
          if (standardAlgorithmFinished()) {
            standardAlgorithmIndex = 0;
          } else {
            applyStandardAlgorithmMoves(movesSequence);
          }
        }
      }
    } else {
      setParamsForNextLayer();
      state = "yellowCrossStarted";
      print("second layer done\n");
      print("doing yellow cross...");
    }
  }

  private void checkForSecondLayerCubiesAlreadyInTheRightPosition() {
    if (redBlueEdge.x == -1 && redBlueEdge.y == 0 && redBlueEdge.z == -1 && redBlueEdge.redFace.normal.x == -1 && redBlueEdge.redFace.normal.y == 0 && redBlueEdge.redFace.normal.z == 0 && redBlueEdge.blueFace.normal.x == 0 && redBlueEdge.blueFace.normal.y == 0 && redBlueEdge.blueFace.normal.z == -1) {
      setToSolved(redBlueEdge);
    }
    if (redGreenEdge.x == -1 && redGreenEdge.y == 0 && redGreenEdge.z == 1 && redGreenEdge.redFace.normal.x == -1 && redGreenEdge.redFace.normal.y == 0 && redGreenEdge.redFace.normal.z == 0 && redGreenEdge.greenFace.normal.x == 0 && redGreenEdge.greenFace.normal.y == 0 && redGreenEdge.greenFace.normal.z == 1) {
      setToSolved(redGreenEdge);
    }
    if (orangeBlueEdge.x == 1 && orangeBlueEdge.y == 0 && orangeBlueEdge.z == -1 && orangeBlueEdge.orangeFace.normal.x == 1 && orangeBlueEdge.orangeFace.normal.y == 0 && orangeBlueEdge.orangeFace.normal.z == 0 && orangeBlueEdge.blueFace.normal.x == 0 && orangeBlueEdge.blueFace.normal.y == 0 && orangeBlueEdge.blueFace.normal.z == -1) {
      setToSolved(orangeBlueEdge);
    }
    if (orangeGreenEdge.x == 1 && orangeGreenEdge.y == 0 && orangeGreenEdge.z == 1 && orangeGreenEdge.orangeFace.normal.x == 1 && orangeGreenEdge.orangeFace.normal.y == 0 && orangeGreenEdge.orangeFace.normal.z == 0 && orangeGreenEdge.greenFace.normal.x == 0 && orangeGreenEdge.greenFace.normal.y == 0 && orangeGreenEdge.greenFace.normal.z == 1) {
      setToSolved(orangeGreenEdge);
    }
  }

  private boolean standardAlgorithmFinished() {
    return standardAlgorithmMoveIndexCounter > 8;
  }
}
