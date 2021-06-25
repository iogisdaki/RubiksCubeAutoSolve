void keyPressed() {
  if (key == ' ') {
    if (solved && userAllowedToEnterInput) {
      state = "shuffleStarted";
      currentMove.start();
      userAllowedToEnterInput = false;
      print("shuffling...");
    }
  }

  if (key == 's') {
    if (!solved && userAllowedToEnterInput) {
      state = "daisyStarted";
      currentMove.start();
      userAllowedToEnterInput = false;
      print("doing white daisy...");
    }
  }
}
