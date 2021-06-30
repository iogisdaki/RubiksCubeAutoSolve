//yellow edges
//check if the yellow edges are in the right place according to their second colour if not there are three cases
//if theres no or one yellow edges solved turn the top row right until two get in the right position
//if the two solved are adjacent hold the cube so that ones on the back and ones at the right and do the algorithm from that perspective
//if the two solved are across from each other it doesnt matter the perspective you do the algorithm from
//the algotithm: right-up, up-left, right-down, up-left, right-down, up-left, right-up,up-right,up-right,right-down

class YellowEdges extends SolutionAlgorithm{
  void solve() {

    setArrayToFalse(currentLayerCubiesSolved);
    checkForYellowEdgesAlreadyInTheRightPosition();

    if (thereAreUnsolvedCubiesInThisLayer()) {
      if (standardAlgorithmIndex == 0) {

        standardAlgorithmMoveIndexCounter = 0;

        //three cases
        //no or one edge solved
        //2 adjacent edges solved
        //2 across edges solved

        //no or one edges
        if (oneOrTwoCubiesSolved()) {
          doMove(turnTopRowRight);
        }
        //2 djacent edges
        else if (isSolved(redYellowEdge) && isSolved(yellowBlueEdge) && !isSolved(orangeYellowEdge)  && !isSolved(yellowGreenEdge)) {//red blue
          standardAlgorithmIndex = 1;
        } else if (isSolved(redYellowEdge) && isSolved(yellowGreenEdge) && !isSolved(orangeYellowEdge) && !isSolved(yellowBlueEdge)) {//red green
          standardAlgorithmIndex = 2;
        } else if (isSolved(orangeYellowEdge) && isSolved(yellowBlueEdge) && !isSolved(redYellowEdge) && !isSolved(yellowGreenEdge)) {//orange blue
          standardAlgorithmIndex = 3;
        } else if (isSolved(orangeYellowEdge) && isSolved(yellowGreenEdge) && !isSolved(redYellowEdge) && !isSolved(yellowBlueEdge)) {//orange green
          standardAlgorithmIndex = 4;
        }
        //2 across edges
        else if (isSolved(yellowBlueEdge) && isSolved(yellowGreenEdge)  && !isSolved(redYellowEdge) && !isSolved(orangeYellowEdge)) {//blue green
          standardAlgorithmIndex = 3;
        } else if (isSolved(redYellowEdge) && isSolved(orangeYellowEdge) && !isSolved(yellowBlueEdge) && !isSolved(yellowGreenEdge)) {//red orange
          standardAlgorithmIndex = 3;
        }
      } else if (standardAlgorithmIndex == 1) {
        if (currentMove.finished()) {
          Move[] movesSequence = {turnBackRowLeft, turnTopRowLeft, turnBacktRowRight, turnTopRowLeft, turnBackRowLeft, turnTopRowRight, turnTopRowRight, turnBacktRowRight};
          if (standardAlgorithmFinished()) {
            standardAlgorithmIndex = 0;
          } else {
            applyStandardAlgorithmMoves(movesSequence);
          }
        }
      } else if (standardAlgorithmIndex == 2) {
        if (currentMove.finished()) {
          Move[] movesSequence = {turnLeftRowDown, turnTopRowLeft, turnLeftRownUp, turnTopRowLeft, turnLeftRowDown, turnTopRowRight, turnTopRowRight, turnLeftRownUp};
          if (standardAlgorithmFinished()) {
            standardAlgorithmIndex = 0;
          } else {
            applyStandardAlgorithmMoves(movesSequence);
          }
        }
      } else if (standardAlgorithmIndex == 3) {
        if (currentMove.finished()) {
          Move[] movesSequence = {turnRightRowUp, turnTopRowLeft, turnRightRowDown, turnTopRowLeft, turnRightRowUp, turnTopRowRight, turnTopRowRight, turnRightRowDown};
          if (standardAlgorithmFinished()) {
            standardAlgorithmIndex = 0;
          } else {
            applyStandardAlgorithmMoves(movesSequence);
          }
        }
      } else if (standardAlgorithmIndex == 4) {
        if (currentMove.finished()) {
          Move[] movesSequence = {turnFrontRowRight, turnTopRowLeft, turnFrontRowLeft, turnTopRowLeft, turnFrontRowRight, turnTopRowRight, turnTopRowRight, turnFrontRowLeft};
          if (standardAlgorithmFinished()) {
            standardAlgorithmIndex = 0;
          } else {
            applyStandardAlgorithmMoves(movesSequence);
          }
        }
      }
    } else {
      setParamsForNextLayer();
      state = "yellowCornersCubiesStarted";
      print("yellow edges done\n");
      print("moving yellow corners to the right place...");
    }
  }

  private void checkForYellowEdgesAlreadyInTheRightPosition() {
    if (redYellowEdge.x == -1 && redYellowEdge.y == -1 && redYellowEdge.z == 0) {
      setToSolved(redYellowEdge);
    }
    if (yellowBlueEdge.x == 0 && yellowBlueEdge.y == -1 && yellowBlueEdge.z == -1 ) {
      setToSolved(yellowBlueEdge);
    }
    if (yellowGreenEdge.x == 0 && yellowGreenEdge.y == -1 && yellowGreenEdge.z == 1 ) {
      setToSolved(yellowGreenEdge);
    }
    if (orangeYellowEdge.x == 1 && orangeYellowEdge.y == -1 && orangeYellowEdge.z == 0 ) {
      setToSolved(orangeYellowEdge);
    }
  }

  private boolean standardAlgorithmFinished() {
    return standardAlgorithmMoveIndexCounter > 7;
  }
}
