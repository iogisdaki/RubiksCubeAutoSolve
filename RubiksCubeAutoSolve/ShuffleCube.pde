Move[] allMoves = {
  turnBottomRowLeft,
  turnBottomRowRight,
  turnTopRowLeft,
  turnTopRowRight,
  turnRightRowUp,
  turnRightRowDown,
  turnLeftRownUp,
  turnLeftRowDown,
  turnFrontRowRight,
  turnFrontRowLeft,
  turnBacktRowRight,
  turnBackRowLeft,
};

ArrayList < Move > sequence = new ArrayList < Move > ();

void makeRandomMoveSequence() {
  for (int i = 0; i < 50; i++) {
    int r = int(random(allMoves.length));
    Move m = allMoves[r];
    sequence.add(m);
  }
}

void shuffleCube() {
  if (shuffleMoveIndex < sequence.size()-1) {
    shuffleMoveIndex++;
    currentMove = sequence.get(shuffleMoveIndex);
    currentMove.start();
  } else {
    state = "";
    userAllowedToEnterInput = true;
    print("shuffling done\n\n");
    solved = false;
  }
}
