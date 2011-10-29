void checkLetters() {

  if (count < lineLength) {

    switch (allChars[count]) {
    case 'A':
      frequency=10;
      break;
    case 'B':
      frequency=20;
      break;
    case 'C':
      frequency=30;
      break;
    case 'D':
      frequency=40;
      break;
    case 'E':
      frequency=50;
      break;
    case 'F':
      frequency=60;
      break;
    case 'G':
      frequency=70;
      break;
    case 'H':
      frequency=80;
      break;
    case 'I':
      frequency=90;
      break;
    case 'J':
      frequency=100;
      break;
    case 'K':
      frequency=110;
      break;
    case 'L':
      frequency=120;
      break;
    case 'M':
      frequency=130;
      break;
    case 'N':
      frequency=140;
      break;
    case 'O':
      frequency=150;
      break;
    case 'P':
      frequency=160;
      break;
    case 'Q':
      frequency=170;
      break;
    case 'R':
      frequency=180;
      break;
    case 'S':
      frequency=190;
      break;
    case 'T':
      frequency=200;
      break;
    case 'U':
      frequency=210;
      break;
    case 'V':
      frequency=220;
      break;
    case 'W':
      frequency=230;
      break;
    case 'X':
      frequency=240;
      break;
    case 'Y':
      frequency=250;
      break;
    case 'Z':
      frequency=260;
      break;
    case ' ':
      frequency=0;
      break;
    }


    count ++;
  }

  if (count >= lineLength) {
    count = 0;
  }
}

