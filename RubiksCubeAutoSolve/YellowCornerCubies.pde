//yellow corner cubies to the right place
//look how many corners are in the right place
//if theres only one the hold it so its on the front right and do the algorithm from that perspective
//if none are in the right spot do the algorithm from anywhere
//algorithm: up left, right up, up right, left up, up left, right down, up right, left down

class YellowCornerCubies {
  void solve() {

    Cubie[] yellowCorners = {redYellowBlueCorner, redYellowGreenCorner, orangeYellowBlueCorner, orangeYellowGreenCorner};

    setCurrentLayerCubies(yellowCorners);
    setArrayToFalse(currentLayerCubiesSolved);
    checkForYellowCornersAlreadyInTheRightPosition();

    if (thereAreUnsolvedCubiesInThisLayer()) {
      if (standardAlgorithmIndex == 0) {
        standardAlgorithmMoveIndexCounter = 0;
        if (thereAreNoSolvedYellowCornerCubies()) {
          standardAlgorithmIndex = 4;
        } else if (isSolved(redYellowBlueCorner)) {
          standardAlgorithmIndex = 1;
        } else if (isSolved(redYellowGreenCorner)) {
          standardAlgorithmIndex = 2;
        } else if (isSolved(orangeYellowBlueCorner)) {
          standardAlgorithmIndex = 3;
        } else if (isSolved(orangeYellowGreenCorner)) {
          standardAlgorithmIndex = 4;
        }
      } else if (standardAlgorithmIndex == 1) {
        if (currentMove.finished()) {
          Move[] movesSequence = {turnTopRowLeft, turnLeftRowDown, turnTopRowRight, turnRightRowDown, turnTopRowLeft, turnLeftRownUp, turnTopRowRight, turnRightRowUp};
          if (standardAlgorithmFinished()) {
            standardAlgorithmIndex = 0;
          } else {
            applyStandardAlgorithmMoves(movesSequence);
          }
        }
      } else if (standardAlgorithmIndex == 2) {
        if (currentMove.finished()) {
          Move[] movesSequence = {turnTopRowLeft, turnFrontRowRight, turnTopRowRight, turnBacktRowRight, turnTopRowLeft, turnFrontRowLeft, turnTopRowRight, turnBackRowLeft};
          if (standardAlgorithmFinished()) {
            standardAlgorithmIndex = 0;
          } else {
            applyStandardAlgorithmMoves(movesSequence);
          }
        }
      } else if (standardAlgorithmIndex == 3) {
        if (currentMove.finished()) {
          Move[] movesSequence = {turnTopRowLeft, turnBackRowLeft, turnTopRowRight, turnFrontRowLeft, turnTopRowLeft, turnBacktRowRight, turnTopRowRight, turnFrontRowRight};
          if (standardAlgorithmFinished()) {
            standardAlgorithmIndex = 0;
          } else {
            applyStandardAlgorithmMoves(movesSequence);
          }
        }
      } else if (standardAlgorithmIndex == 4) {
        if (currentMove.finished()) {
          Move[] movesSequence = {turnTopRowLeft, turnRightRowUp, turnTopRowRight, turnLeftRownUp, turnTopRowLeft, turnRightRowDown, turnTopRowRight, turnLeftRowDown};
          if (standardAlgorithmFinished()) {
            standardAlgorithmIndex = 0;
          } else {
            applyStandardAlgorithmMoves(movesSequence);
          }
        }
      }
    } else {
      setParamsForNextLayer();
      state = "yellowCornersFacesStarted";
      print("moved yellow corner cubies in the right place\n");
      print("solving yellow corner faces...");
    }
  }

  private boolean standardAlgorithmFinished() {
    return standardAlgorithmMoveIndexCounter > 7;
  }

  private void checkForYellowCornersAlreadyInTheRightPosition() {
    if (redYellowBlueCorner.x == -1 && redYellowBlueCorner.y == -1 && redYellowBlueCorner.z == -1) {
      setToSolved(redYellowBlueCorner);
    }
    if (redYellowGreenCorner.x == -1 && redYellowGreenCorner.y == -1 && redYellowGreenCorner.z == 1) {
      setToSolved(redYellowGreenCorner);
    }
    if (orangeYellowBlueCorner.x == 1 && orangeYellowBlueCorner.y == -1 && orangeYellowBlueCorner.z == -1) {
      setToSolved(orangeYellowBlueCorner);
    }
    if (orangeYellowGreenCorner.x == 1 && orangeYellowGreenCorner.y == -1 && orangeYellowGreenCorner.z == 1 ) {
      setToSolved(orangeYellowGreenCorner);
    }
  }

  private boolean thereAreNoSolvedYellowCornerCubies() {
    return ( !isSolved(redYellowBlueCorner) && !isSolved(redYellowGreenCorner)  && !isSolved(orangeYellowBlueCorner) && !isSolved(orangeYellowGreenCorner));
  }
}
