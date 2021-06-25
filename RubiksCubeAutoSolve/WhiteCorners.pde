//white corners
//looking where each white corner is and then:
//if its on the bottom, move up using the righty alg
//if its on the top, move it to the right position using the righty alg again
//when its finished every corner will be on the right position according to its other two colours and its white face will be facing downwards

class WhiteCorners {
  void solve() {

    Cubie[] whiteCorners = {redWhiteBlueCorner, redWhiteGreenCorner, orangeWhiteBlueCorner, orangeWhiteGreenCorner};

    setCurrentLayerCubies(whiteCorners);

    if (thereAreUnsolvedCubiesInThisLayer()) {
      if (standardAlgorithmIndex == 0) {//not in standard algorithm loop

        standardAlgorithmMoveIndexCounter = 0;

        Cubie currentCubieGettingChecked = whiteCorners[currentCubeIndexCounter];

        int x = currentCubieGettingChecked.x;
        int y = currentCubieGettingChecked.y;
        int z = currentCubieGettingChecked.z;

        if (y == 1) {//if a corner is on the bottom move it up
          if (x == -1 && z == -1) {
            standardAlgorithmIndex = 1;
          } else if (x == -1 && z == 1) {
            standardAlgorithmIndex = 2;
          } else if (x == 1 && z == -1) {
            standardAlgorithmIndex = 3;
          } else if (x == 1 && z == 1) {
            standardAlgorithmIndex = 4;
          }
        } else if (y == -1) {//if a corner is on the top move it to the right position according to its other colours and the do righty alg until solved
          if (x == -1 && z == -1) {//if its in the correct position do righty alg
            if (currentCubieGettingChecked == redWhiteBlueCorner) {
              standardAlgorithmIndex = 6;
            } else if (currentCubieGettingChecked == redWhiteGreenCorner) {//1 //position not correct according to its two other colours so move top to the right until its in the same position before doing the righty alg
              doMove(turnTopRowRight);
            } else if (currentCubieGettingChecked == orangeWhiteBlueCorner) {
              doMove(turnTopRowLeft);
            } else if (currentCubieGettingChecked == orangeWhiteGreenCorner) {
              doMove(turnTopRowRight);
            }
          } else if (x == -1 && z == 1) {//2
            if (currentCubieGettingChecked == redWhiteBlueCorner) {
              doMove(turnTopRowLeft);
            } else if (currentCubieGettingChecked == redWhiteGreenCorner) {
              standardAlgorithmIndex = 8;
            } else if (currentCubieGettingChecked == orangeWhiteBlueCorner) {
              doMove(turnTopRowRight);
            } else if (currentCubieGettingChecked == orangeWhiteGreenCorner) {
              doMove(turnTopRowRight);
            }
          } else if (x == 1 && z == -1) {//3
            if (currentCubieGettingChecked == redWhiteBlueCorner) {
              doMove(turnTopRowRight);
            } else if (currentCubieGettingChecked == redWhiteGreenCorner) {
              doMove(turnTopRowRight);
            } else if (currentCubieGettingChecked == orangeWhiteBlueCorner) {
              standardAlgorithmIndex = 24;
            } else if (currentCubieGettingChecked == orangeWhiteGreenCorner) {
              doMove(turnTopRowLeft);
            }
          } else if (x == 1 && z == 1) {//4
            if (currentCubieGettingChecked == redWhiteBlueCorner) {
              doMove(turnTopRowRight);
            } else if (currentCubieGettingChecked == redWhiteGreenCorner) {
              doMove(turnTopRowLeft);
            } else if (currentCubieGettingChecked == orangeWhiteBlueCorner) {
              doMove(turnTopRowRight);
            } else if (currentCubieGettingChecked == orangeWhiteGreenCorner) {
              standardAlgorithmIndex = 26;
            }
          }
        }
      }
      //righty alg is different for every position because looking at it the axis are different
      else if (standardAlgorithmIndex == 1) {
        if (currentMove.finished()) {
          Move[] movesSequence = {turnLeftRowDown, turnTopRowLeft, turnLeftRownUp, turnTopRowRight};
          if (standardAlgorithmFinished()) {
            standardAlgorithmIndex = 0;
          } else {
            applyStandardAlgorithmMoves(movesSequence);
          }
        }
      } else if (standardAlgorithmIndex == 2) {
        if (currentMove.finished()) {
          Move[] movesSequence = {turnFrontRowRight, turnTopRowLeft, turnFrontRowLeft, turnTopRowRight};
          if (standardAlgorithmFinished()) {
            standardAlgorithmIndex = 0;
          } else {
            applyStandardAlgorithmMoves(movesSequence);
          }
        }
      } else if (standardAlgorithmIndex == 3) {
        if (currentMove.finished()) {
          Move[] movesSequence = {turnBackRowLeft, turnTopRowLeft, turnBacktRowRight, turnTopRowRight};
          if (standardAlgorithmFinished()) {
            standardAlgorithmIndex = 0;
          } else {
            applyStandardAlgorithmMoves(movesSequence);
          }
        }
      } else if (standardAlgorithmIndex == 4) {
        if (currentMove.finished()) {
          Move[] movesSequence = {turnRightRowUp, turnTopRowLeft, turnRightRowDown, turnTopRowRight};
          if (standardAlgorithmFinished()) {
            standardAlgorithmIndex = 0;
          } else {
            applyStandardAlgorithmMoves(movesSequence);
          }
        }
      } else if (standardAlgorithmIndex == 6) {
        if (currentMove.finished()) {
          Move[] movesSequence = {turnLeftRowDown, turnTopRowLeft, turnLeftRownUp, turnTopRowRight};
          if (standardAlgorithmFinished()) {
            standardAlgorithmMoveIndexCounter = 0;
          }
          if (redWhiteBlueCorner.x == -1 && redWhiteBlueCorner.y == 1 && redWhiteBlueCorner.z == -1 && redWhiteBlueCorner.redFace.normal.x == -1 && redWhiteBlueCorner.redFace.normal.y == 0 && redWhiteBlueCorner.redFace.normal.z == 0 && redWhiteBlueCorner.blueFace.normal.x == 0 && redWhiteBlueCorner.blueFace.normal.y == 0 && redWhiteBlueCorner.blueFace.normal.z == -1) {
            setParamsForMovingToTheNextCubie();
            setToSolved(redWhiteBlueCorner);
          } else {
            applyStandardAlgorithmMoves(movesSequence);
          }
        }
      } else if (standardAlgorithmIndex == 8) {
        if (currentMove.finished()) {
          Move[] movesSequence = {turnFrontRowRight, turnTopRowLeft, turnFrontRowLeft, turnTopRowRight};
          if (standardAlgorithmFinished()) {
            standardAlgorithmMoveIndexCounter = 0;
          }
          if (redWhiteGreenCorner.x == -1 && redWhiteGreenCorner.y == 1 && redWhiteGreenCorner.z == 1 && redWhiteGreenCorner.redFace.normal.x == -1 && redWhiteGreenCorner.redFace.normal.y == 0 && redWhiteGreenCorner.redFace.normal.z == 0 && redWhiteGreenCorner.greenFace.normal.x == 0 && redWhiteGreenCorner.greenFace.normal.y == 0 && redWhiteGreenCorner.greenFace.normal.z == 1) {
            setParamsForMovingToTheNextCubie();
            setToSolved(redWhiteGreenCorner);
          } else {
            applyStandardAlgorithmMoves(movesSequence);
          }
        }
      } else if (standardAlgorithmIndex == 24) {
        if (currentMove.finished()) {
          Move[] movesSequence = {turnBackRowLeft, turnTopRowLeft, turnBacktRowRight, turnTopRowRight};
          if (standardAlgorithmFinished()) {
            standardAlgorithmMoveIndexCounter = 0;
          }
          if (orangeWhiteBlueCorner.x == 1 && orangeWhiteBlueCorner.y == 1 && orangeWhiteBlueCorner.z == -1 && orangeWhiteBlueCorner.orangeFace.normal.x == 1 && orangeWhiteBlueCorner.orangeFace.normal.y == 0 && orangeWhiteBlueCorner.orangeFace.normal.z == 0 && orangeWhiteBlueCorner.blueFace.normal.x == 0 && orangeWhiteBlueCorner.blueFace.normal.y == 0 && orangeWhiteBlueCorner.blueFace.normal.z == -1) {
            setParamsForMovingToTheNextCubie();
            setToSolved(orangeWhiteBlueCorner);
          } else {
            applyStandardAlgorithmMoves(movesSequence);
          }
        }
      } else if (standardAlgorithmIndex == 26) {
        if (currentMove.finished()) {
          Move[] movesSequence = {turnRightRowUp, turnTopRowLeft, turnRightRowDown, turnTopRowRight};
          if (standardAlgorithmFinished()) {
            standardAlgorithmMoveIndexCounter = 0;
          }
          if (orangeWhiteGreenCorner.x == 1 && orangeWhiteGreenCorner.y == 1 && orangeWhiteGreenCorner.z == 1 && orangeWhiteGreenCorner.orangeFace.normal.x == 1 && orangeWhiteGreenCorner.orangeFace.normal.y == 0 && orangeWhiteGreenCorner.orangeFace.normal.z == 0 && orangeWhiteGreenCorner.greenFace.normal.x == 0 && orangeWhiteGreenCorner.greenFace.normal.y == 0 && orangeWhiteGreenCorner.greenFace.normal.z == 1) {
            setParamsForMovingToTheNextCubie();
            setToSolved(orangeWhiteGreenCorner);
          } else {
            applyStandardAlgorithmMoves(movesSequence);
          }
        }
      }
    } else {
      setParamsForNextLayer();
      state = "secondLayerStarted";
      print("white corners done\n");
      print("doing second layer...");
    }
  }

  private boolean standardAlgorithmFinished() {
    return standardAlgorithmMoveIndexCounter > 3;
  }
}
