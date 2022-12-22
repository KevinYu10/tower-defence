class Gif {

  int x, y, h, w;
  String before, after;
  int numFrame, speed;
  PImage[] g, b;
  int n;
  int i = 0;
  int check;

  Gif(String _before, String _after, int _numFrame, int _speed, int _x, int _y) {
    before = _before;
    after = _after;
    n = _numFrame;
    speed = _speed;
    x = _x;
    y = _y;
    check = 0;

    g = new PImage[n];
    int i = 0;
    while (i<n) {
      g[i] = loadImage(before+i+after);
      i++;
    }
  }

  Gif(String _before, String _after, int _numFrame, int _speed, int _x, int _y, int _w, int _h) {
    before = _before;
    after = _after;
    n = _numFrame;
    speed = _speed;
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    check = 1;

    g = new PImage[n];
    int i = 0;
    while (i<n) {
      g[i] = loadImage(before+i+after);
      i++;
    }
  }

  void show() {
    if (check == 1) {
      drawPond();
    } else {
      drawBanana();
    }
  }

  void drawPond() {
    imageMode(CENTER);
    image(g[i], x, y, w, h);
    if (frameCount % speed == 0) i++;
    if (i == n) i = 0;
  }
  void drawBanana() {
    imageMode(CENTER);
    image(g[i], x, y);
    if (frameCount % speed == 0) i++;
    if (i == n) i = 0;
  }
}
