abstract class SolutionAlgorithm { //inheritance for code reuse yikes I know Im sorry Im lazy and this is just for fun

  abstract void solve();

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
}
