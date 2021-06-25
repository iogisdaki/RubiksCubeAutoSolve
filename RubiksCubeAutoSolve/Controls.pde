                                //x, y, z, dir
Move turnBottomRowLeft = new Move(0, 1, 0, 1);//y axis is flipped so y = -1 is the top and y = 1 is the bottom 
Move turnBottomRowRight = new Move(0, 1, 0, -1);
Move turnTopRowLeft = new Move(0, -1, 0, 1);
Move turnTopRowRight = new Move(0, -1, 0, -1);
Move turnRightRowUp = new Move(1, 0, 0, 1);
Move turnRightRowDown = new Move(1, 0, 0, -1);
Move turnLeftRownUp = new Move(-1, 0, 0, 1);
Move turnLeftRowDown = new Move(-1, 0, 0, -1);
Move turnFrontRowRight = new Move(0, 0, 1, 1);
Move turnFrontRowLeft = new Move(0, 0, 1, -1);
Move turnBacktRowRight = new Move(0, 0, -1, 1);
Move turnBackRowLeft = new Move(0, 0, -1, -1);

void doMove(Move move) {
  currentMove = move;
  currentMove.start();
}

void applyStandardAlgorithmMoves(Move[] moveSequence) {
  currentMove = moveSequence[standardAlgorithmMoveIndexCounter];
  currentMove.start();
  standardAlgorithmMoveIndexCounter++;
}
