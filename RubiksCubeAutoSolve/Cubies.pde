//index  x   y   z   type        colours
Cubie redYellowBlueCorner;      //  0   -1  -1  -1   corner      red,yellow,blue
Cubie redYellowEdge;            //  1   -1  -1   0   edge        red,yellow
Cubie redYellowGreenCorner;     //  2   -1  -1   1   corner      red,yellow,green
Cubie redBlueEdge;              //  3   -1   0  -1   edge        red,blue
Cubie redMiddleCubie;           //  4   -1   0   0   middle      red
Cubie redGreenEdge;             //  5   -1   0   1   edge        red,green
Cubie redWhiteBlueCorner;       //  6   -1   1  -1   corner      red,white,blue
Cubie redWhiteEdge;             //  7   -1   1   0   edge        red,white
Cubie redWhiteGreenCorner;      //  8   -1   1   1   corner      red,white,green
Cubie yellowBlueEdge;           //  9    0  -1  -1   edge        yellow,blue
Cubie yellowMiddleCubie;        //  10   0  -1   0   middle      yellow
Cubie yellowGreenEdge;          //  11   0  -1   1   edge        yellow,green
Cubie blueMiddleCubie;          //  12   0   0  -1   middle      blue
Cubie centerCubie;              //  13   0   0   0   center      (no visible faces)
Cubie greenMiddleCubie;         //  14   0   0   1   middle      green
Cubie whiteBlueEdge;            //  15   0   1  -1   edge        white,blue
Cubie whiteMiddleCubie;         //  16   0   1   0   middle      white
Cubie whiteGreenEdge;           //  17   0   1   1   edge        white,green
Cubie orangeYellowBlueCorner;   //  18   1  -1  -1   corner      orange,yellow,blue
Cubie orangeYellowEdge;         //  19   1  -1   0   edge        orange,yellow
Cubie orangeYellowGreenCorner;  //  20   1  -1   1   corner      orange,yellow,green
Cubie orangeBlueEdge;           //  21   1   0  -1   edge        orange,blue
Cubie orangeMiddleCubie;        //  22   1   0   0   middle      orange
Cubie orangeGreenEdge;          //  23   1   0   1   edge        orange,green
Cubie orangeWhiteBlueCorner;    //  24   1   1  -1   corner      orange,white,blue
Cubie orangeWhiteEdge;          //  25   1   1   0   edge        orange,white
Cubie orangeWhiteGreenCorner;   //  26   1   1   1   corner      orange,white,green

Cubie[] cube = new Cubie[27];

void initializeCubiePositionMatrix() {
  int index=0;
  for (int x = -1; x <= 1; x++) {
    for (int y = -1; y <=1; y++) {
      for (int z =-1; z <= 1; z++) {
        PMatrix3D matrix = new PMatrix3D();//make a matrix object for each cubie
        matrix.translate(x, y, z);
        cube[index] = new Cubie(matrix, x, y, z);//pass the matrix position to define each cubie
        index++;
      }
    }
  }
  updateCubeNames();
}

//a bit awkward I know but I want to be able to know the colours of the cubie
void updateCubeNames() {
  redYellowBlueCorner = cube[0];
  redYellowEdge = cube[1];
  redYellowGreenCorner = cube[2];
  redBlueEdge = cube[3];
  redMiddleCubie = cube[4];
  redGreenEdge = cube[5];
  redWhiteBlueCorner = cube[6];
  redWhiteEdge = cube[7];
  redWhiteGreenCorner = cube[8];
  yellowBlueEdge = cube[9];
  yellowMiddleCubie = cube[10];
  yellowGreenEdge = cube[11];
  blueMiddleCubie = cube[12];
  centerCubie = cube[13];
  greenMiddleCubie = cube[14];
  whiteBlueEdge = cube[15];
  whiteMiddleCubie = cube[16];
  whiteGreenEdge = cube[17];
  orangeYellowBlueCorner = cube[18];
  orangeYellowEdge = cube[19];
  orangeYellowGreenCorner = cube[20];
  orangeBlueEdge = cube[21];
  orangeMiddleCubie = cube[22];
  orangeGreenEdge = cube[23];
  orangeWhiteBlueCorner = cube[24];
  orangeWhiteEdge = cube[25];
  orangeWhiteGreenCorner = cube[26];
}
