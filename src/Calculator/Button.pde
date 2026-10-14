class Button {
  float x, y, w, h;
  color c1, c2;
  char val;
  boolean hover;

  Button(float x, float y, char val) {
    this.x = x;
    this.y = y;
    w = 40;
    h = 40;
    c1 = color(#505373);
    c2 = color(#8D99AE);
    this.val = val;
    hover = false;
  }

  void display() {
    if (hover) {
      fill(c1);
    } else {
      fill(c2);
    }
    rectMode(CENTER);
    rect(x, y, w, h, 10);
    fill(#FFFFFF);
    if (val == 's') {
      text("x²", x, y);
    } else if (val == 'q') {
      text("√x", x, y);
    } else {
      text(val, x, y);
    }
  }

  void mouseOver(float tempX, float tempY) {
    if (tempX > x - w/2 && tempX < x + w/2 && tempY > y - h/2 && tempY < y + h/2) {
      hover = true;
    } else {
      hover = false;
    }
  }
}
