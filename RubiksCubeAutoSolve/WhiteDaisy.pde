//white daisy
//looking at where every white edge is and turning it accordingly so as to move on top and form the daisy
//it doesnt matter about the white edge's second colour
//when one gets in the right position it saves it and turns the cube accordingly so as not to ruin it

//y axis is flipped, meaning when y = -1 the cubie is at the top and when y = 1 the cubie is at the bottom

class WhiteDaisy extends SolutionAlgorithm{
  void solve() {

    Cubie[] whiteEdges = {redWhiteEdge, whiteBlueEdge, whiteGreenEdge, orangeWhiteEdge};

    setCurrentLayerCubies(whiteEdges);
    setArrayToFalse(currentLayerCubiesSolved);
    checkForWhiteEdgesAlreadyFacingDown();

    if (thereAreUnsolvedCubiesInThisLayer()) {

      Cubie currentCubieGettingChecked = whiteEdges[currentCubeIndexCounter];

      int x = currentCubieGettingChecked.x;
      int y = currentCubieGettingChecked.y;
      int z = currentCubieGettingChecked.z;

      PVector normal = currentCubieGettingChecked.whiteFace.normal;

      // check position of every white edge cubie and turn cube accordingly
      if (x == -1  && y == 0 && z == 1) {//1
        if (normal.x == 0 && normal.y == 0 && normal.z == 1) {
          if (isSolved(redWhiteEdge)) {
            doMove(turnTopRowRight);
          } else if (!isSolved(redWhiteEdge)) {
            doMove(turnLeftRownUp);
          }
        } else if (normal.x == -1 && normal.y == 0 && normal.z == 0) {
          if (currentLayerCubiesSolved[3]) {
            doMove(turnTopRowRight);
          } else if (!currentLayerCubiesSolved[3]) {
            doMove(turnFrontRowRight);
          }
        }
      } else if (x == 0  && y == -1 && z == 1 ) {//2
        if (normal.x == 0 && normal.y == 0 && normal.z == 1) {
          doMove(turnFrontRowRight);
        } else if (normal.x == 0 && normal.y == -1 && normal.z == 0) {
          currentCubeIndexCounter++;
        }
      } else if (x == 0  && y == 1 && z == 1) {//3
        if (normal.x == 0 && normal.y == 0 && normal.z == 1) {
          if (currentLayerCubiesSolved[3]) {
            doMove(turnTopRowRight);
          } else if (!currentLayerCubiesSolved[3]) {
            doMove(turnFrontRowRight);
          }
        } else if (normal.x == 0 && normal.y == 1 && normal.z == 0) {
          if (currentLayerCubiesSolved[3]) {
            doMove(turnTopRowRight);
          } else if (!currentLayerCubiesSolved[3]) {
            doMove(turnFrontRowRight);
          }
        }
      } else if (x == 1  && y == 0 && z == 1) {//4
        if (normal.x == 0 && normal.y == 0 && normal.z == 1) {
          if (currentLayerCubiesSolved[2]) {
            doMove(turnTopRowRight);
          } else if (!currentLayerCubiesSolved[2]) {
            doMove(turnRightRowUp);
          }
        } else if (normal.x == 1 && normal.y == 0 && normal.z == 0) {
          if (currentLayerCubiesSolved[3]) {
            doMove(turnTopRowRight);
          } else if (!currentLayerCubiesSolved[3]) {
            doMove(turnFrontRowLeft);
          }
        }
      } else if (x == -1  && y == 1 && z == 0) {//5
        if (normal.x == -1 && normal.y == 0 && normal.z == 0) {
          if (isSolved(redWhiteEdge)) {
            doMove(turnTopRowRight);
          } else if (!isSolved(redWhiteEdge)) {
            doMove(turnLeftRownUp);
          }
        } else if (normal.x == 0 && normal.y == 1 && normal.z == 0) {
          if (isSolved(redWhiteEdge)) {
            doMove(turnTopRowRight);
          } else if (!isSolved(redWhiteEdge)) {
            doMove(turnLeftRownUp);
          }
        }
      } else if (x == 1  && y == -1 && z == 0) {//6
        if (normal.x == 1 && normal.y == 0 && normal.z == 0) {
          doMove(turnRightRowDown);
        } else if (normal.x == 0 && normal.y == -1 && normal.z == 0) {
          currentCubeIndexCounter++;
        }
      } else if (x == -1  && y == -1 && z == 0) {//7
        if (normal.x == -1 && normal.y == 0 && normal.z == 0) {
          doMove(turnLeftRowDown);
        } else if (normal.x == 0 && normal.y == -1 && normal.z == 0) {
          currentCubeIndexCounter++;
        }
      } else if (x == 1  && y == 1 && z == 0) {//8
        if (normal.x == 1 && normal.y == 0 && normal.z == 0) {
          if (currentLayerCubiesSolved[2]) {
            doMove(turnTopRowRight);
          } else if (!currentLayerCubiesSolved[2]) {
            doMove(turnRightRowUp);
          }
        } else if (normal.x == 0 && normal.y == 1 && normal.z == 0) {
          if (currentLayerCubiesSolved[2]) {
            doMove(turnTopRowRight);
          } else if (!currentLayerCubiesSolved[2]) {
            doMove(turnRightRowUp);
          }
        }
      } else if (x == -1  && y == 0 && z == -1) {//9
        if (normal.x == -1 && normal.y == 0 && normal.z == 0) {
          if (currentLayerCubiesSolved[1]) {
            doMove(turnTopRowRight);
          } else if (!currentLayerCubiesSolved[1]) {
            doMove(turnBacktRowRight);
          }
        } else if (normal.x == 0 && normal.y == 0 && normal.z == -1) {
          if (isSolved(redWhiteEdge)) {
            doMove(turnTopRowRight);
          } else if (!isSolved(redWhiteEdge)) {
            doMove(turnLeftRowDown);
          }
        }
      } else if (x == 1  && y == 0 && z == -1) {//10
        if (normal.x == 0 && normal.y == 0 && normal.z == -1) {
          if (currentLayerCubiesSolved[2]) {
            doMove(turnTopRowRight);
          } else if (!currentLayerCubiesSolved[2]) {
            doMove(turnRightRowDown);
          }
        } else if (normal.x == 1 && normal.y == 0 && normal.z == 0) {
          if (currentLayerCubiesSolved[1]) {
            doMove(turnTopRowRight);
          } else if (!currentLayerCubiesSolved[1]) {
            doMove(turnBackRowLeft);
          }
        }
      } else if (x == 0  && y == 1 && z == -1) {//11
        if (normal.x == 0 && normal.y == 0 && normal.z == -1) {
          if (currentLayerCubiesSolved[1]) {
            doMove(turnTopRowRight);
          } else if (!currentLayerCubiesSolved[1]) {
            doMove(turnBackRowLeft);
          }
        } else if (normal.x == 0 && normal.y == 1 && normal.z == 0) {
          if (currentLayerCubiesSolved[1]) {
            doMove(turnTopRowRight);
          } else if (!currentLayerCubiesSolved[1]) {
            doMove(turnBackRowLeft);
          }
        }
      } else if (x == 0  && y == -1 && z == -1) {//12
        if (normal.x == 0 && normal.y == 0 && normal.z == -1) {
          doMove(turnBackRowLeft);
        } else if (normal.x == 0 && normal.y == -1 && normal.z == 0) {
          currentCubeIndexCounter++;
        }
      }
    } else {
      setParamsForNextLayer();
      state = "whiteCrossStarted";
      print("white daisy done\n");
      print("doing white cross...");
    }
  }

  private void checkForWhiteEdgesAlreadyFacingDown() {
    Cubie[] whiteEdges = {redWhiteEdge, whiteBlueEdge, whiteGreenEdge, orangeWhiteEdge};
    for (int counter = 0; counter < 4; counter++) {
      if (whiteEdges[counter].x == -1 && whiteEdges[counter].y == -1 && whiteEdges[counter].z == 0 && whiteEdges[counter].whiteFace.normal.x == 0 && whiteEdges[counter].whiteFace.normal.y == -1 && whiteEdges[counter].whiteFace.normal.z == 0) {
        setToSolved(redWhiteEdge);
      }
      if (whiteEdges[counter].x == 0 && whiteEdges[counter].y == -1 && whiteEdges[counter].z == -1 && whiteEdges[counter].whiteFace.normal.x == 0 && whiteEdges[counter].whiteFace.normal.y == -1 && whiteEdges[counter].whiteFace.normal.z == 0) {
        setToSolved(whiteBlueEdge);
      }
      if (whiteEdges[counter].x == 1 && whiteEdges[counter].y == -1 && whiteEdges[counter].z == 0 && whiteEdges[counter].whiteFace.normal.x == 0 && whiteEdges[counter].whiteFace.normal.y == -1 && whiteEdges[counter].whiteFace.normal.z == 0 ) {
        setToSolved(whiteGreenEdge);
      }
      if (whiteEdges[counter].x == 0 && whiteEdges[counter].y == -1 && whiteEdges[counter].z == 1 && whiteEdges[counter].whiteFace.normal.x == 0 && whiteEdges[counter].whiteFace.normal.y == -1 && whiteEdges[counter].whiteFace.normal.z == 0) {
        setToSolved(orangeWhiteEdge);
      }
    }
  }
}
