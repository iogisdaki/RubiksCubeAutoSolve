//white cross
//looking at each white edge of the daisy and its second colour and then
//turning the it so as to go to the bottom and form a white cross
//when its done it will be correct acording to both its colours

class WhiteCross extends SolutionAlgorithm{
  int secondMoveIndexCounter = 0;

  void solve() {

    Cubie[] whiteEdges = {redWhiteEdge, whiteBlueEdge, whiteGreenEdge, orangeWhiteEdge};

    if (!allCubesOfThisLayerDone()) {

      Cubie currentCubieGettingChecked = whiteEdges[currentCubeIndexCounter];

      int x = currentCubieGettingChecked.x;
      int y = currentCubieGettingChecked.y;
      int z = currentCubieGettingChecked.z;

      if (secondMoveIndexCounter == 0) {
        if (x == -1 && y == -1 && z == 0) {//1
          if (currentCubieGettingChecked == redWhiteEdge) {
            doMove(turnLeftRowDown);
            secondMoveIndexCounter = 7;
          } else if (currentCubieGettingChecked == whiteBlueEdge) {
            doMove(turnTopRowLeft);
          } else if (currentCubieGettingChecked == whiteGreenEdge) {
            doMove(turnTopRowRight);
          } else if (currentCubieGettingChecked == orangeWhiteEdge) {
            doMove(turnTopRowRight);
          }
        } else if (x == 0 && y == -1 && z == -1) {//2
          if (currentCubieGettingChecked == redWhiteEdge) {
            doMove(turnTopRowRight);
          } else if (currentCubieGettingChecked == whiteBlueEdge) {
            doMove(turnBackRowLeft);
            secondMoveIndexCounter = 15;
          } else if (currentCubieGettingChecked == whiteGreenEdge) {
            doMove(turnTopRowRight);
          } else if (currentCubieGettingChecked == orangeWhiteEdge) {
            doMove(turnTopRowLeft);
          }
        } else if (x == 1 && y == -1 && z == 0) {//3
          if (currentCubieGettingChecked == redWhiteEdge) {
            doMove(turnTopRowRight);
          } else if (currentCubieGettingChecked == whiteBlueEdge) {
            doMove(turnTopRowRight);
          } else if (currentCubieGettingChecked == whiteGreenEdge) {
            doMove(turnTopRowLeft);
          } else if (currentCubieGettingChecked == orangeWhiteEdge) {
            doMove(turnRightRowDown);
            secondMoveIndexCounter = 25;
          }
        } else if (x == 0 && y == -1 && z == 1) {//4
          if (currentCubieGettingChecked == redWhiteEdge) {
            doMove(turnTopRowLeft);
          } else if (currentCubieGettingChecked == whiteBlueEdge) {
            doMove(turnTopRowRight);
          } else if (currentCubieGettingChecked == whiteGreenEdge) {
            doMove(turnFrontRowLeft);
            secondMoveIndexCounter = 17;
          } else if (currentCubieGettingChecked == orangeWhiteEdge) {
            doMove(turnTopRowRight);
          }
        }
      } else if (secondMoveIndexCounter == 7) {
        doMove(turnLeftRowDown);
        secondMoveIndexCounter = 0;
        currentCubeIndexCounter++;
      } else if (secondMoveIndexCounter == 15) {
        doMove(turnBackRowLeft);
        secondMoveIndexCounter = 0;
        currentCubeIndexCounter++;
      } else if (secondMoveIndexCounter == 17) {
        doMove(turnFrontRowLeft);
        secondMoveIndexCounter = 0;
        currentCubeIndexCounter++;
      } else if (secondMoveIndexCounter == 25) {
        doMove(turnRightRowDown);
        secondMoveIndexCounter = 0;
        currentCubeIndexCounter++;
      }
    } else {
      state = "whiteCornersStarted";
      setParamsForNextLayer();
      setArrayToFalse(currentLayerCubiesSolved);
      print("white cross done\n");
      print("doing white corners...");
    }
  }
}
