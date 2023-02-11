void main() {
  Frame f = new Frame.create();
  print(f);
}

class Point {
  int x = 0;
  int y = 0;

  Point([int x = 0, int y = 0]) {
    this.x = x;
    this.y = y;
  }

  int get get_x {
    return this.x;
  }

  int get get_y {
    return this.y;
  }
}

class Size {
  int w = 0;
  int h = 0;

  set set_w(int w) {
    if (w < 0) throw Exception('Size cannot have negative value');
    this.w = w;
  }

  set set_h(int h) {
    if (h < 0) throw Exception('Size cannot have negative value');
    this.h = h;
  }

  int get get_w {
    return this.w;
  }

  int get get_h {
    return this.w;
  }

  Size.Zero() {
    this.w = 0;
    this.h = 0;
  }
  factory Size(int w, int h) {
    if (w < 0 || h < 0) throw Exception('Size cannot have negative values');
    return Size(w, h);
  }
}

class Frame {
  Point position = new Point();
  Size size = new Size.Zero();

  Point get get_position {
    return this.position;
  }

  Size get get_size {
    return this.size;
  }

  set set_position(Point p) {
    this.position = p;
  }

  set set_size(Size s) {
    this.size = s;
  }

  int get get_x {
    return this.position.get_x;
  }

  int get get_y {
    return this.position.get_y;
  }

  int get get_w {
    return this.size.get_w;
  }

  int get get_h {
    return this.size.get_h;
  }

  factory Frame(int x, int y, int w, int h) {
    if (w < 0 || h < 0) throw Exception('Size cannot have negative values');
    return Frame(x, y, w, h);
  }

  Frame.create() {
    this.position = new Point(0, 0);
    this.size = new Size.Zero();
  }
}
