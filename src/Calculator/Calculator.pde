// ldyan cheng | Sept 14 2026 | Calculator

String displayVal;
float l, r, result;
char op;
boolean left, newEntry;

Button[] numButtons = new Button[10];
Button[] opButtons = new Button[12];

void setup() {
  size(300, 400);
  displayVal = "0.0";
  l = 0.0;
  r = 0.0;
  result = 0.0;
  op = '0';
  left = true;
  newEntry = true;

  numButtons[0] = new Button(50, 350, '0');
  numButtons[1] = new Button(50, 300, '1');
  numButtons[2] = new Button(110, 300, '2');
  numButtons[3] = new Button(170, 300, '3');
  numButtons[4] = new Button(50, 240, '4');
  numButtons[5] = new Button(110, 240, '5');
  numButtons[6] = new Button(170, 240, '6');
  numButtons[7] = new Button(50, 180, '7');
  numButtons[8] = new Button(110, 180, '8');
  numButtons[9] = new Button(170, 180, '9');

  opButtons[0] = new Button(230, 180, '+');
  opButtons[1] = new Button(230, 240, '-');
  opButtons[2] = new Button(230, 300, 'x');
  opButtons[3] = new Button(230, 350, '÷');
  opButtons[4] = new Button(230, 120, '±');
  opButtons[5] = new Button(50, 120, 'C');
  opButtons[6] = new Button(110, 350, '.');
  opButtons[7] = new Button(170, 350, '=');
  opButtons[8] = new Button(110, 120, 'q');
  opButtons[9] = new Button(170, 120, 's');
  opButtons[10] = new Button(35, 30, ' ');
  opButtons[11] = new Button(35, 75, ' ');
}

void draw() {
  background(#1E1E24);
  updateDisplay();
  for (int i = 0; i < numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].mouseOver(mouseX, mouseY);
  }
  for (int i = 0; i < opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].mouseOver(mouseX, mouseY);
  }
}

void updateDisplay() {
  rectMode(CENTER);
  fill(#FFFFFF);
  rect(180, 50, 200, 50, 100);

  fill(0);
  textAlign(RIGHT);
  text(displayVal, 250, 50);
}

void printState() {
  println(
    "l: " + l +
    " | r: " + r +
    " | result: " + result +
    " | left: " + left +
    " | op: " + op +
    " | display: " + displayVal
  );
}

void mouseReleased() {
  for (int i = 0; i < numButtons.length; i++) {
    if (numButtons[i].hover == true) {
      String digit = str(numButtons[i].val);

      if (newEntry || displayVal.equals("0.0")) {
        displayVal = digit;
        newEntry = false;
      } else {
        displayVal += digit;
      }
      if (left) {
        l = float(displayVal);
      } else {
        r = float(displayVal);
      }
    }
  }

  for (int i = 0; i < opButtons.length; i++) {
    if (opButtons[i].hover == true) {
      char clicked = opButtons[i].val;

      if (clicked == '=') {
        performCal();
      } else if (clicked == '+' || clicked == '-' || clicked == 'x' || clicked == '÷') {
        op = clicked;
        left = false;
        newEntry = true;
        displayVal += str(op);
      } else if (clicked == '±') {
        toggleSign();
      } else if (clicked == 'C') {
        displayVal = "0.0";
        l = 0.0;
        r = 0.0;
        result = 0.0;
        op = '0';
        left = true;
        newEntry = true;
      } else if (clicked == 'q') {
        if (left == true) {
          l = sqrt(l);
          displayVal = str(l);
        } else {
          r = sqrt(r);
          displayVal = str(r);
        }
      } else if (clicked == 's') {
        if (left == true) {
          l = sq(l);
          displayVal = str(l);
        } else {
          r = sq(r);
          displayVal = str(r);
        }
      } else if (clicked == '.') {
        if (!displayVal.contains(".")) {
          if (left == true) {
            displayVal += ".";
            l = float(displayVal);
          } else {
            displayVal += ".";
            r = float(displayVal);
          }
        }
      }
    }
  }
  printState();
}

void toggleSign() {
  if (left) {
    result = l * -1;
  } else {
    result = r * -1;
  }
  displayVal = str(result);
}

void performCal() {
  if (op == '+') {
    result = l + r;
  } else if (op == '-') {
    result = l - r;
  } else if (op == '÷') {
    if (r == 0) {
      displayVal = "ERROR";
      newEntry = true;
      return;
    } else {
      result = l / r;
    }
  } else if (op == 'x') {
    result = l * r;
  } else {
    return;
  }
  displayVal = str(result);
}

void keyPressed() {
  if (key == '1') {
    println("You hit 1" + keyCode);
    handleEvent('1', true);
  } else if (key == '2') {
    println("You hit 2" + keyCode);
    handleEvent('2', true);
  } else if (key == '3') {
    println("You hit 3" + keyCode);
    handleEvent('3', true);
  } else if (key == '4') {
    println("You hit 4" + keyCode);
    handleEvent('4', true);
  } else if (key == '5') {
    println("You hit 5" + keyCode);
    handleEvent('5', true);
  } else if (key == '6') {
    println("You hit 6" + keyCode);
    handleEvent('6', true);
  } else if (key == '7') {
    println("You hit 7" + keyCode);
    handleEvent('7', true);
  } else if (key == '8') {
    println("You hit 8" + keyCode);
    handleEvent('8', true);
  } else if (key == '9') {
    println("You hit 9" + keyCode);
    handleEvent('9', true);
  } else if (key == '0') {
    println("You hit 0" + keyCode);
    handleEvent('0', true);
  } else if (key == '-') {
    println("You hit -" + keyCode);
    handleEvent('-', false);
  } else if (key == '+') {
    println("You hit +" + keyCode);
    handleEvent('+', false);
  } else if (key == 'x') {
    println("You hit x" + keyCode);
    handleEvent('x', false);
  } else if (key == '/') {
    println("You hit /" + keyCode);
    handleEvent('/', false);
  } else if (key == '.') {
    println("You hit ." + keyCode);
    handleEvent('.', false);
  } else if (key == 'c') {
    println("You hit c" + keyCode);
    handleEvent('c', false);
  }
}

void handleEvent(char val, boolean isNum) {
  if (isNum) {
    String digit = str(val);

    if (newEntry || displayVal.equals("0.0")) {
      displayVal = digit;
      newEntry = false;
    } else {
      displayVal += digit;
    }

    if (left) {
      l = float(displayVal);
    } else {
      r = float(displayVal);
    }
  } else {

  }
}
